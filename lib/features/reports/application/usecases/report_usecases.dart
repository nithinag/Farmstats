import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/report_entities.dart';
import '../../domain/repositories/i_reports_repository.dart';

class GetFinancialReportUseCase {
  final IReportsRepository _repository;
  GetFinancialReportUseCase(this._repository);

  Future<Either<Failure, FinancialReport>> execute(DateTime start, DateTime end) {
    return _repository.getFinancialReport(start, end);
  }
}

class GetProductionReportUseCase {
  final IReportsRepository _repository;
  GetProductionReportUseCase(this._repository);

  Future<Either<Failure, ProductionReport>> execute(DateTime start, DateTime end) {
    return _repository.getProductionReport(start, end);
  }
}
