import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/reit/domain/reit_tax_calculator.dart';

void main() {
  group('ReitTaxCalculator', () {
    group('getTMI', () {
      test('should return 0% for income <= 0', () {
        // Arrange
        const income = 0.0;
        const negativeIncome = -100.0;

        // Act
        final result = ReitTaxCalculator.getTMI(income);
        final resultNegative = ReitTaxCalculator.getTMI(negativeIncome);

        // Assert
        expect(result, 0);
        expect(resultNegative, 0);
      });

      test('should return 0% for income in first bracket (<= 11497)', () {
        // Arrange
        const lowIncome = 5000.0;
        const bracketLimit = 11497.0;

        // Act
        final resultLow = ReitTaxCalculator.getTMI(lowIncome);
        final resultLimit = ReitTaxCalculator.getTMI(bracketLimit);

        // Assert
        expect(resultLow, 0);
        expect(resultLimit, 0);
      });

      test(
        'should return 11% for income in second bracket (11498 - 29315)',
        () {
          // Arrange
          const bracketStart = 11498.0;
          const midBracket = 20000.0;
          const bracketEnd = 29315.0;

          // Act
          final resultStart = ReitTaxCalculator.getTMI(bracketStart);
          final resultMid = ReitTaxCalculator.getTMI(midBracket);
          final resultEnd = ReitTaxCalculator.getTMI(bracketEnd);

          // Assert
          expect(resultStart, 0.11);
          expect(resultMid, 0.11);
          expect(resultEnd, 0.11);
        },
      );

      test('should return 30% for income in third bracket (29316 - 83823)', () {
        // Arrange
        const bracketStart = 29316.0;
        const midBracket = 50000.0;
        const bracketEnd = 83823.0;

        // Act
        final resultStart = ReitTaxCalculator.getTMI(bracketStart);
        final resultMid = ReitTaxCalculator.getTMI(midBracket);
        final resultEnd = ReitTaxCalculator.getTMI(bracketEnd);

        // Assert
        expect(resultStart, 0.30);
        expect(resultMid, 0.30);
        expect(resultEnd, 0.30);
      });

      test(
        'should return 41% for income in fourth bracket (83824 - 180294)',
        () {
          // Arrange
          const bracketStart = 83824.0;
          const midBracket = 100000.0;
          const bracketEnd = 180294.0;

          // Act
          final resultStart = ReitTaxCalculator.getTMI(bracketStart);
          final resultMid = ReitTaxCalculator.getTMI(midBracket);
          final resultEnd = ReitTaxCalculator.getTMI(bracketEnd);

          // Assert
          expect(resultStart, 0.41);
          expect(resultMid, 0.41);
          expect(resultEnd, 0.41);
        },
      );

      test('should return 45% for income above 180294', () {
        // Arrange
        const aboveBracket = 180295.0;
        const highIncome = 500000.0;

        // Act
        final resultAbove = ReitTaxCalculator.getTMI(aboveBracket);
        final resultHigh = ReitTaxCalculator.getTMI(highIncome);

        // Assert
        expect(resultAbove, 0.45);
        expect(resultHigh, 0.45);
      });
    });

    group('calculate', () {
      group('edge cases', () {
        test('should handle zero freelance revenue', () {
          // Arrange
          const freelanceRevenue = 0.0;
          const reitDividends = 1000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.reitDividends, 1000);
          expect(result.reitSocialCharges, closeTo(186, 0.01));
          expect(result.reitIncomeTax, 0);
          expect(result.reitTotalTax, closeTo(186, 0.01));
          expect(result.reitNetAfterTax, closeTo(814, 0.01));
        });

        test('should handle zero REIT dividends', () {
          // Arrange
          const freelanceRevenue = 50000.0;
          const reitDividends = 0.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.reitDividends, 0);
          expect(result.reitSocialCharges, 0);
          expect(result.reitIncomeTax, 0);
          expect(result.reitTotalTax, 0);
          expect(result.reitNetAfterTax, 0);
          expect(result.effectiveTaxRate, 0);
        });

        test('should handle zero for both inputs', () {
          // Arrange
          const freelanceRevenue = 0.0;
          const reitDividends = 0.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.reitDividends, 0);
          expect(result.reitTotalTax, 0);
          expect(result.effectiveTaxRate, 0);
          expect(result.tmi, 0);
        });
      });

      group('freelance abatement', () {
        test('should apply 34% abatement to freelance revenue', () {
          // Arrange
          // 50000 * (1 - 0.34) = 33000 net imposable freelance
          // TMI should be 30% (33000 is in 29316-83823 bracket)
          const freelanceRevenue = 50000.0;
          const reitDividends = 1000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.30);
        });
      });

      group('social charges', () {
        test('should apply 18.6% social charges on REIT dividends', () {
          // Arrange
          const freelanceRevenue = 50000.0;
          const reitDividends = 10000.0;
          const expectedSocialCharges = 1860.0; // 10000 * 0.186

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(
            result.reitSocialCharges,
            closeTo(expectedSocialCharges, 0.01),
          );
        });
      });

      group('marginal taxation', () {
        test('should calculate marginal income tax on REIT dividends', () {
          // Arrange
          // Freelance: 60000 * 0.66 = 39600 net imposable
          // With REIT 5000: 44600 total net imposable
          // Both in 30% bracket, so REIT is taxed at 30%
          const freelanceRevenue = 60000.0;
          const reitDividends = 5000.0;
          const expectedIncomeTax = 1500.0; // 5000 * 0.30

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.reitIncomeTax, closeTo(expectedIncomeTax, 50));
          expect(result.tmi, 0.30);
        });

        test('should handle bracket crossing correctly', () {
          // Arrange
          // Freelance: 45000 * 0.66 = 29700 net imposable (in 30% bracket)
          // With REIT 50000: 79700 total (still in 30% bracket)
          const freelanceRevenue = 45000.0;
          const reitDividends = 50000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.30);
          expect(result.reitIncomeTax, greaterThan(0));
        });
      });

      group('total tax calculation', () {
        test('should sum income tax and social charges', () {
          // Arrange
          const freelanceRevenue = 60000.0;
          const reitDividends = 10000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          final expectedTotal = result.reitIncomeTax + result.reitSocialCharges;
          expect(result.reitTotalTax, closeTo(expectedTotal, 0.01));
        });
      });

      group('net after tax', () {
        test('should calculate net after tax correctly', () {
          // Arrange
          const freelanceRevenue = 60000.0;
          const reitDividends = 10000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          final expectedNet = result.reitDividends - result.reitTotalTax;
          expect(result.reitNetAfterTax, closeTo(expectedNet, 0.01));
        });
      });

      group('effective tax rate', () {
        test('should calculate effective tax rate correctly', () {
          // Arrange
          const freelanceRevenue = 60000.0;
          const reitDividends = 10000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          final expectedRate = result.reitTotalTax / result.reitDividends;
          expect(result.effectiveTaxRate, closeTo(expectedRate, 0.0001));
        });

        test('should return 0 effective rate when no dividends', () {
          // Arrange
          const freelanceRevenue = 60000.0;
          const reitDividends = 0.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.effectiveTaxRate, 0);
        });
      });

      group('TMI in result', () {
        test('should return TMI based on total income', () {
          // Arrange
          // Freelance: 100000 * 0.66 = 66000 + REIT 20000 = 86000
          // 86000 is in 41% bracket (83824 - 180294)
          const freelanceRevenue = 100000.0;
          const reitDividends = 20000.0;

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.41);
        });
      });

      group('realistic scenarios', () {
        test('low income freelance with small REIT investment', () {
          // Arrange
          // 30000 * 0.66 = 19800 + 500 = 20300 (11% bracket)
          const freelanceRevenue = 30000.0;
          const reitDividends = 500.0;
          const expectedSocialCharges = 93.0; // 500 * 0.186

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.11);
          expect(result.reitSocialCharges, closeTo(expectedSocialCharges, 0.5));
          expect(result.reitNetAfterTax, greaterThan(0));
        });

        test('medium income with moderate REIT dividends', () {
          // Arrange
          // 70000 * 0.66 = 46200 + 3000 = 49200 (30% bracket)
          const freelanceRevenue = 70000.0;
          const reitDividends = 3000.0;
          const expectedSocialCharges = 558.0; // 3000 * 0.186

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.30);
          expect(result.reitSocialCharges, closeTo(expectedSocialCharges, 0.5));
        });

        test('high income with significant REIT dividends', () {
          // Arrange
          // 150000 * 0.66 = 99000 + 20000 = 119000 (41% bracket)
          const freelanceRevenue = 150000.0;
          const reitDividends = 20000.0;
          const expectedSocialCharges = 3720.0; // 20000 * 0.186

          // Act
          final result = ReitTaxCalculator.calculate(
            freelanceAnnualRevenue: freelanceRevenue,
            reitDividends: reitDividends,
          );

          // Assert
          expect(result.tmi, 0.41);
          expect(result.reitSocialCharges, closeTo(expectedSocialCharges, 0.5));
          // Effective rate should be > 18.6% (social charges alone)
          expect(result.effectiveTaxRate, greaterThan(0.186));
        });
      });
    });

    group('ReitTaxResult', () {
      test('should create result with all required fields', () {
        // Arrange
        const reitDividends = 10000.0;
        const reitIncomeTax = 3000.0;
        const reitSocialCharges = 1720.0;
        const reitTotalTax = 4720.0;
        const reitNetAfterTax = 5280.0;
        const effectiveTaxRate = 0.472;
        const tmi = 0.30;

        // Act
        const result = ReitTaxResult(
          reitDividends: reitDividends,
          reitIncomeTax: reitIncomeTax,
          reitSocialCharges: reitSocialCharges,
          reitTotalTax: reitTotalTax,
          reitNetAfterTax: reitNetAfterTax,
          effectiveTaxRate: effectiveTaxRate,
          tmi: tmi,
        );

        // Assert
        expect(result.reitDividends, reitDividends);
        expect(result.reitIncomeTax, reitIncomeTax);
        expect(result.reitSocialCharges, reitSocialCharges);
        expect(result.reitTotalTax, reitTotalTax);
        expect(result.reitNetAfterTax, reitNetAfterTax);
        expect(result.effectiveTaxRate, effectiveTaxRate);
        expect(result.tmi, tmi);
      });

      test('should support equality comparison', () {
        // Arrange
        const result1 = ReitTaxResult(
          reitDividends: 1000,
          reitIncomeTax: 300,
          reitSocialCharges: 172,
          reitTotalTax: 472,
          reitNetAfterTax: 528,
          effectiveTaxRate: 0.472,
          tmi: 0.30,
        );

        const result2 = ReitTaxResult(
          reitDividends: 1000,
          reitIncomeTax: 300,
          reitSocialCharges: 172,
          reitTotalTax: 472,
          reitNetAfterTax: 528,
          effectiveTaxRate: 0.472,
          tmi: 0.30,
        );

        // Act & Assert
        expect(result1, result2);
      });
    });

    group('constants', () {
      test('social charges rate should be 18.6%', () {
        // Arrange
        const expectedRate = 0.186;

        // Act
        const rate = ReitTaxCalculator.socialChargesRate;

        // Assert
        expect(rate, expectedRate);
      });

      test('freelance abatement rate should be 34%', () {
        // Arrange
        const expectedRate = 0.34;

        // Act
        const rate = ReitTaxCalculator.freelanceAbatementRate;

        // Assert
        expect(rate, expectedRate);
      });
    });
  });
}
