import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch_entities.dart';

abstract class IBatchRepository {
  Future<Either<Failure, List<Batch>>> getBatches();
  Future<Either<Failure, Batch>> getBatchById(String id);
  Future<Either<Failure, Unit>> addBatch(Batch batch);
  Future<Either<Failure, Unit>> updateBatch(Batch batch);
  Future<Either<Failure, Unit>> deleteBatch(String id);
  Future<Either<Failure, List<Batch>>> filterBatches(BatchFilter filter);
  Future<Either<Failure, List<BatchTimelineEvent>>> getBatchTimeline(String batchId);
  Future<Either<Failure, Unit>> addTimelineEvent(BatchTimelineEvent event);
}
