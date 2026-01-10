# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Mandatory Rules

1. **BEFORE any bug fix** → use `superpowers:systematic-debugging`
2. **BEFORE any new code** → use `superpowers:brainstorming`
3. **KISS** → ask "what is the simplest solution?" before coding
4. **Centralize** → ask "where is the right place for this logic?" before adding code
5. **Spacing** → use `spacing` on Column/Row instead of `SizedBox(height/width: ...)`

## Project Overview

Monn is a personal investment tracking and analysis Flutter app that tracks multiple investment types: cryptocurrency, PEA (French stock account), REIT, crowdfunding, cash, Counter-Strike items, and savings books.

## Common Commands

### Code Generation
```bash
# Run code generation for all generators (freezed, riverpod, json_serializable, retrofit, isar)
puro flutter pub run build_runner build

# Watch mode for continuous generation during development
puro flutter pub run build_runner watch

# Clean and rebuild (use when generators get stuck)
puro flutter pub run build_runner build --delete-conflicting-outputs
```

### Localization
```bash
# Generate locale files
puro flutter pub run easy_localization:generate --source-dir "assets/translations"
puro flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir "assets/translations"
```

### Build
```bash
# Build APK with API keys
puro flutter build apk --dart-define-from-file=api_keys.json

# Run app with API keys
puro flutter run --dart-define-from-file=api_keys.json
```

### Testing
```bash
# Run all tests
puro flutter test

# Run specific test file
puro flutter test test/features/cryptocurrency/data/cryptocurrency_repository_test.dart

# Run tests with coverage
puro flutter test --coverage
```

### Linting
```bash
# Analyze code (uses very_good_analysis)
puro flutter analyze

# Custom lint (currently disabled in analysis_options.yaml)
# dart run custom_lint
```

## Architecture

### Feature-Based Structure

The app uses a **feature-first clean architecture** with three layers per feature:

```
lib/features/<feature_name>/
├── data/           # Repositories, API clients
├── domain/         # Entity models, form models
└── presentation/   # Screens, controllers
    └── <screen_name>/
        ├── controllers/  # Riverpod state management
        └── <screen_name>.dart
```

**Investment Features:**
- `cryptocurrency/` - Bitcoin, Ethereum tracking with CoinMarketCap API
- `pea/` - French stock account tracking with Alpha Vantage ETF API
- `reit/` - Real estate investment trusts with dividend tracking
- `crowdfunding/` - Crowdfunding investments
- `cash/` - Cash holdings
- `counter_strike/` - Counter-Strike item investments
- `savings_book/` - Traditional savings accounts

**Core Features:**
- `dashboard/` - Main screen with portfolio overview and reports
- `expenses/` - Monthly budget tracking with Sankey diagram visualization
- `amount/` - Transaction amount entry screen
- `settings/` - App settings (theme, backup)

### State Management - Riverpod 3

**CRITICAL: Riverpod 3 Provider Lifecycle Management**

In Riverpod 3.x, all `@riverpod` providers are **autodispose by default**. This is a breaking change from Riverpod 2.x and requires careful lifecycle management to avoid "Cannot use the Ref after it has been disposed" errors.

**Key Patterns:**

1. **Repository Providers** (keep-alive - never dispose):
```dart
@Riverpod(keepAlive: true)
CryptocurrencyRepository cryptocurrencyRepository(Ref ref) {
  return CryptocurrencyRepository(LocalDatabase().database);
}
```
Use `keepAlive: true` for singletons like repositories, API clients, and database instances.

2. **Stream Providers** (auto-dispose - default):
```dart
@riverpod
Stream<List<Cryptocurrency>> watchCryptocurrencies(Ref ref) {
  return ref.watch(cryptocurrencyRepositoryProvider).watchCryptocurrencies();
}
```
Stream providers auto-dispose when no longer watched, which is the desired behavior.

3. **Form Controllers** (unified pattern with Dart 3 records):
```dart
// Use Dart 3 records instead of Freezed for form state
typedef CryptoFormState = ({
  String amount,
  DateTime date,
  Cryptocurrency? crypto,
});

@Riverpod(keepAlive: true)
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoFormState build() => (amount: '', date: DateTime.now(), crypto: null);

  void update({String? amount, DateTime? date, Cryptocurrency? crypto}) {
    state = (
      amount: amount ?? state.amount,
      date: date ?? state.date,
      crypto: crypto ?? state.crypto,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(cryptocurrencyRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editCryptocurrency(
        crypto: state.crypto!..totalCrypto += double.parse(state.amount),
        transaction: CryptocurrencyTransaction()
          ..amount = double.parse(state.amount)
          ..date = state.date,
      ),
    );

    // CRITICAL: Always check ref.mounted after async operations
    if (!ref.mounted) return false;

    return !result.hasError;
  }
}
```

