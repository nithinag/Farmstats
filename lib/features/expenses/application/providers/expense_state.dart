import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/expense_entities.dart';

part 'expense_state.freezed.dart';

@freezed
sealed class ExpenseState with _$ExpenseState {
  const factory ExpenseState.initial() = ExpenseStateInitial;
  const factory ExpenseState.loading() = ExpenseStateLoading;
  const factory ExpenseState.data(List<Expense> expenses) = ExpenseStateData;
  const factory ExpenseState.error(String message) = ExpenseStateError;
}
