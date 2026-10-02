import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/expense_tables.dart';

part 'expense_dao.g.dart';

class ExpenseWithCategory {
  final ExpenseDbModel expense;
  final ExpenseCategoryDbModel category;

  ExpenseWithCategory(this.expense, this.category);
}

@DriftAccessor(tables: [ExpensesTable, ExpenseCategoriesTable])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<List<ExpenseWithCategory>> getAllExpenses() async {
    final query = select(expensesTable).join([
      innerJoin(expenseCategoriesTable, expenseCategoriesTable.id.equalsExp(expensesTable.categoryId)),
    ])..orderBy([OrderingTerm.desc(expensesTable.date)]);

    final rows = await query.get();
    return rows.map((row) {
      return ExpenseWithCategory(
        row.readTable(expensesTable),
        row.readTable(expenseCategoriesTable),
      );
    }).toList();
  }

  Future<ExpenseWithCategory?> getExpenseById(String id) async {
    final query = select(expensesTable).join([
      innerJoin(expenseCategoriesTable, expenseCategoriesTable.id.equalsExp(expensesTable.categoryId)),
    ])..where(expensesTable.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return ExpenseWithCategory(
      row.readTable(expensesTable),
      row.readTable(expenseCategoriesTable),
    );
  }

  Future<void> insertExpense(ExpenseDbModel expense) async {
    await transaction(() async {
      await into(expensesTable).insert(expense, mode: InsertMode.replace);
    });
  }

  Future<void> updateExpense(ExpenseDbModel expense) async {
    await transaction(() async {
      await update(expensesTable).replace(expense);
    });
  }

  Future<void> deleteExpense(String id) async {
    await (delete(expensesTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> insertCategories(List<ExpenseCategoryDbModel> categories) async {
    await batch((batch) {
      batch.insertAll(expenseCategoriesTable, categories, mode: InsertMode.insertOrIgnore);
    });
  }
}
