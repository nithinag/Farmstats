// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FarmProfile {
  String get farmName;
  String get ownerName;
  String get address;
  String get phone;
  String get email;
  String get gstNumber;
  double get farmArea;
  int get numRearingHouses;
  String get defaultMulberryVariety;

  /// Create a copy of FarmProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FarmProfileCopyWith<FarmProfile> get copyWith =>
      _$FarmProfileCopyWithImpl<FarmProfile>(this as FarmProfile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FarmProfile &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.farmArea, farmArea) ||
                other.farmArea == farmArea) &&
            (identical(other.numRearingHouses, numRearingHouses) ||
                other.numRearingHouses == numRearingHouses) &&
            (identical(other.defaultMulberryVariety, defaultMulberryVariety) ||
                other.defaultMulberryVariety == defaultMulberryVariety));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmName,
      ownerName,
      address,
      phone,
      email,
      gstNumber,
      farmArea,
      numRearingHouses,
      defaultMulberryVariety);

  @override
  String toString() {
    return 'FarmProfile(farmName: $farmName, ownerName: $ownerName, address: $address, phone: $phone, email: $email, gstNumber: $gstNumber, farmArea: $farmArea, numRearingHouses: $numRearingHouses, defaultMulberryVariety: $defaultMulberryVariety)';
  }
}

/// @nodoc
abstract mixin class $FarmProfileCopyWith<$Res> {
  factory $FarmProfileCopyWith(
          FarmProfile value, $Res Function(FarmProfile) _then) =
      _$FarmProfileCopyWithImpl;
  @useResult
  $Res call(
      {String farmName,
      String ownerName,
      String address,
      String phone,
      String email,
      String gstNumber,
      double farmArea,
      int numRearingHouses,
      String defaultMulberryVariety});
}

/// @nodoc
class _$FarmProfileCopyWithImpl<$Res> implements $FarmProfileCopyWith<$Res> {
  _$FarmProfileCopyWithImpl(this._self, this._then);

  final FarmProfile _self;
  final $Res Function(FarmProfile) _then;

  /// Create a copy of FarmProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? ownerName = null,
    Object? address = null,
    Object? phone = null,
    Object? email = null,
    Object? gstNumber = null,
    Object? farmArea = null,
    Object? numRearingHouses = null,
    Object? defaultMulberryVariety = null,
  }) {
    return _then(_self.copyWith(
      farmName: null == farmName
          ? _self.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _self.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _self.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      farmArea: null == farmArea
          ? _self.farmArea
          : farmArea // ignore: cast_nullable_to_non_nullable
              as double,
      numRearingHouses: null == numRearingHouses
          ? _self.numRearingHouses
          : numRearingHouses // ignore: cast_nullable_to_non_nullable
              as int,
      defaultMulberryVariety: null == defaultMulberryVariety
          ? _self.defaultMulberryVariety
          : defaultMulberryVariety // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FarmProfile].
extension FarmProfilePatterns on FarmProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FarmProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FarmProfile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FarmProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FarmProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String farmName,
            String ownerName,
            String address,
            String phone,
            String email,
            String gstNumber,
            double farmArea,
            int numRearingHouses,
            String defaultMulberryVariety)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FarmProfile() when $default != null:
        return $default(
            _that.farmName,
            _that.ownerName,
            _that.address,
            _that.phone,
            _that.email,
            _that.gstNumber,
            _that.farmArea,
            _that.numRearingHouses,
            _that.defaultMulberryVariety);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String farmName,
            String ownerName,
            String address,
            String phone,
            String email,
            String gstNumber,
            double farmArea,
            int numRearingHouses,
            String defaultMulberryVariety)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfile():
        return $default(
            _that.farmName,
            _that.ownerName,
            _that.address,
            _that.phone,
            _that.email,
            _that.gstNumber,
            _that.farmArea,
            _that.numRearingHouses,
            _that.defaultMulberryVariety);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String farmName,
            String ownerName,
            String address,
            String phone,
            String email,
            String gstNumber,
            double farmArea,
            int numRearingHouses,
            String defaultMulberryVariety)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfile() when $default != null:
        return $default(
            _that.farmName,
            _that.ownerName,
            _that.address,
            _that.phone,
            _that.email,
            _that.gstNumber,
            _that.farmArea,
            _that.numRearingHouses,
            _that.defaultMulberryVariety);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FarmProfile implements FarmProfile {
  const _FarmProfile(
      {this.farmName = '',
      this.ownerName = '',
      this.address = '',
      this.phone = '',
      this.email = '',
      this.gstNumber = '',
      this.farmArea = 0.0,
      this.numRearingHouses = 0,
      this.defaultMulberryVariety = 'V1'});

  @override
  @JsonKey()
  final String farmName;
  @override
  @JsonKey()
  final String ownerName;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String gstNumber;
  @override
  @JsonKey()
  final double farmArea;
  @override
  @JsonKey()
  final int numRearingHouses;
  @override
  @JsonKey()
  final String defaultMulberryVariety;

  /// Create a copy of FarmProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FarmProfileCopyWith<_FarmProfile> get copyWith =>
      __$FarmProfileCopyWithImpl<_FarmProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FarmProfile &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.farmArea, farmArea) ||
                other.farmArea == farmArea) &&
            (identical(other.numRearingHouses, numRearingHouses) ||
                other.numRearingHouses == numRearingHouses) &&
            (identical(other.defaultMulberryVariety, defaultMulberryVariety) ||
                other.defaultMulberryVariety == defaultMulberryVariety));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmName,
      ownerName,
      address,
      phone,
      email,
      gstNumber,
      farmArea,
      numRearingHouses,
      defaultMulberryVariety);

  @override
  String toString() {
    return 'FarmProfile(farmName: $farmName, ownerName: $ownerName, address: $address, phone: $phone, email: $email, gstNumber: $gstNumber, farmArea: $farmArea, numRearingHouses: $numRearingHouses, defaultMulberryVariety: $defaultMulberryVariety)';
  }
}

