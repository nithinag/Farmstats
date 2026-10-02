import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/expense_dao.dart';
import '../models/expense_models.dart';
import 'expense_mock_datasource.dart';

class ExpenseDriftDataSourceImpl implements IExpenseDataSource {
  final ExpenseDao _dao;

  ExpenseDriftDataSourceImpl(this._dao);

  ExpenseModel _mapToModel(ExpenseWithCategory joined) {
    return ExpenseModel(
      id: joined.expense.id,
      amount: joined.expense.amount,
      quantity: joined.expense.quantity,
      date: joined.expense.date.toIso8601String(),
      category: ExpenseCategoryModel(
        id: joined.category.id,
        name: joined.category.name,
        colorCode: joined.category.colorCode,
        iconName: joined.category.iconName,
      ),
      paymentMethod: joined.expense.paymentMethod,
      description: joined.expense.description,
      batchId: joined.expense.batchId,
      receiptUrl: joined.expense.receiptUrl,
    );
  }

  ExpenseDbModel _mapToDbModel(ExpenseModel model) {
    return ExpenseDbModel(
      id: model.id,
      amount: model.amount,
      quantity: model.quantity,
      date: DateTime.parse(model.date),
      categoryId: model.category.id,
      paymentMethod: model.paymentMethod,
      description: model.description,
      batchId: model.batchId,
      receiptUrl: model.receiptUrl,
    );
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    final rows = await _dao.getAllExpenses();
    return rows.map(_mapToModel).toList();
  }

  @override
  Future<ExpenseModel?> getExpenseById(String id) async {
    final row = await _dao.getExpenseById(id);
    if (row == null) return null;
    return _mapToModel(row);
  }

  @override
  Future<void> addExpense(ExpenseModel expense) async {
    await _dao.insertExpense(_mapToDbModel(expense));
  }

  @override
  Future<void> updateExpense(ExpenseModel expense) async {
    await _dao.updateExpense(_mapToDbModel(expense));
  }

  @override
  Future<void> deleteExpense(String id) async {
    await _dao.deleteExpense(id);
  }
}
