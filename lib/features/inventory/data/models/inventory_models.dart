import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_models.freezed.dart';
part 'inventory_models.g.dart';

@freezed
abstract class InventoryCategoryModel with _$InventoryCategoryModel {
  const factory InventoryCategoryModel({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
  }) = _InventoryCategoryModel;

  factory InventoryCategoryModel.fromJson(Map<String, dynamic> json) => _$InventoryCategoryModelFromJson(json);
}

@freezed
abstract class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel({
    required String id,
    required String name,
    required InventoryCategoryModel category,
    required String unit,
    required double currentQuantity,
    required double minimumQuantity,
    double? maximumQuantity,
    required double purchasePrice,
    String? supplier,
    required String purchaseDate,
    String? expiryDate,
    String? storageLocation,
    required String status,
    String? notes,
  }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) => _$InventoryItemModelFromJson(json);
}

@freezed
abstract class InventoryTransactionModel with _$InventoryTransactionModel {
  const factory InventoryTransactionModel({
    required String id,
    required String itemId,
    required double quantity,
    required String type,
    String? batchId,
    required String date,
    String? reason,
  }) = _InventoryTransactionModel;

  factory InventoryTransactionModel.fromJson(Map<String, dynamic> json) => _$InventoryTransactionModelFromJson(json);
}
