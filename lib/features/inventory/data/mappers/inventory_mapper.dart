import '../../domain/entities/inventory_entities.dart';
import '../models/inventory_models.dart';

class InventoryMapper {
  static InventoryCategory categoryFromModel(InventoryCategoryModel model) {
    return InventoryCategory(
      id: model.id,
      name: model.name,
      colorCode: model.colorCode,
      iconName: model.iconName,
    );
  }

  static InventoryCategoryModel categoryToModel(InventoryCategory entity) {
    return InventoryCategoryModel(
      id: entity.id,
      name: entity.name,
      colorCode: entity.colorCode,
      iconName: entity.iconName,
    );
  }

  static InventoryItem fromModel(InventoryItemModel model) {
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final status = InventoryStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == model.status.trim().toLowerCase(),
      orElse: () => InventoryStatus.active,
    );

    return InventoryItem(
      id: model.id,
      name: model.name,
      category: categoryFromModel(model.category),
      unit: model.unit,
      currentQuantity: model.currentQuantity,
      minimumQuantity: model.minimumQuantity,
      maximumQuantity: model.maximumQuantity,
      purchasePrice: model.purchasePrice,
      supplier: model.supplier,
      purchaseDate: parseDate(model.purchaseDate, DateTime.now()),
      expiryDate: model.expiryDate != null ? parseDate(model.expiryDate, DateTime.now()) : null,
      storageLocation: model.storageLocation,
      status: status,
      notes: model.notes,
    );
  }

  static InventoryItemModel toModel(InventoryItem entity) {
    return InventoryItemModel(
      id: entity.id,
      name: entity.name,
      category: categoryToModel(entity.category),
      unit: entity.unit,
      currentQuantity: entity.currentQuantity,
      minimumQuantity: entity.minimumQuantity,
      maximumQuantity: entity.maximumQuantity,
      purchasePrice: entity.purchasePrice,
      supplier: entity.supplier,
      purchaseDate: entity.purchaseDate.toIso8601String(),
      expiryDate: entity.expiryDate?.toIso8601String(),
      storageLocation: entity.storageLocation,
      status: entity.status.name,
      notes: entity.notes,
    );
  }

  static InventoryTransaction transactionFromModel(InventoryTransactionModel model) {
    DateTime parseDate(String? s, DateTime fallback) {
      if (s == null || s.trim().isEmpty) return fallback;
      try {
        return DateTime.parse(s);
      } catch (_) {
        return fallback;
      }
    }

    final type = TransactionType.values.firstWhere(
      (e) => e.name.toLowerCase() == model.type.trim().toLowerCase(),
      orElse: () => TransactionType.consume,
    );

    return InventoryTransaction(
      id: model.id,
      itemId: model.itemId,
      quantity: model.quantity,
      type: type,
      batchId: model.batchId,
      date: parseDate(model.date, DateTime.now()),
      reason: model.reason,
    );
  }

  static InventoryTransactionModel transactionToModel(InventoryTransaction entity) {
    return InventoryTransactionModel(
      id: entity.id,
      itemId: entity.itemId,
      quantity: entity.quantity,
      type: entity.type.name,
      batchId: entity.batchId,
      date: entity.date.toIso8601String(),
      reason: entity.reason,
    );
  }
}
