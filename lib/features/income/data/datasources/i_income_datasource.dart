import '../models/income_models.dart';

abstract class IIncomeDataSource {
  Future<List<IncomeModel>> getIncomes();
  Future<IncomeModel?> getIncomeById(String id);
  Future<void> addIncome(IncomeModel income);
  Future<void> updateIncome(IncomeModel income);
  Future<void> deleteIncome(String id);
}
