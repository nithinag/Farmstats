// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) =>
    _ExpenseModel(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      date: json['date'] as String,
      category: ExpenseCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      paymentMethod: json['payment_method'] as String,
      description: json['description'] as String,
      batchId: json['batch_id'] as String?,
      receiptUrl: json['receipt_url'] as String?,
    );

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'quantity': instance.quantity,
      'date': instance.date,
      'category': instance.category,
      'payment_method': instance.paymentMethod,
      'description': instance.description,
      'batch_id': instance.batchId,
      'receipt_url': instance.receiptUrl,
    };

_ExpenseCategoryModel _$ExpenseCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _ExpenseCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      colorCode: json['color_code'] as String,
      iconName: json['icon_name'] as String,
    );

Map<String, dynamic> _$ExpenseCategoryModelToJson(
        _ExpenseCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color_code': instance.colorCode,
      'icon_name': instance.iconName,
    };

_ExpenseSummaryModel _$ExpenseSummaryModelFromJson(Map<String, dynamic> json) =>
    _ExpenseSummaryModel(
      totalAmount: (json['total_amount'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      amountByCategory:
          (json['amount_by_category'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$ExpenseSummaryModelToJson(
        _ExpenseSummaryModel instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'count': instance.count,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'amount_by_category': instance.amountByCategory,
    };
