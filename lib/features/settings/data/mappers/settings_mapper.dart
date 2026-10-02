import '../../domain/entities/settings_entities.dart';
import '../models/settings_models.dart';

class SettingsMapper {
  static FarmProfile fromProfileModel(FarmProfileModel model) {
    return FarmProfile(
      farmName: model.farmName,
      ownerName: model.ownerName,
      address: model.address,
      phone: model.phone,
      email: model.email,
      gstNumber: model.gstNumber,
      farmArea: model.farmArea,
      numRearingHouses: model.numRearingHouses,
      defaultMulberryVariety: model.defaultMulberryVariety,
    );
  }

  static FarmProfileModel toProfileModel(FarmProfile entity) {
    return FarmProfileModel(
      farmName: entity.farmName,
      ownerName: entity.ownerName,
      address: entity.address,
      phone: entity.phone,
      email: entity.email,
      gstNumber: entity.gstNumber,
      farmArea: entity.farmArea,
      numRearingHouses: entity.numRearingHouses,
      defaultMulberryVariety: entity.defaultMulberryVariety,
    );
  }

  static AppPreferences fromPrefsModel(AppPreferencesModel model) {
    return AppPreferences(
      themeMode: ThemeModePreference.values.firstWhere((e) => e.name == model.themeMode, orElse: () => ThemeModePreference.system),
      temperatureUnit: TemperatureUnit.values.firstWhere((e) => e.name == model.temperatureUnit, orElse: () => TemperatureUnit.celsius),
      weightUnit: WeightUnit.values.firstWhere((e) => e.name == model.weightUnit, orElse: () => WeightUnit.kg),
      areaUnit: AreaUnit.values.firstWhere((e) => e.name == model.areaUnit, orElse: () => AreaUnit.acres),
      currency: CurrencyCode.values.firstWhere((e) => e.name == model.currency, orElse: () => CurrencyCode.inr),
      enableNotifications: model.enableNotifications,
      autoBackupEnabled: model.autoBackupEnabled,
    );
  }

  static AppPreferencesModel toPrefsModel(AppPreferences entity) {
    return AppPreferencesModel(
      themeMode: entity.themeMode.name,
      temperatureUnit: entity.temperatureUnit.name,
      weightUnit: entity.weightUnit.name,
      areaUnit: entity.areaUnit.name,
      currency: entity.currency.name,
      enableNotifications: entity.enableNotifications,
      autoBackupEnabled: entity.autoBackupEnabled,
    );
  }
}
