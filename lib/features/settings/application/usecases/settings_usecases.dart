import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/settings_entities.dart';
import '../../domain/repositories/i_settings_repository.dart';

class GetFarmProfileUseCase {
  final ISettingsRepository _repository;
  GetFarmProfileUseCase(this._repository);
  Future<Either<Failure, FarmProfile>> execute() => _repository.getFarmProfile();
}

class SaveFarmProfileUseCase {
  final ISettingsRepository _repository;
  SaveFarmProfileUseCase(this._repository);
  Future<Either<Failure, void>> execute(FarmProfile profile) => _repository.saveFarmProfile(profile);
}

class GetAppPreferencesUseCase {
  final ISettingsRepository _repository;
  GetAppPreferencesUseCase(this._repository);
  Future<Either<Failure, AppPreferences>> execute() => _repository.getAppPreferences();
}

class SaveAppPreferencesUseCase {
  final ISettingsRepository _repository;
  SaveAppPreferencesUseCase(this._repository);
  Future<Either<Failure, void>> execute(AppPreferences preferences) => _repository.saveAppPreferences(preferences);
}
