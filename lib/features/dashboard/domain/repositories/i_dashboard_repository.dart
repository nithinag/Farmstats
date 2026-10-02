import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/dashboard_entities.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, DashboardData>> getDashboardData();
}
