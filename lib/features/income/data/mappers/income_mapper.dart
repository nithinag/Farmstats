import '../../domain/entities/income_entities.dart';
import '../models/income_models.dart';

class IncomeMapper {
  static Income fromModel(IncomeModel model) {
    return Income(
      id: model.id,
      saleDate: DateTime.parse(model.saleDate),
      batchId: model.batchId,
      buyer: Buyer(
        id: model.buyer.id,
        name: model.buyer.name,
        contact: model.buyer.contact,
      ),
      category: IncomeCategory(
        id: model.category.id,
        name: model.category.name,
        colorCode: model.category.colorCode,
        iconName: model.category.iconName,
      ),
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

  static IncomeModel toModel(Income entity) {
    return IncomeModel(
      id: entity.id,
      saleDate: entity.saleDate.toIso8601String(),
      batchId: entity.batchId,
      buyer: BuyerModel(
        id: entity.buyer.id,
        name: entity.buyer.name,
        contact: entity.buyer.contact,
      ),
      category: IncomeCategoryModel(
        id: entity.category.id,
        name: entity.category.name,
        colorCode: entity.category.colorCode,
        iconName: entity.category.iconName,
      ),
      cocoonGrade: entity.cocoonGrade,
      quantity: entity.quantity,
      rate: entity.rate,
      grossAmount: entity.grossAmount,
      transportCharges: entity.transportCharges,
      commission: entity.commission,
      netAmount: entity.netAmount,
      paymentMethod: entity.paymentMethod,
      paymentStatus: entity.paymentStatus,
      invoiceNumber: entity.invoiceNumber,
      remarks: entity.remarks,
    );
  }
}
