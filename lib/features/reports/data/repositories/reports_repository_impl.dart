import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/report_entities.dart';
import '../../domain/repositories/i_reports_repository.dart';
import '../datasources/i_reports_datasource.dart';
import '../mappers/report_mapper.dart';

class ReportsRepositoryImpl implements IReportsRepository {
  final IReportsDataSource _dataSource;

  ReportsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, FinancialReport>> getFinancialReport(DateTime start, DateTime end) async {
    try {
      final model = await _dataSource.getFinancialReport(start, end);
      return Right(ReportMapper.fromFinancialModel(model));
    } catch (e) {
      return Left(Failure('Failed to load financial report: $e'));
    }
  }

  @override
  Future<Either<Failure, ProductionReport>> getProductionReport(DateTime start, DateTime end) async {
    try {
      final model = await _dataSource.getProductionReport(start, end);
      return Right(ReportMapper.fromProductionModel(model));
    } catch (e) {
      return Left(Failure('Failed to load production report: $e'));
    }
  }
}