/// @nodoc
abstract mixin class _$FarmProfileCopyWith<$Res>
    implements $FarmProfileCopyWith<$Res> {
  factory _$FarmProfileCopyWith(
          _FarmProfile value, $Res Function(_FarmProfile) _then) =
      __$FarmProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String farmName,
      String ownerName,
      String address,
      String phone,
      String email,
      String gstNumber,
      double farmArea,
      int numRearingHouses,
      String defaultMulberryVariety});
}

/// @nodoc
class __$FarmProfileCopyWithImpl<$Res> implements _$FarmProfileCopyWith<$Res> {
  __$FarmProfileCopyWithImpl(this._self, this._then);

  final _FarmProfile _self;
  final $Res Function(_FarmProfile) _then;

  /// Create a copy of FarmProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? farmName = null,
    Object? ownerName = null,
    Object? address = null,
    Object? phone = null,
    Object? email = null,
    Object? gstNumber = null,
    Object? farmArea = null,
    Object? numRearingHouses = null,
    Object? defaultMulberryVariety = null,
  }) {
    return _then(_FarmProfile(
      farmName: null == farmName
          ? _self.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _self.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _self.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      farmArea: null == farmArea
          ? _self.farmArea
          : farmArea // ignore: cast_nullable_to_non_nullable
              as double,
      numRearingHouses: null == numRearingHouses
          ? _self.numRearingHouses
          : numRearingHouses // ignore: cast_nullable_to_non_nullable
              as int,
      defaultMulberryVariety: null == defaultMulberryVariety
          ? _self.defaultMulberryVariety
          : defaultMulberryVariety // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AppPreferences {
  ThemeModePreference get themeMode;
  TemperatureUnit get temperatureUnit;
  WeightUnit get weightUnit;
  AreaUnit get areaUnit;
  CurrencyCode get currency;
  bool get enableNotifications;
  bool get autoBackupEnabled;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<AppPreferences> get copyWith =>
      _$AppPreferencesCopyWithImpl<AppPreferences>(
          this as AppPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppPreferences &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.enableNotifications, enableNotifications) ||
                other.enableNotifications == enableNotifications) &&
            (identical(other.autoBackupEnabled, autoBackupEnabled) ||
                other.autoBackupEnabled == autoBackupEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, temperatureUnit,
      weightUnit, areaUnit, currency, enableNotifications, autoBackupEnabled);

  @override
  String toString() {
    return 'AppPreferences(themeMode: $themeMode, temperatureUnit: $temperatureUnit, weightUnit: $weightUnit, areaUnit: $areaUnit, currency: $currency, enableNotifications: $enableNotifications, autoBackupEnabled: $autoBackupEnabled)';
  }
}

/// @nodoc
abstract mixin class $AppPreferencesCopyWith<$Res> {
  factory $AppPreferencesCopyWith(
          AppPreferences value, $Res Function(AppPreferences) _then) =
      _$AppPreferencesCopyWithImpl;
  @useResult
  $Res call(
      {ThemeModePreference themeMode,
      TemperatureUnit temperatureUnit,
      WeightUnit weightUnit,
      AreaUnit areaUnit,
      CurrencyCode currency,
      bool enableNotifications,
      bool autoBackupEnabled});
}

/// @nodoc
class _$AppPreferencesCopyWithImpl<$Res>
    implements $AppPreferencesCopyWith<$Res> {
  _$AppPreferencesCopyWithImpl(this._self, this._then);

  final AppPreferences _self;
  final $Res Function(AppPreferences) _then;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? temperatureUnit = null,
    Object? weightUnit = null,
    Object? areaUnit = null,
    Object? currency = null,
    Object? enableNotifications = null,
    Object? autoBackupEnabled = null,
  }) {
    return _then(_self.copyWith(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModePreference,
      temperatureUnit: null == temperatureUnit
          ? _self.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
      weightUnit: null == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as WeightUnit,
      areaUnit: null == areaUnit
          ? _self.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      enableNotifications: null == enableNotifications
          ? _self.enableNotifications
          : enableNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      autoBackupEnabled: null == autoBackupEnabled
          ? _self.autoBackupEnabled
          : autoBackupEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppPreferences].
extension AppPreferencesPatterns on AppPreferences {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppPreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppPreferences() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppPreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferences():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppPreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferences() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            ThemeModePreference themeMode,
            TemperatureUnit temperatureUnit,
            WeightUnit weightUnit,
            AreaUnit areaUnit,
            CurrencyCode currency,
            bool enableNotifications,
            bool autoBackupEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppPreferences() when $default != null:
        return $default(
            _that.themeMode,
            _that.temperatureUnit,
            _that.weightUnit,
            _that.areaUnit,
            _that.currency,
            _that.enableNotifications,
            _that.autoBackupEnabled);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            ThemeModePreference themeMode,
            TemperatureUnit temperatureUnit,
            WeightUnit weightUnit,
            AreaUnit areaUnit,
            CurrencyCode currency,
            bool enableNotifications,
            bool autoBackupEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferences():
        return $default(
            _that.themeMode,
            _that.temperatureUnit,
            _that.weightUnit,
            _that.areaUnit,
            _that.currency,
            _that.enableNotifications,
            _that.autoBackupEnabled);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            ThemeModePreference themeMode,
            TemperatureUnit temperatureUnit,
            WeightUnit weightUnit,
            AreaUnit areaUnit,
            CurrencyCode currency,
            bool enableNotifications,
            bool autoBackupEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferences() when $default != null:
        return $default(
            _that.themeMode,
            _that.temperatureUnit,
            _that.weightUnit,
            _that.areaUnit,
            _that.currency,
            _that.enableNotifications,
            _that.autoBackupEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppPreferences implements AppPreferences {
  const _AppPreferences(
      {this.themeMode = ThemeModePreference.system,
      this.temperatureUnit = TemperatureUnit.celsius,
      this.weightUnit = WeightUnit.kg,
      this.areaUnit = AreaUnit.acres,
      this.currency = CurrencyCode.inr,
      this.enableNotifications = true,
      this.autoBackupEnabled = true});

  @override
  @JsonKey()
  final ThemeModePreference themeMode;
  @override
  @JsonKey()
  final TemperatureUnit temperatureUnit;
  @override
  @JsonKey()
  final WeightUnit weightUnit;
  @override
  @JsonKey()
  final AreaUnit areaUnit;
  @override
  @JsonKey()
  final CurrencyCode currency;
  @override
  @JsonKey()
  final bool enableNotifications;
  @override
  @JsonKey()
  final bool autoBackupEnabled;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppPreferencesCopyWith<_AppPreferences> get copyWith =>
      __$AppPreferencesCopyWithImpl<_AppPreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppPreferences &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                other.temperatureUnit == temperatureUnit) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.enableNotifications, enableNotifications) ||
                other.enableNotifications == enableNotifications) &&
            (identical(other.autoBackupEnabled, autoBackupEnabled) ||
                other.autoBackupEnabled == autoBackupEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, temperatureUnit,
      weightUnit, areaUnit, currency, enableNotifications, autoBackupEnabled);

  @override
  String toString() {
    return 'AppPreferences(themeMode: $themeMode, temperatureUnit: $temperatureUnit, weightUnit: $weightUnit, areaUnit: $areaUnit, currency: $currency, enableNotifications: $enableNotifications, autoBackupEnabled: $autoBackupEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AppPreferencesCopyWith<$Res>
    implements $AppPreferencesCopyWith<$Res> {
  factory _$AppPreferencesCopyWith(
          _AppPreferences value, $Res Function(_AppPreferences) _then) =
      __$AppPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ThemeModePreference themeMode,
      TemperatureUnit temperatureUnit,
      WeightUnit weightUnit,
      AreaUnit areaUnit,
      CurrencyCode currency,
      bool enableNotifications,
      bool autoBackupEnabled});
}

/// @nodoc
class __$AppPreferencesCopyWithImpl<$Res>
    implements _$AppPreferencesCopyWith<$Res> {
  __$AppPreferencesCopyWithImpl(this._self, this._then);

  final _AppPreferences _self;
  final $Res Function(_AppPreferences) _then;

  /// Create a copy of AppPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
    Object? temperatureUnit = null,
    Object? weightUnit = null,
    Object? areaUnit = null,
    Object? currency = null,
    Object? enableNotifications = null,
    Object? autoBackupEnabled = null,
  }) {
    return _then(_AppPreferences(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModePreference,
      temperatureUnit: null == temperatureUnit
          ? _self.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as TemperatureUnit,
      weightUnit: null == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as WeightUnit,
      areaUnit: null == areaUnit
          ? _self.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as AreaUnit,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
      enableNotifications: null == enableNotifications
          ? _self.enableNotifications
          : enableNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      autoBackupEnabled: null == autoBackupEnabled
          ? _self.autoBackupEnabled
          : autoBackupEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
