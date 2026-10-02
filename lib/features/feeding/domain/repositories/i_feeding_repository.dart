import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/feeding_entities.dart';

abstract class IFeedingRepository {
  Future<Either<Failure, List<FeedingLog>>> getFeedingsForBatch(String batchId);
  Future<Either<Failure, Unit>> logFeeding(FeedingLog feeding, {required String inventoryItemId});
  
  Future<Either<Failure, List<EnvironmentalReading>>> getEnvironmentalReadings(String batchId);
  Future<Either<Failure, Unit>> logEnvironment(EnvironmentalReading reading);
  
  Future<Either<Failure, List<MortalityRecord>>> getMortalityLogs(String batchId);
  Future<Either<Failure, Unit>> logMortality(MortalityRecord log);
}
