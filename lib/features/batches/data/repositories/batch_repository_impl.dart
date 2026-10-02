import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/batch_entities.dart';
import '../../domain/repositories/i_batch_repository.dart';
import '../datasources/i_batch_datasource.dart';
import '../mappers/batch_mapper.dart';

class BatchRepositoryImpl implements IBatchRepository {
  final IBatchDataSource _dataSource;

  BatchRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Batch>>> getBatches() async {
    try {
      final models = await _dataSource.getBatches();
      return Right(models.map(BatchMapper.fromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load batches: $e'));
    }
  }

  @override
  Future<Either<Failure, Batch>> getBatchById(String id) async {
    try {
      final model = await _dataSource.getBatchById(id);
      if (model != null) {
        return Right(BatchMapper.fromModel(model));
      }
      return const Left(Failure('Batch not found'));
    } catch (e) {
      return Left(Failure('Failed to load batch: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addBatch(Batch batch) async {
    try {
      final model = BatchMapper.toModel(batch);
      await _dataSource.addBatch(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add batch: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBatch(Batch batch) async {
    try {
      final model = BatchMapper.toModel(batch);
      await _dataSource.updateBatch(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to update batch: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteBatch(String id) async {
    try {
      await _dataSource.deleteBatch(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to delete batch: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BatchTimelineEvent>>> getBatchTimeline(String batchId) async {
    try {
      final models = await _dataSource.getBatchTimeline(batchId);
      return Right(models.map(BatchMapper.timelineFromModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load timeline: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTimelineEvent(BatchTimelineEvent event) async {
    try {
      final model = BatchMapper.timelineToModel(event);
      await _dataSource.addTimelineEvent(model);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add timeline event: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Batch>>> filterBatches(BatchFilter filter) async {
    try {
      final models = await _dataSource.getBatches();
      final entities = models.map(BatchMapper.fromModel).toList();
      
      final filtered = entities.where((e) {
        if (filter.statuses != null && filter.statuses!.isNotEmpty && !filter.statuses!.contains(e.status)) return false;
        if (filter.rearingHouse != null && e.rearingHouse != filter.rearingHouse) return false;
        if (filter.silkwormVariety != null && e.silkwormVariety != filter.silkwormVariety) return false;
        if (filter.startDateAfter != null && e.startDate.isBefore(filter.startDateAfter!)) return false;
        if (filter.startDateBefore != null && e.startDate.isAfter(filter.startDateBefore!)) return false;
        return true;
      }).toList();

      return Right(filtered);
    } catch (e) {
      return Left(Failure('Failed to filter batches: $e'));
    }
  }
}
