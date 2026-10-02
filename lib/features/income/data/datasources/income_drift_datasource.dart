import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/income_dao.dart';
import '../models/income_models.dart';
import 'i_income_datasource.dart';

class IncomeDriftDataSourceImpl implements IIncomeDataSource {
  final IncomeDao _dao;

  IncomeDriftDataSourceImpl(this._dao);

  IncomeModel _mapToModel(IncomeWithRelations joined) {
    return IncomeModel(
      id: joined.income.id,
      saleDate: joined.income.saleDate.toIso8601String(),
      batchId: joined.income.batchId,
      buyer: BuyerModel(
        id: joined.buyer.id,
        name: joined.buyer.name,
        contact: joined.buyer.contact,
      ),
      category: IncomeCategoryModel(
        id: joined.category.id,
        name: joined.category.name,
        colorCode: joined.category.colorCode,
        iconName: joined.category.iconName,
      ),
      cocoonGrade: joined.income.cocoonGrade,
      quantity: joined.income.quantity,
      rate: joined.income.rate,
      grossAmount: joined.income.grossAmount,
      transportCharges: joined.income.transportCharges,
      commission: joined.income.commission,
      netAmount: joined.income.netAmount,
      paymentMethod: joined.income.paymentMethod,
      paymentStatus: joined.income.paymentStatus,
      invoiceNumber: joined.income.invoiceNumber,
      remarks: joined.income.remarks,
    );
  }

  IncomeDbModel _mapToDbModel(IncomeModel model) {
    return IncomeDbModel(
      id: model.id,
      saleDate: DateTime.parse(model.saleDate),
      batchId: model.batchId,
      buyerId: model.buyer.id,
      categoryId: model.category.id,
      cocoonGrade: model.cocoonGrade,
      quantity: model.quantity,
      rate: model.rate,
      grossAmount: model.grossAmount,
      transportCharges: model.transportCharges,
      commission: model.commission,
      netAmount: model.netAmount,
      paymentMethod: model.paymentMethod,
      paymentStatus: model.paymentStatus,
      invoiceNumber: model.invoiceNumber,
      remarks: model.remarks,
    );
  }

  @override
  Future<List<IncomeModel>> getIncomes() async {
    final rows = await _dao.getAllIncomes();
    return rows.map(_mapToModel).toList();
  }

  @override
  Future<IncomeModel?> getIncomeById(String id) async {
    final row = await _dao.getIncomeById(id);
    if (row == null) return null;
    return _mapToModel(row);
  }

  @override
  Future<void> addIncome(IncomeModel income) async {
    final buyer = BuyerDbModel(
      id: income.buyer.id,
      name: income.buyer.name,
      contact: income.buyer.contact,
    );
    await _dao.insertIncomeWithBuyer(_mapToDbModel(income), buyer);
  }

  @override
  Future<void> updateIncome(IncomeModel income) async {
    final buyer = BuyerDbModel(
      id: income.buyer.id,
      name: income.buyer.name,
      contact: income.buyer.contact,
    );
    await _dao.updateIncomeWithBuyer(_mapToDbModel(income), buyer);
  }

  @override
  Future<void> deleteIncome(String id) async {
    await _dao.deleteIncome(id);
  }
}
