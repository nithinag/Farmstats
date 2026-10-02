import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_models.freezed.dart';
part 'income_models.g.dart';

@freezed
abstract class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    required String id,
    required String saleDate,
    String? batchId,
    required BuyerModel buyer,
    required IncomeCategoryModel category,
    required String cocoonGrade,
    required double quantity,
    required double rate,
    required double grossAmount,
    required double transportCharges,
    required double commission,
    required double netAmount,
    required String paymentMethod,
    required String paymentStatus,
    String? invoiceNumber,
    String? remarks,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => _$IncomeModelFromJson(json);
}

@freezed
abstract class IncomeCategoryModel with _$IncomeCategoryModel {
  const factory IncomeCategoryModel({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
  }) = _IncomeCategoryModel;

  factory IncomeCategoryModel.fromJson(Map<String, dynamic> json) => _$IncomeCategoryModelFromJson(json);
}

@freezed
abstract class BuyerModel with _$BuyerModel {
  const factory BuyerModel({
    required String id,
    required String name,
    required String contact,
  }) = _BuyerModel;

  factory BuyerModel.fromJson(Map<String, dynamic> json) => _$BuyerModelFromJson(json);
}
