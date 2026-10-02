import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/harvest_entities.dart';
import '../../domain/repositories/i_harvest_repository.dart';
import '../services/harvest_validation_service.dart';

class GetHarvestsUseCase {
  final IHarvestRepository _repository;
  GetHarvestsUseCase(this._repository);

  Future<Either<Failure, List<HarvestRecord>>> execute() {
    return _repository.getAllHarvests();
  }
}

class SaveHarvestUseCase {
  final IHarvestRepository _repository;
  SaveHarvestUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(HarvestRecord harvest, {required bool generateIncomeRecord}) async {
    final errors = HarvestValidationService.validateHarvest(
      grossWeight: harvest.grossWeight,
      netSaleableWeight: harvest.netSaleableWeight,
      rejectedWeight: harvest.rejectedWeight,
      moisturePercentage: harvest.moisturePercentage,
      wastePercentage: harvest.wastePercentage,
      gradeA: harvest.gradeDistribution.gradeAWeight,
      gradeB: harvest.gradeDistribution.gradeBWeight,
      gradeC: harvest.gradeDistribution.gradeCWeight,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.saveHarvest(harvest, generateIncomeRecord: generateIncomeRecord);
  }
}
