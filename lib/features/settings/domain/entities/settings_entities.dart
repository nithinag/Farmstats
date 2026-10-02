import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_entities.freezed.dart';

enum ThemeModePreference { light, dark, system }
enum TemperatureUnit { celsius, fahrenheit }
enum WeightUnit { kg, g, lbs }
enum AreaUnit { acres, hectares, sqMeters }
enum CurrencyCode { inr, usd, eur, gbp }

@freezed
abstract class FarmProfile with _$FarmProfile {
  const factory FarmProfile({
    @Default('') String farmName,
    @Default('') String ownerName,
    @Default('') String address,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String gstNumber,
    @Default(0.0) double farmArea,
    @Default(0) int numRearingHouses,
    @Default('V1') String defaultMulberryVariety,
  }) = _FarmProfile;
}

@freezed
abstract class AppPreferences with _$AppPreferences {
  const factory AppPreferences({
    @Default(ThemeModePreference.system) ThemeModePreference themeMode,
    @Default(TemperatureUnit.celsius) TemperatureUnit temperatureUnit,
    @Default(WeightUnit.kg) WeightUnit weightUnit,
    @Default(AreaUnit.acres) AreaUnit areaUnit,
    @Default(CurrencyCode.inr) CurrencyCode currency,
    @Default(true) bool enableNotifications,
    @Default(true) bool autoBackupEnabled,
  }) = _AppPreferences;
}
