import '../../../../data/database/app_database.dart';
import '../../../../data/database/daos/inventory_dao.dart';
import '../models/inventory_models.dart';
import 'i_inventory_datasource.dart';

class InventoryDriftDataSourceImpl implements IInventoryDataSource {
  final InventoryDao _dao;

  InventoryDriftDataSourceImpl(this._dao);

  InventoryCategoryModel _mapCategory(InventoryCategoryDbModel dbModel) {
    return InventoryCategoryModel(
      id: dbModel.id,
      name: dbModel.name,
      colorCode: dbModel.colorCode,
      iconName: dbModel.iconName,
    );
  }

  InventoryItemModel _mapItem(InventoryItemDbModel dbModel, InventoryCategoryDbModel categoryModel) {
    return InventoryItemModel(
      id: dbModel.id,
      name: dbModel.name,
      category: _mapCategory(categoryModel),
      unit: dbModel.unit,
      currentQuantity: dbModel.currentQuantity,
      minimumQuantity: dbModel.minimumQuantity,
      maximumQuantity: dbModel.maximumQuantity,
      purchasePrice: dbModel.purchasePrice,
      supplier: dbModel.supplier,
      purchaseDate: dbModel.purchaseDate.toIso8601String(),
      expiryDate: dbModel.expiryDate?.toIso8601String(),
      storageLocation: dbModel.storageLocation,
      status: dbModel.status,
      notes: dbModel.notes,
    );
  }

  InventoryItemDbModel _mapToDbModel(InventoryItemModel model) {
    return InventoryItemDbModel(
      id: model.id,
      name: model.name,
      categoryId: model.category.id,
      unit: model.unit,
      currentQuantity: model.currentQuantity,
      minimumQuantity: model.minimumQuantity,
      maximumQuantity: model.maximumQuantity,
      purchasePrice: model.purchasePrice,
      supplier: model.supplier,
      purchaseDate: DateTime.parse(model.purchaseDate),
      expiryDate: model.expiryDate != null ? DateTime.parse(model.expiryDate!) : null,
      storageLocation: model.storageLocation,
      status: model.status,
      notes: model.notes,
    );
  }

  @override
  Future<List<InventoryItemModel>> getInventoryItems() async {
    final rows = await _dao.getAllInventoryItems();
    return rows.map((row) {
      return _mapItem(
        row.readTable(_dao.inventoryItemsTable),
        row.readTable(_dao.inventoryCategoriesTable),
      );
    }).toList();
  }

  @override
  Future<InventoryItemModel?> getItemById(String id) async {
    final row = await _dao.getItemById(id);
    if (row == null) return null;
    return _mapItem(
      row.readTable(_dao.inventoryItemsTable),
      row.readTable(_dao.inventoryCategoriesTable),
    );
  }

  @override
  Future<void> addItem(InventoryItemModel item) async {
    await _dao.insertItem(_mapToDbModel(item));
  }

  @override
  Future<void> updateItem(InventoryItemModel item) async {
    await _dao.updateItem(_mapToDbModel(item));
  }

  @override
  Future<void> deleteItem(String id) async {
    await _dao.deleteItem(id);
  }

  @override
  Future<List<InventoryCategoryModel>> getCategories() async {
    final rows = await _dao.getCategories();
    return rows.map(_mapCategory).toList();
  }

  @override
  Future<void> performTransaction(InventoryTransactionModel transaction) async {
    await _dao.insertTransaction(InventoryTransactionDbModel(
      id: transaction.id,
      itemId: transaction.itemId,
      quantity: transaction.quantity,
      type: transaction.type,
      batchId: transaction.batchId,
      date: DateTime.parse(transaction.date),
      reason: transaction.reason,
    ));
  }

  @override
  Future<List<InventoryTransactionModel>> getStockHistory(String itemId) async {
    final rows = await _dao.getStockHistory(itemId);
    return rows.map((dbModel) => InventoryTransactionModel(
      id: dbModel.id,
      itemId: dbModel.itemId,
      quantity: dbModel.quantity,
      type: dbModel.type,
      batchId: dbModel.batchId,
      date: dbModel.date.toIso8601String(),
      reason: dbModel.reason,
    )).toList();
  }
}
