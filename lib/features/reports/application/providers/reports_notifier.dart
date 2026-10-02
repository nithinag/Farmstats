import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/i_reports_repository.dart';
import '../../data/repositories/reports_repository_impl.dart';
import '../../data/datasources/i_reports_datasource.dart';
import '../../data/datasources/reports_drift_datasource.dart';
import '../../../../data/providers/database_provider.dart';
import '../usecases/report_usecases.dart';
import '../../domain/entities/report_entities.dart';
import '../services/report_services.dart';
import 'reports_state.dart';

final reportsDataSourceProvider = Provider<IReportsDataSource>((ref) {
  return ReportsDriftDataSourceImpl(ref.watch(appDatabaseProvider).reportsDao);
});

final reportsRepositoryProvider = Provider<IReportsRepository>((ref) {
  return ReportsRepositoryImpl(ref.watch(reportsDataSourceProvider));
});

final getFinancialReportUseCaseProvider = Provider((ref) => GetFinancialReportUseCase(ref.watch(reportsRepositoryProvider)));
final getProductionReportUseCaseProvider = Provider((ref) => GetProductionReportUseCase(ref.watch(reportsRepositoryProvider)));

final reportsNotifierProvider = NotifierProvider<ReportsNotifier, ReportsState>(() {
  return ReportsNotifier();
});

class ReportsNotifier extends Notifier<ReportsState> {
  TimeFilter _currentFilter = TimeFilter.monthly;
  DateTime? _customStart;
  DateTime? _customEnd;

  @override
  ReportsState build() {
    loadReports();
    return const ReportsState.initial();
  }

  void setFilter(TimeFilter filter, {DateTime? customStart, DateTime? customEnd}) {
    _currentFilter = filter;
    _customStart = customStart;
    _customEnd = customEnd;
    loadReports();
  }

  Future<void> loadReports() async {
    state = const ReportsState.loading();
    
    final (start, end) = DateRangeService.getDateRangeForFilter(
      _currentFilter, 
      customStart: _customStart, 
      customEnd: _customEnd
    );

    final finResult = await ref.read(getFinancialReportUseCaseProvider).execute(start, end);
    final prodResult = await ref.read(getProductionReportUseCaseProvider).execute(start, end);

    finResult.fold(
      (f) => state = ReportsState.error(f.message),
      (financial) {
        prodResult.fold(
          (f) => state = ReportsState.error(f.message),
          (production) {
            state = ReportsState.data(financial: financial, production: production);
          },
        );
      },
    );
  }
}
