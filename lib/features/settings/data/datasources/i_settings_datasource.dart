import '../models/settings_models.dart';

abstract class ISettingsDataSource {
  Future<FarmProfileModel?> getFarmProfile();
  Future<void> saveFarmProfile(FarmProfileModel profile);
  
  Future<AppPreferencesModel?> getAppPreferences();
  Future<void> saveAppPreferences(AppPreferencesModel preferences);
}
