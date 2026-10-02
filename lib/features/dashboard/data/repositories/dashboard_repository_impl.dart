import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/dashboard_entities.dart';
import '../../domain/repositories/i_dashboard_repository.dart';
import '../datasources/dashboard_mock_datasource.dart';
import '../mappers/dashboard_mapper.dart';

class DashboardRepositoryImpl implements IDashboardRepository {
  final IDashboardDataSource _dataSource;

  DashboardRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    try {
      final model = await _dataSource.getMockDashboardData();
      final entity = DashboardMapper.fromModel(model);
      return Right(entity);
    } catch (e) {
      return Left(Failure('Failed to load dashboard data: $e'));
    }
  }
}
