import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/freelance/domain/freelance_calculator.dart';

void main() {
  group('FreelanceCalculator', () {
    group('calculateAbatement', () {
      test('should return 34% of annual revenue', () {
        // Arrange
        const annualRevenue = 10000.0;

        // Act
        final result = FreelanceCalculator.calculateAbatement(annualRevenue);

        // Assert
        expect(result, closeTo(3400, 0.01));
      });

      test('should return 0 when revenue is 0', () {
        // Arrange
        const annualRevenue = 0.0;

        // Act
        final result = FreelanceCalculator.calculateAbatement(annualRevenue);

        // Assert
        expect(result, 0);
      });
    });

    group('calculateNetImposable', () {
      test('should return 66% of annual revenue', () {
        // Arrange
        const annualRevenue = 10000.0;

        // Act
        final result = FreelanceCalculator.calculateNetImposable(annualRevenue);

        // Assert
        expect(result, closeTo(6600, 0.01));
      });

      test('should return 0 when revenue is 0', () {
        // Arrange
        const annualRevenue = 0.0;

        // Act
        final result = FreelanceCalculator.calculateNetImposable(annualRevenue);

        // Assert
        expect(result, 0);
      });
    });

    group('calculateUrssaf', () {
      test('should return 24.6% of annual revenue', () {
        // Arrange
        const annualRevenue = 10000.0;

        // Act
        final result = FreelanceCalculator.calculateUrssaf(annualRevenue);

        // Assert
        expect(result, closeTo(2460, 0.01));
      });

      test('should return 0 when revenue is 0', () {
        // Arrange
        const annualRevenue = 0.0;

        // Act
        final result = FreelanceCalculator.calculateUrssaf(annualRevenue);

        // Assert
        expect(result, 0);
      });
    });

    group('calculateIncomeTax', () {
      test('should return 0 for income below first bracket', () {
        // Arrange
        const netImposable = 11497.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, 0);
      });

      test('should calculate tax correctly in 11% bracket', () {
        // Arrange
        const netImposable = 20000.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, lessThan(935.22));
      });

      test('should calculate tax correctly crossing into 30% bracket', () {
        // Arrange
        const netImposable = 45000.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, closeTo(6665.07, 1));
      });

      test('should return 0 when income is 0', () {
        // Arrange
        const netImposable = 0.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, 0);
      });

      test('should return 0 when income is negative', () {
        // Arrange
        const netImposable = -1000.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, 0);
      });
    });

    group('calculateNetAfterAll', () {
      test('should calculate net after URSSAF and taxes', () {
        // Arrange
        const annualRevenue = 45000.0;

        // Act
        final result = FreelanceCalculator.calculateNetAfterAll(annualRevenue);

        // Assert
        expect(result, greaterThan(30000));
        expect(result, lessThan(35000));
      });

      test('should return 0 when revenue is 0', () {
        // Arrange
        const annualRevenue = 0.0;

        // Act
        final result = FreelanceCalculator.calculateNetAfterAll(annualRevenue);

        // Assert
        expect(result, 0);
      });
    });

    group('calculate', () {
      test('should return complete result for given revenue', () {
        // Arrange
        const annualRevenue = 45000.0;

        // Act
        final result = FreelanceCalculator.calculate(annualRevenue);

        // Assert
        expect(result.annualRevenue, 45000);
        expect(result.abatement, closeTo(15300, 0.01));
        expect(result.netImposable, closeTo(29700, 0.01));
        expect(result.urssaf, closeTo(11070, 0.01));
        expect(result.incomeTax, greaterThan(0));
        expect(result.netAfterAll, greaterThan(0));
      });

      test('should return zeros when revenue is 0', () {
        // Arrange
        const annualRevenue = 0.0;

        // Act
        final result = FreelanceCalculator.calculate(annualRevenue);

        // Assert
        expect(result.annualRevenue, 0);
        expect(result.abatement, 0);
        expect(result.netImposable, 0);
        expect(result.urssaf, 0);
        expect(result.incomeTax, 0);
        expect(result.netAfterAll, 0);
      });
    });

    group('decote', () {
      test('should apply decote for low tax amounts', () {
        // Arrange
        const netImposable = 15000.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, lessThan(385.33));
      });

      test('should not apply decote for high tax amounts', () {
        // Arrange
        const netImposable = 100000.0;

        // Act
        final result = FreelanceCalculator.calculateIncomeTax(netImposable);

        // Assert
        expect(result, greaterThan(1964));
      });
    });
  });
}
