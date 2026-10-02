import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/settings_entities.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../datasources/i_settings_datasource.dart';
import '../mappers/settings_mapper.dart';
import '../../application/services/settings_validator_service.dart';

class SettingsRepositoryImpl implements ISettingsRepository {
  final ISettingsDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, FarmProfile>> getFarmProfile() async {
    try {
      final model = await _dataSource.getFarmProfile();
      if (model != null) {
        return Right(SettingsMapper.fromProfileModel(model));
      }
      return const Right(FarmProfile());
    } catch (e) {
      return Left(Failure('Failed to load Farm Profile: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveFarmProfile(FarmProfile profile) async {
    try {
      final nameError = SettingsValidatorService.validateFarmName(profile.farmName);
      if (nameError != null) return Left(Failure(nameError));

      if (!SettingsValidatorService.isValidEmail(profile.email)) {
        return const Left(Failure('Invalid email address format'));
      }
      if (!SettingsValidatorService.isValidPhone(profile.phone)) {
        return const Left(Failure('Invalid phone number format'));
      }

      final model = SettingsMapper.toProfileModel(profile);
      await _dataSource.saveFarmProfile(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to save Farm Profile: $e'));
    }
  }

  @override
  Future<Either<Failure, AppPreferences>> getAppPreferences() async {
    try {
      final model = await _dataSource.getAppPreferences();
      if (model != null) {
        return Right(SettingsMapper.fromPrefsModel(model));
      }
      return const Right(AppPreferences());
    } catch (e) {
      return Left(Failure('Failed to load Preferences: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveAppPreferences(AppPreferences preferences) async {
    try {
      final model = SettingsMapper.toPrefsModel(preferences);
      await _dataSource.saveAppPreferences(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to save Preferences: $e'));
    }
  }
}
