import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/harvest_entities.dart';

abstract class IHarvestRepository {
  Future<Either<Failure, List<HarvestRecord>>> getAllHarvests();
  Future<Either<Failure, HarvestRecord?>> getHarvestByBatch(String batchId);
  Future<Either<Failure, Unit>> saveHarvest(HarvestRecord harvest, {required bool generateIncomeRecord});
}
