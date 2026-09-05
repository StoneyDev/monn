# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Mandatory Rules

1. **BEFORE any bug fix** → use `superpowers:systematic-debugging`
2. **BEFORE any new code** → use `superpowers:brainstorming`
3. **KISS** → ask "what is the simplest solution?" before coding
4. **Centralize** → ask "where is the right place for this logic?" before adding code
5. **Spacing** → use `spacing` on Column/Row instead of `SizedBox(height/width: ...)`
6. **No diagnostic hacks** → never change a type or identity or disable a diagnostic solely to hide a warning; fix the underlying lifecycle or use a supported scoped solution
7. **Drift backups** → never overlap production `AppDatabase` instances, introduce an `_StagingDatabase` subtype, use Drift's internal `QueryExecutor`, or disable `dontWarnAboutMultipleDatabases` in the app; validate attached files through the active connection and close it before opening a staging database
8. **Inline simple mappings** → keep simple `switch` mappings used in only one place directly at the call site (for example, enum-to-`LocaleKeys` mappings inside `context.tr(...)`); do not extract them into an extension or helper solely to wrap the switch

## Working Agreement

### Goal

Finish the current task with the minimum sufficient change. Plan thoroughly,
execute light. Ship no design, abstraction, or test that cannot be justified by
the requirement.

### Before Coding

Read the relevant code directly; do not infer from search results or guess. Then
post a short plan covering the goal, non-goals, acceptance criteria, and what
stays untouched. Ask only when a material ambiguity would change the approach;
otherwise proceed.

### Autonomy

- For answer, explanation, review, diagnosis, or planning requests: inspect and
  report without changing code.
- For change, build, or fix requests: make in-scope local edits and run
  non-destructive validation without asking.
- Ask first for external writes, destructive actions, or material scope
  expansion.
- Work single-threaded. Use subagents only when the task clearly splits into
  independent workstreams. Enable only the skills the task needs.

### Stop and Re-plan Smaller

Stop and re-plan if the work starts:

- Fixing a symptom instead of the root cause, or stacking patches,
  compatibility layers, or a second implementation to keep old logic alive.
- Adding abstractions, frameworks, or configuration for hypothetical or future
  needs.
- Touching unrelated files.
- Using tests as a reason to keep building.

### Test Scope

Tests verify this change's acceptance criteria and nothing else. Run existing
related tests first; if they prove the change, add none. Add tests only when
behavior changed in a way existing tests cannot cover, or when the user asks.
Limit new coverage to at most one main path and one critical failure path. Do
not add frameworks, infrastructure, directories, snapshot tests, parametrized
grids, end-to-end tests, or backfill unrelated modules. If test code is larger
or more complex than the implementation, re-plan smaller.

### Definition of Done

- Restate the plan, mark non-goals, and confirm the acceptance criteria are met.
- Change the minimum number of files, keep the diff small, and leave no extra
  files or debug code.
- Run the related existing tests. Keep any new tests few and scoped as defined
  above.

## Project Overview

Monn is a personal investment tracking and analysis Flutter app that tracks multiple investment types: cryptocurrency, PEA (French stock account), REIT, crowdfunding, cash, Counter-Strike items, and savings books.

## Common Commands

### Code Generation
```bash
# Run code generation for all generators (Drift, Freezed, Riverpod, JSON, Retrofit)
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
  return CryptocurrencyRepository(ref.watch(appDatabaseProvider));
}
```
Use `keepAlive: true` for singletons like repositories, API clients, and database instances.

2. **Stream Providers** (auto-dispose - default):
```dart
@riverpod
Stream<List<CryptocurrencyEntry>> watchCryptocurrencies(Ref ref) {
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

### Database - Drift

The schema lives in `lib/shared/local/tables.dart`, while `AppDatabase`, its
migration strategy, and table registration live in
`lib/shared/local/database.dart`. `LocalDatabase` opens the SQLite file and is
injected into Riverpod from `main.dart`.

**Table Pattern:**
```dart
class CryptocurrencyEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  RealColumn get totalCrypto => real().withDefault(const Constant(0))();
}
```

**Transaction Pattern:**
```dart
await _db.transaction(() async {
  await _db.into(_db.cryptocurrencyEntries).insert(companion);
  await _db.into(_db.cryptocurrencyTransactionEntries).insert(transaction);
});
```

**Reactive Queries:**
```dart
Stream<List<CryptocurrencyEntry>> watchCryptocurrencies() {
  return _db.select(_db.cryptocurrencyEntries).watch();
}
```

Every schema change must increment `schemaVersion`, add an upgrade step, and
update the generated Drift schemas and migration tests.

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
- `ref_ui.dart` - `ref.cacheFor()` provider lifecycle management

Feature-specific UI extensions stay in their presentation feature:
- `dashboard/presentation/dashboard_screen/savings_type_ui.dart` - savings routes and icons
- `cryptocurrency/presentation/cryptocurrency_ui.dart` - cryptocurrency logos
- `counter_strike/presentation/counter_strike_ui.dart` - Counter-Strike item images

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
  late AppDatabase database;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() => database.close());

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

1. **Add enum value** in `lib/shared/domain/savings.dart`:
```dart
enum SavingsType {
  // ... existing types
  newType,  // Add here
}
```

2. **Add to net worth calculation** in `lib/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart`:
```dart
// In getFinalAmount() switch - the exhaustive switch will show a compiler error:
SavingsType.newType => ref.watch(
  watchPayoutReportNewTypeProvider.future,
),
```

3. **Add UI mappings** in `lib/features/dashboard/presentation/dashboard_screen/savings_type_ui.dart`:
```dart
// In route() switch:
SavingsType.newType => const NewTypeScreen(),

// In icon() switch:
SavingsType.newType => MonnAssets.images.icon.newIcon.provider(),
```

4. **Add the Drift table** in `lib/shared/local/tables.dart`, register it in
   `lib/shared/local/database.dart`, then add and test the schema migration:
```dart
class NewTypeEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
}
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
- `dashboard_screen/savings_type_ui.dart` (route, icon methods)

## Important Conventions

### Code Generation
All domain models and providers use generators. **Always run `flutter pub run build_runner build` after:**
- Creating/modifying `@freezed` classes
- Creating/modifying `@riverpod` providers
- Creating/modifying Drift tables or database declarations
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
Keep enum UI logic in the presentation feature that owns it. For savings,
use `lib/features/dashboard/presentation/dashboard_screen/savings_type_ui.dart`:
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

Generated files are version-controlled and must be committed with the source
change that produced them. They are excluded from direct static analysis where
configured in `analysis_options.yaml`:
- `*.freezed.dart` - Freezed code generation
- `*.g.dart` - Multiple generators (json_serializable, Riverpod, Drift)
- `*.gr.dart` - Additional generated files
- `*.drift.dart` and `database.steps.dart` - Drift database and migration code
- `test/drift/**/generated/` - Drift schema snapshots used by migration tests
- `generated_plugin_registrant.dart` - Flutter plugins

After running a generator, include every corresponding generated update in the
same commit. Do not review generated implementation as handwritten logic; trace
it back to its source declaration and verify generation consistency instead.

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
