import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_models.freezed.dart';
part 'settings_models.g.dart';

@freezed
abstract class FarmProfileModel with _$FarmProfileModel {
  const factory FarmProfileModel({
    @Default('') String farmName,
    @Default('') String ownerName,
    @Default('') String address,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String gstNumber,
    @Default(0.0) double farmArea,
    @Default(0) int numRearingHouses,
    @Default('V1') String defaultMulberryVariety,
  }) = _FarmProfileModel;

  factory FarmProfileModel.fromJson(Map<String, dynamic> json) => _$FarmProfileModelFromJson(json);
}

@freezed
abstract class AppPreferencesModel with _$AppPreferencesModel {
  const factory AppPreferencesModel({
    @Default('system') String themeMode,
    @Default('celsius') String temperatureUnit,
    @Default('kg') String weightUnit,
    @Default('acres') String areaUnit,
    @Default('inr') String currency,
    @Default(true) bool enableNotifications,
    @Default(true) bool autoBackupEnabled,
  }) = _AppPreferencesModel;

  factory AppPreferencesModel.fromJson(Map<String, dynamic> json) => _$AppPreferencesModelFromJson(json);
}
