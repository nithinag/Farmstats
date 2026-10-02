import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_entities.freezed.dart';

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    required double amount,
    double? quantity,
    required DateTime date,
    required ExpenseCategory category,
    required String paymentMethod,
    required String description,
    String? batchId,
    String? receiptUrl,
  }) = _Expense;
}

@freezed
abstract class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
  }) = _ExpenseCategory;
}

@freezed
abstract class ExpenseSummary with _$ExpenseSummary {
  const factory ExpenseSummary({
    required double totalAmount,
    required int count,
    required DateTime startDate,
    required DateTime endDate,
    required Map<String, double> amountByCategory,
  }) = _ExpenseSummary;
}

@freezed
abstract class ExpenseFilter with _$ExpenseFilter {
  const factory ExpenseFilter({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? categoryIds,
    String? batchId,
    String? paymentMethod,
    double? minAmount,
    double? maxAmount,
  }) = _ExpenseFilter;
}

@freezed
abstract class ExpenseStatistics with _$ExpenseStatistics {
  const factory ExpenseStatistics({
    required double averageDailyExpense,
    required String highestCategory,
    required double highestCategoryAmount,
    required List<double> weeklyTrend,
  }) = _ExpenseStatistics;
}
