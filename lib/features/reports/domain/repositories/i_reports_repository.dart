import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/report_entities.dart';

abstract class IReportsRepository {
  Future<Either<Failure, FinancialReport>> getFinancialReport(DateTime start, DateTime end);
  Future<Either<Failure, ProductionReport>> getProductionReport(DateTime start, DateTime end);
}
