import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/settings_models.dart';
import 'i_settings_datasource.dart';

class SettingsLocalDataSourceImpl implements ISettingsDataSource {
  final SharedPreferences _prefs;
  
  static const String _profileKey = 'FARM_PROFILE';
  static const String _prefsKey = 'APP_PREFS';

  SettingsLocalDataSourceImpl(this._prefs);

  @override
  Future<FarmProfileModel?> getFarmProfile() async {
    final jsonString = _prefs.getString(_profileKey);
    if (jsonString != null) {
      return FarmProfileModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  @override
  Future<void> saveFarmProfile(FarmProfileModel profile) async {
    final jsonString = jsonEncode(profile.toJson());
    await _prefs.setString(_profileKey, jsonString);
  }

  @override
  Future<AppPreferencesModel?> getAppPreferences() async {
    final jsonString = _prefs.getString(_prefsKey);
    if (jsonString != null) {
      return AppPreferencesModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  @override
  Future<void> saveAppPreferences(AppPreferencesModel preferences) async {
    final jsonString = jsonEncode(preferences.toJson());
    await _prefs.setString(_prefsKey, jsonString);
  }
}
