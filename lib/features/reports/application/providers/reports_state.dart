import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/report_entities.dart';

part 'reports_state.freezed.dart';

@freezed
abstract class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = ReportsStateInitial;
  const factory ReportsState.loading() = ReportsStateLoading;
  const factory ReportsState.data({
    required FinancialReport financial,
    required ProductionReport production,
  }) = ReportsStateData;
  const factory ReportsState.error(String message) = ReportsStateError;
}