**IMPORTANT**: Form controllers:
- Use `keepAlive: true` to prevent premature disposal
- Use Dart 3 records (not Freezed) for simpler state
- Combine form state + update + submit in ONE controller
- Are manually invalidated after successful submit

**CRITICAL PATTERN**: After ANY async operation (`await`), check `if (!ref.mounted) return;` before accessing `ref` or `state`. This prevents errors when the provider disposes during the async gap.

**Manual Provider Invalidation After Submit:**
Since form controllers use `keepAlive: true`, they must be manually invalidated after successful submission:

```dart
MonnButton(
  text: context.tr(LocaleKeys.button_validate),
  onPressed: () async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final success = await ref
        .read(cashFormControllerProvider.notifier)
        .submit();

    if (!context.mounted || !success) return;

    ref.invalidate(cashFormControllerProvider);
    Navigator.pop(context);
  },
)
```

**IMPORTANT**: Never invalidate providers in `dispose()` method - this is unsafe because `ref` relies on `BuildContext` which is no longer valid when the widget is being unmounted. Always invalidate after successful operations instead.

**Navigation with KeepAlive Providers:**
When navigating to a generic widget (like `AmountScreen`) that uses callbacks, capture the notifier BEFORE navigation to prevent disposal:

```dart
onTap: () {
  // Capture notifier before navigation to prevent disposal during async operations
  final formNotifier = ref.read(cashFormControllerProvider.notifier);

  context.push(
    AmountScreen(
      onSubmit: () async {
        final success = await formNotifier.submit();
        if (!context.mounted || !success) return;
        Navigator.pop(context);
      },
    ),
  );
}
```

**Provider Invalidation Pattern:**
After mutations, invalidate affected providers:
```dart
ref
  ..invalidate(getCryptocurrencyProvider(formData.crypto!.type))
  ..invalidate(getCryptoPriceMarketProvider);
```

**Common Pitfalls to Avoid:**
- ❌ Don't use `ref.read()` inside callbacks without capturing the notifier first
- ❌ Don't forget `if (!ref.mounted) return;` after async operations
- ❌ Don't use empty `ref.listen()` calls - they serve no purpose and can cause disposal issues
- ❌ Don't use auto-dispose (`@riverpod`) for form controllers - use `@Riverpod(keepAlive: true)`
- ❌ Don't invalidate providers in `dispose()` method - `ref` is unsafe when widget is unmounting
- ❌ Don't use Freezed for form state - use Dart 3 records instead
- ✅ DO use `@Riverpod(keepAlive: true)` for form controllers
- ✅ DO manually invalidate providers after successful submit operations
- ✅ DO capture notifiers before navigation when using callbacks
- ✅ DO check `ref.mounted` after every async gap

### Database - Isar

**Initialization:**
Global singleton in `lib/shared/local/local_database.dart`:
```dart
late Isar _database;

class LocalDatabase {
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _database = await Isar.open([/* all schemas */], directory: dir.path);
  }
  Isar get database => _database;
}
```

**Entity Pattern:**
```dart
@collection
class Cryptocurrency {
  Id? id;  // Auto-increment primary key
  @Enumerated(EnumType.name)
  late CryptoType type;
  double totalCrypto = 0;

  // Relationships
  final transactions = IsarLinks<CryptocurrencyTransaction>();
}
```

**Transaction Pattern:**
```dart
await _localDB.writeTxn(() async {
  await _localDB.cryptocurrencys.put(crypto);
  await crypto.transactions.save(); // Save relationships
});
```

**Reactive Queries:**
```dart
Stream<List<Cryptocurrency>> watchCryptocurrencies() {
  return _localDB.cryptocurrencys
    .where()
    .watch(fireImmediately: true);
}
```

### API Integration

**Retrofit Pattern:**
```dart
@RestApi(baseUrl: 'https://api.example.com/')
abstract class CoinMarketCapApi {
  factory CoinMarketCapApi(Dio dio) = _CoinMarketCapApi;

  @GET('/v2/cryptocurrency/quotes/latest')
  Future<Response> getCryptoPriceMarket(@Query('slug') String slug);
}
```

