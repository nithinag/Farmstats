import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_models.freezed.dart';
part 'expense_models.g.dart';

@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'quantity') double? quantity,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'category') required ExpenseCategoryModel category,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'batch_id') String? batchId,
    @JsonKey(name: 'receipt_url') String? receiptUrl,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);
}

@freezed
abstract class ExpenseCategoryModel with _$ExpenseCategoryModel {
  const factory ExpenseCategoryModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'color_code') required String colorCode,
    @JsonKey(name: 'icon_name') required String iconName,
  }) = _ExpenseCategoryModel;

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) => _$ExpenseCategoryModelFromJson(json);
}

@freezed
abstract class ExpenseSummaryModel with _$ExpenseSummaryModel {
  const factory ExpenseSummaryModel({
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'amount_by_category') required Map<String, double> amountByCategory,
  }) = _ExpenseSummaryModel;

  factory ExpenseSummaryModel.fromJson(Map<String, dynamic> json) => _$ExpenseSummaryModelFromJson(json);
}
