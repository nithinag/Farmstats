import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cocoon Sale & Batch Profitability Calculation Tests', () {
    test('Calculates net harvest weight accurately', () {
      const grossWeight = 82.50;
      const tareWeight = 2.50;
      final netWeight = grossWeight - tareWeight;

      expect(netWeight, 80.00);
    });

    test('Validates grade quantities match net harvest weight', () {
      const gradeA = 35.0;
      const gradeB = 30.0;
      const gradeC = 10.0;
      const reject = 5.0;

      final totalGraded = gradeA + gradeB + gradeC + reject;
      expect(totalGraded, 80.0);
    });

    test('Calculates gross sale from grade rates', () {
      const gradeA = 35.0;
      const rateA = 620.0;

      const gradeB = 30.0;
      const rateB = 560.0;

      const gradeC = 10.0;
      const rateC = 480.0;

      const reject = 5.0;
      const rateReject = 300.0;

      final grossSale = (gradeA * rateA) + (gradeB * rateB) + (gradeC * rateC) + (reject * rateReject);
      // (35*620=21700) + (30*560=16800) + (10*480=4800) + (5*300=1500) = 44800
      expect(grossSale, 44800.0);
    });

    test('Calculates net revenue after deductions correctly', () {
      const grossSale = 44800.0;
      const commission = 1500.0;
      const transport = 600.0;
      const marketCharges = 400.0;
      const other = 0.0;

      final totalDeductions = commission + transport + marketCharges + other;
      final netRevenue = grossSale - totalDeductions;

      expect(totalDeductions, 2500.0);
      expect(netRevenue, 42300.0);
    });

    test('Calculates batch net profit and margin correctly', () {
      const netRevenue = 42300.0;
      const totalBatchCost = 21900.0;

      final netProfit = netRevenue - totalBatchCost;
      final profitMargin = (netProfit / netRevenue) * 100;

      expect(netProfit, 20400.0);
      expect(profitMargin.toStringAsFixed(2), '48.23');
    });

    test('Handles zero revenue gracefully for profit margin', () {
      const netRevenue = 0.0;
      const totalBatchCost = 5000.0;

      final netProfit = netRevenue - totalBatchCost;
      final profitMargin = netRevenue > 0 ? (netProfit / netRevenue) * 100 : 0.0;

      expect(netProfit, -5000.0);
      expect(profitMargin, 0.0);
    });
  });
}
