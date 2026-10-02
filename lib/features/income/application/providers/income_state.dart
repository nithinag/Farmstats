import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/income_entities.dart';

part 'income_state.freezed.dart';

@freezed
abstract class IncomeState with _$IncomeState {
  const factory IncomeState.initial() = IncomeStateInitial;
  const factory IncomeState.loading() = IncomeStateLoading;
  const factory IncomeState.data(List<Income> incomes) = IncomeStateData;
  const factory IncomeState.error(String message) = IncomeStateError;
}
