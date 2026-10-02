import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../domain/repositories/i_dashboard_repository.dart';

class GetDashboardDataUseCase {
  final IDashboardRepository _repository;

  GetDashboardDataUseCase(this._repository);

  Future<Either<Failure, DashboardData>> execute() async {
    return await _repository.getDashboardData();
  }
}
