import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_entities.freezed.dart';

@freezed
abstract class Income with _$Income {
  const factory Income({
    required String id,
    required DateTime saleDate,
    String? batchId,
    required Buyer buyer,
    required IncomeCategory category,
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
  }) = _Income;
}

@freezed
abstract class IncomeCategory with _$IncomeCategory {
  const factory IncomeCategory({
    required String id,
    required String name,
    required String colorCode,
    required String iconName,
  }) = _IncomeCategory;
}

@freezed
abstract class Buyer with _$Buyer {
  const factory Buyer({
    required String id,
    required String name,
    required String contact,
  }) = _Buyer;
}

@freezed
abstract class IncomeFilter with _$IncomeFilter {
  const factory IncomeFilter({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? buyerIds,
    String? batchId,
    String? paymentStatus,
    double? minAmount,
    double? maxAmount,
  }) = _IncomeFilter;
}
