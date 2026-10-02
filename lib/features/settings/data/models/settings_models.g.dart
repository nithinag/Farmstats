// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FarmProfileModel _$FarmProfileModelFromJson(Map<String, dynamic> json) =>
    _FarmProfileModel(
      farmName: json['farmName'] as String? ?? '',
      ownerName: json['ownerName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gstNumber: json['gstNumber'] as String? ?? '',
      farmArea: (json['farmArea'] as num?)?.toDouble() ?? 0.0,
      numRearingHouses: (json['numRearingHouses'] as num?)?.toInt() ?? 0,
      defaultMulberryVariety: json['defaultMulberryVariety'] as String? ?? 'V1',
    );

Map<String, dynamic> _$FarmProfileModelToJson(_FarmProfileModel instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'ownerName': instance.ownerName,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'gstNumber': instance.gstNumber,
      'farmArea': instance.farmArea,
      'numRearingHouses': instance.numRearingHouses,
      'defaultMulberryVariety': instance.defaultMulberryVariety,
    };

_AppPreferencesModel _$AppPreferencesModelFromJson(Map<String, dynamic> json) =>
    _AppPreferencesModel(
      themeMode: json['themeMode'] as String? ?? 'system',
      temperatureUnit: json['temperatureUnit'] as String? ?? 'celsius',
      weightUnit: json['weightUnit'] as String? ?? 'kg',
      areaUnit: json['areaUnit'] as String? ?? 'acres',
      currency: json['currency'] as String? ?? 'inr',
      enableNotifications: json['enableNotifications'] as bool? ?? true,
      autoBackupEnabled: json['autoBackupEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$AppPreferencesModelToJson(
        _AppPreferencesModel instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
      'temperatureUnit': instance.temperatureUnit,
      'weightUnit': instance.weightUnit,
      'areaUnit': instance.areaUnit,
      'currency': instance.currency,
      'enableNotifications': instance.enableNotifications,
      'autoBackupEnabled': instance.autoBackupEnabled,
    };
