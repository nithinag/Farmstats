import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:farmstats/data/database/app_database.dart';
import 'package:farmstats/features/expenses/data/datasources/expense_drift_datasource.dart';
import 'package:farmstats/features/expenses/data/models/expense_models.dart';

void main() {
  late AppDatabase db;
  late ExpenseDriftDataSourceImpl dataSource;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = ExpenseDriftDataSourceImpl(db.expenseDao);
  });

  tearDown(() async {
    await db.close();
  });

  test('can insert and get expenses', () async {
    // 1. Insert a category first because of foreign keys
    await db.expenseDao.insertCategories([
      const ExpenseCategoryDbModel(
        id: 'c_test',
        name: 'Test Category',
        colorCode: '#000000',
        iconName: 'egg',
      )
    ]);

    // 2. Insert expense model
    final model = ExpenseModel(
      id: '1',
      amount: 100.0,
      date: DateTime.now().toIso8601String(),
      category: const ExpenseCategoryModel(
        id: 'c_test',
        name: 'Test Category',
        colorCode: '#000000',
        iconName: 'egg',
      ),
      paymentMethod: 'Cash',
      description: 'Test Expense',
    );

    await dataSource.addExpense(model);

    final expenses = await dataSource.getExpenses();
    expect(expenses.length, 1);
    expect(expenses.first.description, 'Test Expense');
    expect(expenses.first.category.name, 'Test Category');
  });
}