**Repository with Dio:**
```dart
@Riverpod(keepAlive: true)
CoinMarketCapRepository coinMarketCapRepository(Ref ref) {
  final dio = Dio();
  dio.options.headers['X-CMC_PRO_API_KEY'] =
    const String.fromEnvironment('COIN_MARKET_CAP_KEY');
  return CoinMarketCapRepository(CoinMarketCapApi(dio));
}
```

**API Caching Pattern (SharedPreferences):**
```dart
final lastUpdate = DateTime.parse(prefs.getString('lastUpdate') ?? '...')
  .add(const Duration(minutes: 30));

if (DateTime.now().isAfter(lastUpdate)) {
  final data = await api.fetchData();
  await prefs.setString('lastUpdate', DateTime.now().toIso8601String());
}
```

### Forms & Validation

**Form State (Dart 3 Records):**
```dart
// Define form state as a typedef record - no code generation needed
typedef CryptoFormState = ({
  String amount,
  DateTime date,
  Cryptocurrency? crypto,
});
```

**Form Screen Pattern:**
```dart
final formKey = GlobalKey<FormState>();

MonnButton(
  onPressed: () async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final success = await ref
      .read(cryptoFormControllerProvider.notifier)
      .submit();

    if (!context.mounted || !success) return;

    ref.invalidate(cryptoFormControllerProvider);
    Navigator.pop(context);
  },
)
```

**Field Validation:**
Uses custom widgets in `lib/shared/widgets/fields/`:
- `MonnFieldNumber` - Validated numeric input
- `MonnFieldText` - Text input
- `MonnFieldDate` - Date picker

Built-in validation checks for empty, invalid, and non-positive values with localized error messages.

### Localization

**Setup in main.dart:**
```dart
EasyLocalization(
  path: 'assets/translations',
  supportedLocales: const [Locale('fr'), Locale('en')],
  fallbackLocale: const Locale('en'),
  assetLoader: const CodegenLoader(),
  child: const App(),
)
```

**CRITICAL:** Always use `context.tr(LocaleKeys.xxx)` - never `.tr()` on LocaleKeys.

Translation files: `assets/translations/en.json`, `assets/translations/fr.json`

### Shared Code

**Extensions** (`lib/shared/extensions/`):
- `context_ui.dart` - `context.push()`, `context.isDarkTheme()`, keyboard helpers
- `double_ui.dart` - Currency and decimal formatting
- `date_ui.dart` - Date formatting and calculations
- `string_ui.dart` - Case conversions (kebab, snake)
- `enum_ui.dart` - UI logic for enums (routes, icons, colors)
- `ref_ui.dart` - `ref.cacheFor()` provider lifecycle management

**Widgets** (`lib/shared/widgets/`):
- Fields: `monn_field_number.dart`, `monn_field_text.dart`, `monn_field_date.dart`
- Layout: `monn_app_bar.dart`, `monn_card.dart`, `monn_tile.dart`, `monn_button.dart`
- Charts: `monn_doughnut_chart.dart` (portfolio visualization)
- Bottom sheets: `monn_bottom_sheet.dart` (uses Wolt Modal Sheet)
- Other: `monn_error.dart`, `monn_snack_bar.dart`, `payout_report.dart`

### Testing

**Test Structure:**
Mirrors source code structure in `test/features/<feature>/`

**Pattern (with Mockito):**
```dart
void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
    isar = await Isar.open([/* schemas */], directory: '.');
    // Setup test data
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('repositoryTest', () {
    test('should return expected result', () async {
      // Arrange
      final repository = MockRepository();
      final container = createContainer(
        overrides: [
          repositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.method()).thenAnswer((_) => Stream.value(data));

      // Act
      final listener = MockListener<AsyncValue<Data>>();
      container.listen(provider, listener.call, fireImmediately: true);
      final results = await container.read(provider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(results)),
      ]);
      expect(results, expectedData);
    });
  });
}
```

Test utilities in `test/test.dart` and `test/utils.dart`.

## Adding a New Investment Type

When adding a new investment type (e.g., `SavingsType.newType`), update these files:

### Required Changes

1. **Add enum value** in `lib/features/dashboard/domain/savings.dart`:
```dart
enum SavingsType {
  // ... existing types
  newType,  // Add here
}
```

