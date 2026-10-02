import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../reports/domain/entities/report_entities.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardStateInitial;
  const factory DashboardState.loading() = DashboardStateLoading;
  const factory DashboardState.data({
    required FinancialReport financial,
    required ProductionReport production,
    required int activeBatchesCount,
    required int lowStockCount,
    required int pendingFeedingsCount,
    required List<String> recentActivities,
    required List<String> alerts,
  }) = DashboardStateData;
  const factory DashboardState.error(String message) = DashboardStateError;
}
