// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FarmProfileModel {
  String get farmName;
  String get ownerName;
  String get address;
  String get phone;
  String get email;
  String get gstNumber;
  double get farmArea;
  int get numRearingHouses;
  String get defaultMulberryVariety;

  /// Create a copy of FarmProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FarmProfileModelCopyWith<FarmProfileModel> get copyWith =>
      _$FarmProfileModelCopyWithImpl<FarmProfileModel>(
          this as FarmProfileModel, _$identity);

  /// Serializes this FarmProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FarmProfileModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'FarmProfileModel(farmName: $farmName, ownerName: $ownerName, address: $address, phone: $phone, email: $email, gstNumber: $gstNumber, farmArea: $farmArea, numRearingHouses: $numRearingHouses, defaultMulberryVariety: $defaultMulberryVariety)';
  }
}

/// @nodoc
abstract mixin class $FarmProfileModelCopyWith<$Res> {
  factory $FarmProfileModelCopyWith(
          FarmProfileModel value, $Res Function(FarmProfileModel) _then) =
      _$FarmProfileModelCopyWithImpl;
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
class _$FarmProfileModelCopyWithImpl<$Res>
    implements $FarmProfileModelCopyWith<$Res> {
  _$FarmProfileModelCopyWithImpl(this._self, this._then);

  final FarmProfileModel _self;
  final $Res Function(FarmProfileModel) _then;

  /// Create a copy of FarmProfileModel
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

/// Adds pattern-matching-related methods to [FarmProfileModel].
extension FarmProfileModelPatterns on FarmProfileModel {
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
    TResult Function(_FarmProfileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FarmProfileModel() when $default != null:
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
    TResult Function(_FarmProfileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfileModel():
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
    TResult? Function(_FarmProfileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FarmProfileModel() when $default != null:
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
      case _FarmProfileModel() when $default != null:
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
      case _FarmProfileModel():
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
      case _FarmProfileModel() when $default != null:
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
@JsonSerializable()
class _FarmProfileModel implements FarmProfileModel {
  const _FarmProfileModel(
      {this.farmName = '',
      this.ownerName = '',
      this.address = '',
      this.phone = '',
      this.email = '',
      this.gstNumber = '',
      this.farmArea = 0.0,
      this.numRearingHouses = 0,
      this.defaultMulberryVariety = 'V1'});
  factory _FarmProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FarmProfileModelFromJson(json);

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

  /// Create a copy of FarmProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FarmProfileModelCopyWith<_FarmProfileModel> get copyWith =>
      __$FarmProfileModelCopyWithImpl<_FarmProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FarmProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FarmProfileModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'FarmProfileModel(farmName: $farmName, ownerName: $ownerName, address: $address, phone: $phone, email: $email, gstNumber: $gstNumber, farmArea: $farmArea, numRearingHouses: $numRearingHouses, defaultMulberryVariety: $defaultMulberryVariety)';
  }
}

/// @nodoc
abstract mixin class _$FarmProfileModelCopyWith<$Res>
    implements $FarmProfileModelCopyWith<$Res> {
  factory _$FarmProfileModelCopyWith(
          _FarmProfileModel value, $Res Function(_FarmProfileModel) _then) =
      __$FarmProfileModelCopyWithImpl;
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
class __$FarmProfileModelCopyWithImpl<$Res>
    implements _$FarmProfileModelCopyWith<$Res> {
  __$FarmProfileModelCopyWithImpl(this._self, this._then);

  final _FarmProfileModel _self;
  final $Res Function(_FarmProfileModel) _then;

  /// Create a copy of FarmProfileModel
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
    return _then(_FarmProfileModel(
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
mixin _$AppPreferencesModel {
  String get themeMode;
  String get temperatureUnit;
  String get weightUnit;
  String get areaUnit;
  String get currency;
  bool get enableNotifications;
  bool get autoBackupEnabled;

  /// Create a copy of AppPreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppPreferencesModelCopyWith<AppPreferencesModel> get copyWith =>
      _$AppPreferencesModelCopyWithImpl<AppPreferencesModel>(
          this as AppPreferencesModel, _$identity);

  /// Serializes this AppPreferencesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppPreferencesModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode, temperatureUnit,
      weightUnit, areaUnit, currency, enableNotifications, autoBackupEnabled);

  @override
  String toString() {
    return 'AppPreferencesModel(themeMode: $themeMode, temperatureUnit: $temperatureUnit, weightUnit: $weightUnit, areaUnit: $areaUnit, currency: $currency, enableNotifications: $enableNotifications, autoBackupEnabled: $autoBackupEnabled)';
  }
}

/// @nodoc
abstract mixin class $AppPreferencesModelCopyWith<$Res> {
  factory $AppPreferencesModelCopyWith(
          AppPreferencesModel value, $Res Function(AppPreferencesModel) _then) =
      _$AppPreferencesModelCopyWithImpl;
  @useResult
  $Res call(
      {String themeMode,
      String temperatureUnit,
      String weightUnit,
      String areaUnit,
      String currency,
      bool enableNotifications,
      bool autoBackupEnabled});
}

/// @nodoc
class _$AppPreferencesModelCopyWithImpl<$Res>
    implements $AppPreferencesModelCopyWith<$Res> {
  _$AppPreferencesModelCopyWithImpl(this._self, this._then);

  final AppPreferencesModel _self;
  final $Res Function(AppPreferencesModel) _then;

  /// Create a copy of AppPreferencesModel
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
              as String,
      temperatureUnit: null == temperatureUnit
          ? _self.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as String,
      weightUnit: null == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String,
      areaUnit: null == areaUnit
          ? _self.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [AppPreferencesModel].
extension AppPreferencesModelPatterns on AppPreferencesModel {
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
    TResult Function(_AppPreferencesModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel() when $default != null:
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
    TResult Function(_AppPreferencesModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel():
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
    TResult? Function(_AppPreferencesModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel() when $default != null:
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
            String themeMode,
            String temperatureUnit,
            String weightUnit,
            String areaUnit,
            String currency,
            bool enableNotifications,
            bool autoBackupEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel() when $default != null:
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
            String themeMode,
            String temperatureUnit,
            String weightUnit,
            String areaUnit,
            String currency,
            bool enableNotifications,
            bool autoBackupEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel():
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
            String themeMode,
            String temperatureUnit,
            String weightUnit,
            String areaUnit,
            String currency,
            bool enableNotifications,
            bool autoBackupEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppPreferencesModel() when $default != null:
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
@JsonSerializable()
class _AppPreferencesModel implements AppPreferencesModel {
  const _AppPreferencesModel(
      {this.themeMode = 'system',
      this.temperatureUnit = 'celsius',
      this.weightUnit = 'kg',
      this.areaUnit = 'acres',
      this.currency = 'inr',
      this.enableNotifications = true,
      this.autoBackupEnabled = true});
  factory _AppPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$AppPreferencesModelFromJson(json);

  @override
  @JsonKey()
  final String themeMode;
  @override
  @JsonKey()
  final String temperatureUnit;
  @override
  @JsonKey()
  final String weightUnit;
  @override
  @JsonKey()
  final String areaUnit;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final bool enableNotifications;
  @override
  @JsonKey()
  final bool autoBackupEnabled;

  /// Create a copy of AppPreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppPreferencesModelCopyWith<_AppPreferencesModel> get copyWith =>
      __$AppPreferencesModelCopyWithImpl<_AppPreferencesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppPreferencesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppPreferencesModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode, temperatureUnit,
      weightUnit, areaUnit, currency, enableNotifications, autoBackupEnabled);

  @override
  String toString() {
    return 'AppPreferencesModel(themeMode: $themeMode, temperatureUnit: $temperatureUnit, weightUnit: $weightUnit, areaUnit: $areaUnit, currency: $currency, enableNotifications: $enableNotifications, autoBackupEnabled: $autoBackupEnabled)';
  }
}

/// @nodoc
abstract mixin class _$AppPreferencesModelCopyWith<$Res>
    implements $AppPreferencesModelCopyWith<$Res> {
  factory _$AppPreferencesModelCopyWith(_AppPreferencesModel value,
          $Res Function(_AppPreferencesModel) _then) =
      __$AppPreferencesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String themeMode,
      String temperatureUnit,
      String weightUnit,
      String areaUnit,
      String currency,
      bool enableNotifications,
      bool autoBackupEnabled});
}

/// @nodoc
class __$AppPreferencesModelCopyWithImpl<$Res>
    implements _$AppPreferencesModelCopyWith<$Res> {
  __$AppPreferencesModelCopyWithImpl(this._self, this._then);

  final _AppPreferencesModel _self;
  final $Res Function(_AppPreferencesModel) _then;

  /// Create a copy of AppPreferencesModel
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
    return _then(_AppPreferencesModel(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      temperatureUnit: null == temperatureUnit
          ? _self.temperatureUnit
          : temperatureUnit // ignore: cast_nullable_to_non_nullable
              as String,
      weightUnit: null == weightUnit
          ? _self.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as String,
      areaUnit: null == areaUnit
          ? _self.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
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