2. **Add to net worth calculation** in `lib/features/dashboard/domain/net_worth_provider.dart`:
```dart
// In getFinalAmount() switch - the exhaustive switch will show a compiler error:
SavingsType.newType => ref
    .watch(watchPayoutReportNewTypeProvider)
    .value
    ?.finalAmount ?? 0,
```

3. **Add UI mappings** in `lib/shared/extensions/enum_ui.dart`:
```dart
// In route() switch:
SavingsType.newType => const NewTypeScreen(),

// In icon() switch:
SavingsType.newType => MonnAssets.images.icon.newIcon.provider(),
```

4. **Add Isar schema** in `lib/shared/local/local_database.dart`:
```dart
_database = await Isar.open([
  // ... existing schemas
  NewTypeSchema,
], directory: dir.path);
```

5. **Add translations** in `assets/translations/en.json` and `fr.json`:
```json
"savings": {
  "new_type": "New Type"
}
```

### Compiler Safety

The exhaustive `switch` statements on `SavingsType` will produce compile-time errors if you forget to handle the new type in:
- `net_worth_provider.dart` (getFinalAmount calculation)
- `enum_ui.dart` (route, icon methods)

## Important Conventions

### Code Generation
All domain models and providers use generators. **Always run `flutter pub run build_runner build` after:**
- Creating/modifying `@freezed` classes
- Creating/modifying `@riverpod` providers
- Creating/modifying `@collection` Isar entities
- Creating/modifying `@JsonSerializable` classes
- Creating/modifying `@RestApi` interfaces

### Naming Conventions
- Form Controllers: `<Name>FormController` (e.g., `CryptoFormController`) - contains state + update + submit
- Repositories: `<Name>Repository` (e.g., `CryptocurrencyRepository`)
- Screens: `<Name>Screen` (e.g., `CryptocurrencyScreen`)
- Providers: Generated automatically with `Provider` suffix
- Form State: `<Name>FormState` typedef record (e.g., `CryptoFormState`)

### File Organization
- Domain models: `domain/<model_name>.dart`
- Repositories: `data/<name>_repository.dart`
- API clients: `data/<name>_api.dart`
- Screens: `presentation/<screen_name>/<screen_name>.dart`
- Form Controllers: `presentation/<screen_name>/controllers/<name>_form_controller.dart`

### Navigation
Uses simple push-based navigation (no router):
```dart
context.push(const CryptocurrencyScreen());
context.push(AmountScreen(...), fullscreenDialog: true);
```

### Async UI Pattern
Use pattern matching on `AsyncValue`:
```dart
switch (asyncData) {
  AsyncData(:final value) => ListView(...),
  AsyncError(:final error) => Text('Error: $error'),
  _ => CircularProgressIndicator(),
}
```

### Enum Extensions
Attach UI logic to enums via extensions in `lib/shared/extensions/enum_ui.dart`:
```dart
extension SavingsTypeUI on SavingsType {
  Widget route() => switch (this) {
    SavingsType.cryptocurrency => const CryptocurrencyScreen(),
    // ...
  };
}
```

## Key Files

- **Entry point:** `lib/main.dart`
- **App widget:** `lib/app.dart`
- **Database:** `lib/shared/local/local_database.dart`
- **Theme:** `lib/utils/global_theme_data.dart`
- **Home screen:** `lib/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart`
- **Generated assets:** `lib/utils/assets.gen.dart`
- **Locale keys:** `lib/generated/locale_keys.g.dart`

## Generated Files

Exclude from version control and analysis (configured in `analysis_options.yaml`):
- `*.freezed.dart` - Freezed code generation
- `*.g.dart` - Multiple generators (json_serializable, riverpod, isar)
- `*.gr.dart` - Additional generated files
- `generated_plugin_registrant.dart` - Flutter plugins

## Environment Variables

API keys are provided via `api_keys.json` (not in version control):
- `COIN_MARKET_CAP_KEY` - CoinMarketCap API access for cryptocurrency prices
- `ALPHA_VANTAGE_KEY` - Alpha Vantage API access for ETF quotes (PEA feature)

Access in code:
```dart
const String.fromEnvironment('COIN_MARKET_CAP_KEY')
const String.fromEnvironment('ALPHA_VANTAGE_KEY')
```

## Linting

Uses `very_good_analysis` package with custom overrides:
- `public_member_api_docs: false` - No doc comments required
- `invalid_annotation_target: ignore` - Allow Freezed annotations
- `document_ignores: ignore` - No need to document ignores

