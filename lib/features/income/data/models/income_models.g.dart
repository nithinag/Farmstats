// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => _IncomeModel(
      id: json['id'] as String,
      saleDate: json['saleDate'] as String,
      batchId: json['batchId'] as String?,
      buyer: BuyerModel.fromJson(json['buyer'] as Map<String, dynamic>),
      category: IncomeCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      cocoonGrade: json['cocoonGrade'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      grossAmount: (json['grossAmount'] as num).toDouble(),
      transportCharges: (json['transportCharges'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
      netAmount: (json['netAmount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      paymentStatus: json['paymentStatus'] as String,
      invoiceNumber: json['invoiceNumber'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$IncomeModelToJson(_IncomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'saleDate': instance.saleDate,
      'batchId': instance.batchId,
      'buyer': instance.buyer,
      'category': instance.category,
      'cocoonGrade': instance.cocoonGrade,
      'quantity': instance.quantity,
      'rate': instance.rate,
      'grossAmount': instance.grossAmount,
      'transportCharges': instance.transportCharges,
      'commission': instance.commission,
      'netAmount': instance.netAmount,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'invoiceNumber': instance.invoiceNumber,
      'remarks': instance.remarks,
    };

_IncomeCategoryModel _$IncomeCategoryModelFromJson(Map<String, dynamic> json) =>
    _IncomeCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      colorCode: json['colorCode'] as String,
      iconName: json['iconName'] as String,
    );

Map<String, dynamic> _$IncomeCategoryModelToJson(
        _IncomeCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorCode': instance.colorCode,
      'iconName': instance.iconName,
    };

_BuyerModel _$BuyerModelFromJson(Map<String, dynamic> json) => _BuyerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      contact: json['contact'] as String,
    );

Map<String, dynamic> _$BuyerModelToJson(_BuyerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contact': instance.contact,
    };
