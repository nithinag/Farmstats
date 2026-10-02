import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/feeding_entities.dart';
import '../../domain/repositories/i_feeding_repository.dart';
import '../services/feeding_validation_service.dart';

class GetFeedingsUseCase {
  final IFeedingRepository _repository;
  GetFeedingsUseCase(this._repository);

  Future<Either<Failure, List<FeedingLog>>> execute(String batchId) {
    return _repository.getFeedingsForBatch(batchId);
  }
}

class LogFeedingUseCase {
  final IFeedingRepository _repository;
  LogFeedingUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(FeedingLog log, {required String inventoryItemId}) async {
    final errors = FeedingValidationService.validateFeeding(
      leafQuantity: log.leafQuantity,
      feedingRound: log.feedingRound,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.logFeeding(log, inventoryItemId: inventoryItemId);
  }
}

class LogMortalityUseCase {
  final IFeedingRepository _repository;
  LogMortalityUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(MortalityRecord record) async {
    final errors = HealthValidationService.validateMortality(
      deadCount: record.deadCount,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.logMortality(record);
  }
}

class LogEnvironmentUseCase {
  final IFeedingRepository _repository;
  LogEnvironmentUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(EnvironmentalReading reading) async {
    final errors = HealthValidationService.validateEnvironment(
      temperature: reading.temperature,
      humidity: reading.humidity,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.logEnvironment(reading);
  }
}
