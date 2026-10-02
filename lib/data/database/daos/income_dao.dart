import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/income_tables.dart';

part 'income_dao.g.dart';

class IncomeWithRelations {
  final IncomeDbModel income;
  final IncomeCategoryDbModel category;
  final BuyerDbModel buyer;

  IncomeWithRelations(this.income, this.category, this.buyer);
}

@DriftAccessor(tables: [IncomesTable, IncomeCategoriesTable, BuyersTable])
class IncomeDao extends DatabaseAccessor<AppDatabase> with _$IncomeDaoMixin {
  IncomeDao(super.db);

  Future<List<IncomeWithRelations>> getAllIncomes() async {
    final query = select(incomesTable).join([
      innerJoin(incomeCategoriesTable, incomeCategoriesTable.id.equalsExp(incomesTable.categoryId)),
      innerJoin(buyersTable, buyersTable.id.equalsExp(incomesTable.buyerId)),
    ])..orderBy([OrderingTerm.desc(incomesTable.saleDate)]);

    final rows = await query.get();
    return rows.map((row) {
      return IncomeWithRelations(
        row.readTable(incomesTable),
        row.readTable(incomeCategoriesTable),
        row.readTable(buyersTable),
      );
    }).toList();
  }

  Future<IncomeWithRelations?> getIncomeById(String id) async {
    final query = select(incomesTable).join([
      innerJoin(incomeCategoriesTable, incomeCategoriesTable.id.equalsExp(incomesTable.categoryId)),
      innerJoin(buyersTable, buyersTable.id.equalsExp(incomesTable.buyerId)),
    ])..where(incomesTable.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return IncomeWithRelations(
      row.readTable(incomesTable),
      row.readTable(incomeCategoriesTable),
      row.readTable(buyersTable),
    );
  }

  Future<void> insertIncomeWithBuyer(IncomeDbModel income, BuyerDbModel buyer) async {
    await transaction(() async {
      await into(buyersTable).insert(buyer, mode: InsertMode.replace);
      await into(incomesTable).insert(income, mode: InsertMode.replace);
    });
  }

  Future<void> updateIncomeWithBuyer(IncomeDbModel income, BuyerDbModel buyer) async {
    await transaction(() async {
      await into(buyersTable).insert(buyer, mode: InsertMode.replace);
      await update(incomesTable).replace(income);
    });
  }

  Future<void> deleteIncome(String id) async {
    await (delete(incomesTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> insertCategoriesAndBuyers(List<IncomeCategoryDbModel> categories, List<BuyerDbModel> buyers) async {
    await batch((batch) {
      batch.insertAll(incomeCategoriesTable, categories, mode: InsertMode.insertOrIgnore);
      batch.insertAll(buyersTable, buyers, mode: InsertMode.insertOrIgnore);
    });
  }
}
