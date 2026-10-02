import '../models/inventory_models.dart';

abstract class IInventoryDataSource {
  Future<List<InventoryItemModel>> getInventoryItems();
  Future<InventoryItemModel?> getItemById(String id);
  Future<void> addItem(InventoryItemModel item);
  Future<void> updateItem(InventoryItemModel item);
  Future<void> deleteItem(String id);
  Future<List<InventoryCategoryModel>> getCategories();
  
  Future<void> performTransaction(InventoryTransactionModel transaction);
  Future<List<InventoryTransactionModel>> getStockHistory(String itemId);
}
