import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/harvest_entities.dart';
import '../../domain/repositories/i_harvest_repository.dart';
import '../datasources/i_harvest_datasource.dart';
import '../mappers/harvest_mapper.dart';

class HarvestRepositoryImpl implements IHarvestRepository {
  final IHarvestDataSource _dataSource;

  HarvestRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<HarvestRecord>>> getAllHarvests() async {
    try {
      final models = await _dataSource.getAllHarvests();
      return Right(models.map(HarvestMapper.fromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load harvests: $e'));
    }
  }

  @override
  Future<Either<Failure, HarvestRecord?>> getHarvestByBatch(String batchId) async {
    try {
      final model = await _dataSource.getHarvestByBatch(batchId);
      if (model != null) {
        return Right(HarvestMapper.fromModel(model));
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to get harvest: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveHarvest(HarvestRecord harvest, {required bool generateIncomeRecord}) async {
    try {
      await _dataSource.saveHarvest(HarvestMapper.toModel(harvest), generateIncomeRecord: generateIncomeRecord);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to save harvest: $e'));
    }
  }
}
