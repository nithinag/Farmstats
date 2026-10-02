import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/batch_entities.dart';
import '../../domain/repositories/i_batch_repository.dart';
import '../services/batch_validation_service.dart';
import 'package:uuid/uuid.dart';

class GetBatchesUseCase {
  final IBatchRepository _repository;
  GetBatchesUseCase(this._repository);

  Future<Either<Failure, List<Batch>>> execute() => _repository.getBatches();
}

class AddBatchUseCase {
  final IBatchRepository _repository;
  AddBatchUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Batch batch) async {
    final errors = BatchValidationService.validate(
      startDate: batch.startDate,
      expectedHarvestDate: batch.expectedHarvestDate,
      numberOfDfls: batch.numberOfDfls,
      temperature: batch.temperature,
      humidity: batch.humidity,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    final res = await _repository.addBatch(batch);
    if (res.isRight()) {
      await _repository.addTimelineEvent(BatchTimelineEvent(
        id: const Uuid().v4(),
        batchId: batch.id,
        timestamp: DateTime.now(),
        eventType: 'CREATED',
        description: 'Batch ${batch.batchName} created with ${batch.numberOfDfls} DFLs.',
      ));
    }
    return res;
  }
}

class UpdateBatchUseCase {
  final IBatchRepository _repository;
  UpdateBatchUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Batch batch, Batch oldBatch) async {
    final errors = BatchValidationService.validate(
      startDate: batch.startDate,
      expectedHarvestDate: batch.expectedHarvestDate,
      numberOfDfls: batch.numberOfDfls,
      temperature: batch.temperature,
      humidity: batch.humidity,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    if (!BatchValidationService.canTransitionStatus(oldBatch.status, batch.status)) {
      return const Left(Failure('Invalid status transition.'));
    }

    final res = await _repository.updateBatch(batch);
    
    if (res.isRight()) {
      if (oldBatch.currentStage != batch.currentStage) {
         await _repository.addTimelineEvent(BatchTimelineEvent(
          id: const Uuid().v4(),
          batchId: batch.id,
          timestamp: DateTime.now(),
          eventType: 'STAGE_CHANGE',
          description: 'Stage updated from ${oldBatch.currentStage.name} to ${batch.currentStage.name}.',
        ));
      }
      if (oldBatch.status != batch.status) {
         await _repository.addTimelineEvent(BatchTimelineEvent(
          id: const Uuid().v4(),
          batchId: batch.id,
          timestamp: DateTime.now(),
          eventType: 'STATUS_CHANGE',
          description: 'Status changed to ${batch.status.name}.',
        ));
      }
    }

    return res;
  }
}

class GetBatchTimelineUseCase {
  final IBatchRepository _repository;
  GetBatchTimelineUseCase(this._repository);

  Future<Either<Failure, List<BatchTimelineEvent>>> execute(String batchId) => _repository.getBatchTimeline(batchId);
}
