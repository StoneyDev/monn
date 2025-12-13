# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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
dart run easy_localization:generate --source-dir "assets/translations"
dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir "assets/translations"
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

3. **Form Controllers** (keep-alive with manual disposal):
```dart
@Riverpod(keepAlive: true)
class CryptoFormController extends _$CryptoFormController {
  @override
  CryptoForm build() => CryptoForm(amount: '', date: DateTime.now());

  void amount({required String amount}) {
    ref.cacheFor(const Duration(seconds: 2)); // Custom extension
    state = state.copyWith(amount: amount);
  }
}
```

**IMPORTANT**: Form controllers use `keepAlive: true` to prevent premature disposal. They are manually invalidated in the widget's `dispose()` method.

4. **Submit Controllers** (keep-alive with ref.mounted protection):
```dart
@Riverpod(keepAlive: true)
class SubmitCryptoFormController extends _$SubmitCryptoFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(cryptocurrencyRepositoryProvider);
    final formData = ref.read(cryptoFormControllerProvider);

    state = await AsyncValue.guard(() => repository.editCrypto(...));

    // CRITICAL: Always check ref.mounted after async operations
    if (!ref.mounted) return false;

    return !state.hasError;
  }
}
```

**CRITICAL PATTERN**: After ANY async operation (`await`), check `if (!ref.mounted) return;` before accessing `ref` or `state`. This prevents errors when the provider disposes during the async gap.

**Manual Provider Invalidation After Submit:**
Since form and submit controllers use `keepAlive: true`, they must be manually invalidated after successful submission:

```dart
MonnButton(
  text: context.tr('button.validate'),
  onPressed: () async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final success = await ref
        .read(submitCashFormControllerProvider.notifier)
        .submit();

    if (!context.mounted || !success) return;

    // Invalidate providers after successful submit
    ref
      ..invalidate(cashFormControllerProvider)
      ..invalidate(submitCashFormControllerProvider);
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
  final submitNotifier = ref.read(submitCashFormControllerProvider.notifier);

  context.push(
    AmountScreen(
      onSubmit: () async {
        final success = await submitNotifier.submit();
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
- ❌ Don't use auto-dispose (`@riverpod`) for form/submit controllers - use `@Riverpod(keepAlive: true)`
- ❌ Don't invalidate providers in `dispose()` method - `ref` is unsafe when widget is unmounting
- ✅ DO use `@Riverpod(keepAlive: true)` for form and submit controllers
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

**Form Model (Freezed):**
```dart
@freezed
class CryptoForm with _$CryptoForm {
  const factory CryptoForm({
    required String amount,
    required DateTime date,
    Cryptocurrency? crypto,
  }) = _CryptoForm;
}
```

**Form Screen Pattern:**
```dart
final formKey = GlobalKey<FormState>();

MonnButton(
  onPressed: () async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final success = await ref
      .read(submitCryptoFormControllerProvider.notifier)
      .submit();

    if (!context.mounted || !success) return;

    ref.invalidate(getCryptocurrencyProvider(type));
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

**Usage:**
```dart
context.tr('common.net_worth')
context.tr('common.per_year', args: ['5.2'])
context.tr('savings.${SavingsType.cryptocurrency.name.toSnakeCase()}')
```

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

## Important Conventions

### Code Generation
All domain models and providers use generators. **Always run `flutter pub run build_runner build` after:**
- Creating/modifying `@freezed` classes
- Creating/modifying `@riverpod` providers
- Creating/modifying `@collection` Isar entities
- Creating/modifying `@JsonSerializable` classes
- Creating/modifying `@RestApi` interfaces

### Naming Conventions
- Controllers: `<Name>Controller` (e.g., `CryptoFormController`)
- Repositories: `<Name>Repository` (e.g., `CryptocurrencyRepository`)
- Forms: `<Name>Form` (e.g., `CryptoForm`)
- Screens: `<Name>Screen` (e.g., `CryptocurrencyScreen`)
- Providers: Generated automatically with `Provider` suffix

### File Organization
- Domain models: `domain/<model_name>.dart`
- Form models: `domain/<model_name>_form.dart`
- Repositories: `data/<name>_repository.dart`
- API clients: `data/<name>_api.dart`
- Screens: `presentation/<screen_name>/<screen_name>.dart`
- Controllers: `presentation/<screen_name>/controllers/<name>_controller.dart`

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
