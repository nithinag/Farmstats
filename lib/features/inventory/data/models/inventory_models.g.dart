// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryCategoryModel _$InventoryCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _InventoryCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      colorCode: json['colorCode'] as String,
      iconName: json['iconName'] as String,
    );

Map<String, dynamic> _$InventoryCategoryModelToJson(
        _InventoryCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorCode': instance.colorCode,
      'iconName': instance.iconName,
    };

_InventoryItemModel _$InventoryItemModelFromJson(Map<String, dynamic> json) =>
    _InventoryItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: InventoryCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      unit: json['unit'] as String,
      currentQuantity: (json['currentQuantity'] as num).toDouble(),
      minimumQuantity: (json['minimumQuantity'] as num).toDouble(),
      maximumQuantity: (json['maximumQuantity'] as num?)?.toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      supplier: json['supplier'] as String?,
      purchaseDate: json['purchaseDate'] as String,
      expiryDate: json['expiryDate'] as String?,
      storageLocation: json['storageLocation'] as String?,
      status: json['status'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$InventoryItemModelToJson(_InventoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'unit': instance.unit,
      'currentQuantity': instance.currentQuantity,
      'minimumQuantity': instance.minimumQuantity,
      'maximumQuantity': instance.maximumQuantity,
      'purchasePrice': instance.purchasePrice,
      'supplier': instance.supplier,
      'purchaseDate': instance.purchaseDate,
      'expiryDate': instance.expiryDate,
      'storageLocation': instance.storageLocation,
      'status': instance.status,
      'notes': instance.notes,
    };

_InventoryTransactionModel _$InventoryTransactionModelFromJson(
        Map<String, dynamic> json) =>
    _InventoryTransactionModel(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      type: json['type'] as String,
      batchId: json['batchId'] as String?,
      date: json['date'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$InventoryTransactionModelToJson(
        _InventoryTransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'quantity': instance.quantity,
      'type': instance.type,
      'batchId': instance.batchId,
      'date': instance.date,
      'reason': instance.reason,
    };
