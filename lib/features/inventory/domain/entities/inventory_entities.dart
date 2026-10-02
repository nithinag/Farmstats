import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_entities.freezed.dart';

enum InventoryStatus { active, outOfStock, archived }

enum TransactionType { add, consume, transfer, adjust }

@freezed
abstract class InventoryCategory with _$InventoryCategory {
  const factory InventoryCategory({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
  }) = _InventoryCategory;
}

@freezed
abstract class InventoryItem with _$InventoryItem {
  const factory InventoryItem({
    required String id,
    required String name,
    required InventoryCategory category,
    required String unit,
    required double currentQuantity,
    required double minimumQuantity,
    double? maximumQuantity,
    required double purchasePrice,
    String? supplier,
    required DateTime purchaseDate,
    DateTime? expiryDate,
    String? storageLocation,
    required InventoryStatus status,
    String? notes,
  }) = _InventoryItem;
}

@freezed
abstract class InventoryTransaction with _$InventoryTransaction {
  const factory InventoryTransaction({
    required String id,
    required String itemId,
    required double quantity,
    required TransactionType type,
    String? batchId,
    required DateTime date,
    String? reason,
  }) = _InventoryTransaction;
}

@freezed
abstract class InventoryFilter with _$InventoryFilter {
  const factory InventoryFilter({
    String? categoryId,
    InventoryStatus? status,
    bool? lowStockOnly,
    bool? expiringSoonOnly,
  }) = _InventoryFilter;
}
