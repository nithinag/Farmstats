import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/feeding_entities.dart';
import '../../domain/repositories/i_feeding_repository.dart';
import '../datasources/i_feeding_datasource.dart';
import '../mappers/feeding_mapper.dart';

class FeedingRepositoryImpl implements IFeedingRepository {
  final IFeedingDataSource _dataSource;

  FeedingRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<FeedingLog>>> getFeedingsForBatch(String batchId) async {
    try {
      final models = await _dataSource.getFeedingsForBatch(batchId);
      return Right(models.map(FeedingMapper.fromFeedingLogModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load feedings: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logFeeding(FeedingLog feeding, {required String inventoryItemId}) async {
    try {
      await _dataSource.logFeeding(FeedingMapper.toFeedingLogModel(feeding), inventoryItemId: inventoryItemId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to log feeding: $e'));
    }
  }

  @override
  Future<Either<Failure, List<EnvironmentalReading>>> getEnvironmentalReadings(String batchId) async {
    try {
      final models = await _dataSource.getEnvironmentalReadings(batchId);
      return Right(models.map(FeedingMapper.fromEnvModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load environmental readings: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logEnvironment(EnvironmentalReading reading) async {
    try {
      await _dataSource.logEnvironment(FeedingMapper.toEnvModel(reading));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to log environment: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MortalityRecord>>> getMortalityLogs(String batchId) async {
    try {
      final models = await _dataSource.getMortalityLogs(batchId);
      return Right(models.map(FeedingMapper.fromMortalityModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load mortality logs: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logMortality(MortalityRecord log) async {
    try {
      await _dataSource.logMortality(FeedingMapper.toMortalityModel(log));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to log mortality: $e'));
    }
  }
}
