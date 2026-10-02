import 'dart:math';
import 'package:uuid/uuid.dart';
import '../models/expense_models.dart';

abstract class IExpenseDataSource {
  Future<List<ExpenseModel>> getExpenses();
  Future<ExpenseModel?> getExpenseById(String id);
  Future<void> addExpense(ExpenseModel expense);
  Future<void> updateExpense(ExpenseModel expense);
  Future<void> deleteExpense(String id);
}

class ExpenseMockDataSourceImpl implements IExpenseDataSource {
  final List<ExpenseModel> _expenses = [];
  final _uuid = const Uuid();
  final _random = Random();

  ExpenseMockDataSourceImpl() {
    _generateMockData();
  }

  void _generateMockData() {
    final categories = [
      const ExpenseCategoryModel(id: 'c1', name: 'DFL Cost', colorCode: '#4CAF50', iconName: 'egg'),
      const ExpenseCategoryModel(id: 'c2', name: 'Mulberry Leaves', colorCode: '#8BC34A', iconName: 'eco'),
      const ExpenseCategoryModel(id: 'c3', name: 'Fertilizer', colorCode: '#FF9800', iconName: 'science'),
      const ExpenseCategoryModel(id: 'c4', name: 'Labour', colorCode: '#F44336', iconName: 'people'),
      const ExpenseCategoryModel(id: 'c5', name: 'Electricity', colorCode: '#FFEB3B', iconName: 'bolt'),
      const ExpenseCategoryModel(id: 'c6', name: 'Medicine', colorCode: '#E91E63', iconName: 'medical_services'),
      const ExpenseCategoryModel(id: 'c7', name: 'Transport', colorCode: '#2196F3', iconName: 'local_shipping'),
      const ExpenseCategoryModel(id: 'c8', name: 'Maintenance', colorCode: '#9E9E9E', iconName: 'build'),
      const ExpenseCategoryModel(id: 'c9', name: 'Equipment', colorCode: '#607D8B', iconName: 'handyman'),
      const ExpenseCategoryModel(id: 'c10', name: 'Other', colorCode: '#000000', iconName: 'more_horiz'),
    ];

    final paymentMethods = ['Cash', 'Bank Transfer', 'Credit Card', 'UPI'];
    final now = DateTime.now();

    for (int i = 0; i < 100; i++) {
      final category = categories[_random.nextInt(categories.length)];
      // Random date within the last 90 days
      final date = now.subtract(Duration(days: _random.nextInt(90), hours: _random.nextInt(24)));
      final amount = (_random.nextDouble() * 5000) + 100; // 100 to 5100

      _expenses.add(ExpenseModel(
        id: _uuid.v4(),
        amount: double.parse(amount.toStringAsFixed(2)),
        quantity: category.name == 'DFL Cost' ? 100.0 : null,
        date: date.toIso8601String(),
        category: category,
        paymentMethod: paymentMethods[_random.nextInt(paymentMethods.length)],
        description: 'Mock expense for ${category.name}',
        batchId: _random.nextBool() ? 'batch_${_random.nextInt(5) + 1}' : null,
      ));
    }
    
    // Sort descending by date
    _expenses.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.unmodifiable(_expenses);
  }

  @override
  Future<ExpenseModel?> getExpenseById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _expenses.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addExpense(ExpenseModel expense) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _expenses.insert(0, expense);
  }

  @override
  Future<void> updateExpense(ExpenseModel expense) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      _expenses[index] = expense;
    } else {
      throw Exception('Expense not found');
    }
  }

  @override
  Future<void> deleteExpense(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _expenses.removeWhere((e) => e.id == id);
  }
}
