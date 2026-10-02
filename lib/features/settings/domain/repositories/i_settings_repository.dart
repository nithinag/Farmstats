import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/settings_entities.dart';

abstract class ISettingsRepository {
  Future<Either<Failure, FarmProfile>> getFarmProfile();
  Future<Either<Failure, void>> saveFarmProfile(FarmProfile profile);
  
  Future<Either<Failure, AppPreferences>> getAppPreferences();
  Future<Either<Failure, void>> saveAppPreferences(AppPreferences preferences);
}
