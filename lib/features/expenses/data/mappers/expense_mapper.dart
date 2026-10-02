import '../../domain/entities/expense_entities.dart';
import '../models/expense_models.dart';

class ExpenseMapper {
  static Expense fromModel(ExpenseModel model) {
    return Expense(
      id: model.id,
      amount: model.amount,
      quantity: model.quantity,
      date: DateTime.parse(model.date),
      category: _mapCategory(model.category),
      paymentMethod: model.paymentMethod,
      description: model.description,
      batchId: model.batchId,
      receiptUrl: model.receiptUrl,
    );
  }

  static ExpenseModel toModel(Expense entity) {
    return ExpenseModel(
      id: entity.id,
      amount: entity.amount,
      quantity: entity.quantity,
      date: entity.date.toIso8601String(),
      category: _mapCategoryToModel(entity.category),
      paymentMethod: entity.paymentMethod,
      description: entity.description,
      batchId: entity.batchId,
      receiptUrl: entity.receiptUrl,
    );
  }

  static ExpenseCategory _mapCategory(ExpenseCategoryModel model) {
    return ExpenseCategory(
      id: model.id,
      name: model.name,
      colorCode: model.colorCode,
      iconName: model.iconName,
    );
  }

  static ExpenseCategoryModel _mapCategoryToModel(ExpenseCategory entity) {
    return ExpenseCategoryModel(
      id: entity.id,
      name: entity.name,
      colorCode: entity.colorCode,
      iconName: entity.iconName,
    );
  }

  static ExpenseSummary fromSummaryModel(ExpenseSummaryModel model) {
    return ExpenseSummary(
      totalAmount: model.totalAmount,
      count: model.count,
      startDate: DateTime.parse(model.startDate),
      endDate: DateTime.parse(model.endDate),
      amountByCategory: model.amountByCategory,
    );
  }
}
