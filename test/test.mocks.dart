// Mocks generated by Mockito 5.4.4 from annotations
// in monn/test/test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart'
    as _i2;
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart' as _i4;
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart'
    as _i7;
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart' as _i8;
import 'package:monn/features/dashboard/data/savings_repository.dart' as _i5;
import 'package:monn/features/dashboard/domain/savings.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [CrowdfundingRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCrowdfundingRepository extends _i1.Mock
    implements _i2.CrowdfundingRepository {
  @override
  _i3.Stream<List<_i4.Crowdfunding>> watchCrowdfundings() =>
      (super.noSuchMethod(
        Invocation.method(
          #watchCrowdfundings,
          [],
        ),
        returnValue: _i3.Stream<List<_i4.Crowdfunding>>.empty(),
        returnValueForMissingStub: _i3.Stream<List<_i4.Crowdfunding>>.empty(),
      ) as _i3.Stream<List<_i4.Crowdfunding>>);

  @override
  _i3.Future<void> editCrowdfunding(_i4.Crowdfunding? newCrowdfunding) =>
      (super.noSuchMethod(
        Invocation.method(
          #editCrowdfunding,
          [newCrowdfunding],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [SavingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSavingsRepository extends _i1.Mock implements _i5.SavingsRepository {
  @override
  _i3.Stream<List<_i6.Savings>> watchSavings() => (super.noSuchMethod(
        Invocation.method(
          #watchSavings,
          [],
        ),
        returnValue: _i3.Stream<List<_i6.Savings>>.empty(),
        returnValueForMissingStub: _i3.Stream<List<_i6.Savings>>.empty(),
      ) as _i3.Stream<List<_i6.Savings>>);

  @override
  _i3.Stream<_i6.Savings> watchSaving(_i6.SavingsType? type) =>
      (super.noSuchMethod(
        Invocation.method(
          #watchSaving,
          [type],
        ),
        returnValue: _i3.Stream<_i6.Savings>.empty(),
        returnValueForMissingStub: _i3.Stream<_i6.Savings>.empty(),
      ) as _i3.Stream<_i6.Savings>);

  @override
  _i3.Future<void> editSaving(_i6.Savings? newSaving) => (super.noSuchMethod(
        Invocation.method(
          #editSaving,
          [newSaving],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [CryptocurrencyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptocurrencyRepository extends _i1.Mock
    implements _i7.CryptocurrencyRepository {
  @override
  _i3.Stream<List<_i8.Cryptocurrency>> watchCryptocurrencies() =>
      (super.noSuchMethod(
        Invocation.method(
          #watchCryptocurrencies,
          [],
        ),
        returnValue: _i3.Stream<List<_i8.Cryptocurrency>>.empty(),
        returnValueForMissingStub: _i3.Stream<List<_i8.Cryptocurrency>>.empty(),
      ) as _i3.Stream<List<_i8.Cryptocurrency>>);

  @override
  _i3.Future<void> editCryptocurrency({
    required _i8.Cryptocurrency? crypto,
    required _i8.CryptocurrencyTransaction? transaction,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #editCryptocurrency,
          [],
          {
            #crypto: crypto,
            #transaction: transaction,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
