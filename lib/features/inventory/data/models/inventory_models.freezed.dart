// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryCategoryModel {
  String get id;
  String get name;
  String get colorCode;
  String get iconName;

  /// Create a copy of InventoryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryCategoryModelCopyWith<InventoryCategoryModel> get copyWith =>
      _$InventoryCategoryModelCopyWithImpl<InventoryCategoryModel>(
          this as InventoryCategoryModel, _$identity);

  /// Serializes this InventoryCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorCode, iconName);

  @override
  String toString() {
    return 'InventoryCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $InventoryCategoryModelCopyWith<$Res> {
  factory $InventoryCategoryModelCopyWith(InventoryCategoryModel value,
          $Res Function(InventoryCategoryModel) _then) =
      _$InventoryCategoryModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class _$InventoryCategoryModelCopyWithImpl<$Res>
    implements $InventoryCategoryModelCopyWith<$Res> {
  _$InventoryCategoryModelCopyWithImpl(this._self, this._then);

  final InventoryCategoryModel _self;
  final $Res Function(InventoryCategoryModel) _then;

  /// Create a copy of InventoryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryCategoryModel].
extension InventoryCategoryModelPatterns on InventoryCategoryModel {
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
    TResult Function(_InventoryCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel() when $default != null:
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
    TResult Function(_InventoryCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel():
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
    TResult? Function(_InventoryCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel() when $default != null:
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
    TResult Function(String id, String name, String colorCode, String iconName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
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
    TResult Function(String id, String name, String colorCode, String iconName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel():
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
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
            String id, String name, String colorCode, String iconName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategoryModel() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryCategoryModel implements InventoryCategoryModel {
  const _InventoryCategoryModel(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});
  factory _InventoryCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryCategoryModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String colorCode;
  @override
  final String iconName;

  /// Create a copy of InventoryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryCategoryModelCopyWith<_InventoryCategoryModel> get copyWith =>
      __$InventoryCategoryModelCopyWithImpl<_InventoryCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryCategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorCode, iconName);

  @override
  String toString() {
    return 'InventoryCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$InventoryCategoryModelCopyWith<$Res>
    implements $InventoryCategoryModelCopyWith<$Res> {
  factory _$InventoryCategoryModelCopyWith(_InventoryCategoryModel value,
          $Res Function(_InventoryCategoryModel) _then) =
      __$InventoryCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class __$InventoryCategoryModelCopyWithImpl<$Res>
    implements _$InventoryCategoryModelCopyWith<$Res> {
  __$InventoryCategoryModelCopyWithImpl(this._self, this._then);

  final _InventoryCategoryModel _self;
  final $Res Function(_InventoryCategoryModel) _then;

  /// Create a copy of InventoryCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_InventoryCategoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InventoryItemModel {
  String get id;
  String get name;
  InventoryCategoryModel get category;
  String get unit;
  double get currentQuantity;
  double get minimumQuantity;
  double? get maximumQuantity;
  double get purchasePrice;
  String? get supplier;
  String get purchaseDate;
  String? get expiryDate;
  String? get storageLocation;
  String get status;
  String? get notes;

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryItemModelCopyWith<InventoryItemModel> get copyWith =>
      _$InventoryItemModelCopyWithImpl<InventoryItemModel>(
          this as InventoryItemModel, _$identity);

  /// Serializes this InventoryItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.currentQuantity, currentQuantity) ||
                other.currentQuantity == currentQuantity) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.storageLocation, storageLocation) ||
                other.storageLocation == storageLocation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      unit,
      currentQuantity,
      minimumQuantity,
      maximumQuantity,
      purchasePrice,
      supplier,
      purchaseDate,
      expiryDate,
      storageLocation,
      status,
      notes);

  @override
  String toString() {
    return 'InventoryItemModel(id: $id, name: $name, category: $category, unit: $unit, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, purchasePrice: $purchasePrice, supplier: $supplier, purchaseDate: $purchaseDate, expiryDate: $expiryDate, storageLocation: $storageLocation, status: $status, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InventoryItemModelCopyWith<$Res> {
  factory $InventoryItemModelCopyWith(
          InventoryItemModel value, $Res Function(InventoryItemModel) _then) =
      _$InventoryItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      InventoryCategoryModel category,
      String unit,
      double currentQuantity,
      double minimumQuantity,
      double? maximumQuantity,
      double purchasePrice,
      String? supplier,
      String purchaseDate,
      String? expiryDate,
      String? storageLocation,
      String status,
      String? notes});

  $InventoryCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$InventoryItemModelCopyWithImpl<$Res>
    implements $InventoryItemModelCopyWith<$Res> {
  _$InventoryItemModelCopyWithImpl(this._self, this._then);

  final InventoryItemModel _self;
  final $Res Function(InventoryItemModel) _then;

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? unit = null,
    Object? currentQuantity = null,
    Object? minimumQuantity = null,
    Object? maximumQuantity = freezed,
    Object? purchasePrice = null,
    Object? supplier = freezed,
    Object? purchaseDate = null,
    Object? expiryDate = freezed,
    Object? storageLocation = freezed,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as InventoryCategoryModel,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      currentQuantity: null == currentQuantity
          ? _self.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _self.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: freezed == maximumQuantity
          ? _self.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: null == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      storageLocation: freezed == storageLocation
          ? _self.storageLocation
          : storageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryCategoryModelCopyWith<$Res> get category {
    return $InventoryCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InventoryItemModel].
extension InventoryItemModelPatterns on InventoryItemModel {
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
    TResult Function(_InventoryItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel() when $default != null:
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
    TResult Function(_InventoryItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel():
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
    TResult? Function(_InventoryItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel() when $default != null:
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
            String id,
            String name,
            InventoryCategoryModel category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            String purchaseDate,
            String? expiryDate,
            String? storageLocation,
            String status,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.category,
            _that.unit,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.purchasePrice,
            _that.supplier,
            _that.purchaseDate,
            _that.expiryDate,
            _that.storageLocation,
            _that.status,
            _that.notes);
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
            String id,
            String name,
            InventoryCategoryModel category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            String purchaseDate,
            String? expiryDate,
            String? storageLocation,
            String status,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel():
        return $default(
            _that.id,
            _that.name,
            _that.category,
            _that.unit,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.purchasePrice,
            _that.supplier,
            _that.purchaseDate,
            _that.expiryDate,
            _that.storageLocation,
            _that.status,
            _that.notes);
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
            String id,
            String name,
            InventoryCategoryModel category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            String purchaseDate,
            String? expiryDate,
            String? storageLocation,
            String status,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItemModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.category,
            _that.unit,
            _that.currentQuantity,
            _that.minimumQuantity,
            _that.maximumQuantity,
            _that.purchasePrice,
            _that.supplier,
            _that.purchaseDate,
            _that.expiryDate,
            _that.storageLocation,
            _that.status,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryItemModel implements InventoryItemModel {
  const _InventoryItemModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.unit,
      required this.currentQuantity,
      required this.minimumQuantity,
      this.maximumQuantity,
      required this.purchasePrice,
      this.supplier,
      required this.purchaseDate,
      this.expiryDate,
      this.storageLocation,
      required this.status,
      this.notes});
  factory _InventoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final InventoryCategoryModel category;
  @override
  final String unit;
  @override
  final double currentQuantity;
  @override
  final double minimumQuantity;
  @override
  final double? maximumQuantity;
  @override
  final double purchasePrice;
  @override
  final String? supplier;
  @override
  final String purchaseDate;
  @override
  final String? expiryDate;
  @override
  final String? storageLocation;
  @override
  final String status;
  @override
  final String? notes;

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryItemModelCopyWith<_InventoryItemModel> get copyWith =>
      __$InventoryItemModelCopyWithImpl<_InventoryItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.currentQuantity, currentQuantity) ||
                other.currentQuantity == currentQuantity) &&
            (identical(other.minimumQuantity, minimumQuantity) ||
                other.minimumQuantity == minimumQuantity) &&
            (identical(other.maximumQuantity, maximumQuantity) ||
                other.maximumQuantity == maximumQuantity) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.storageLocation, storageLocation) ||
                other.storageLocation == storageLocation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      unit,
      currentQuantity,
      minimumQuantity,
      maximumQuantity,
      purchasePrice,
      supplier,
      purchaseDate,
      expiryDate,
      storageLocation,
      status,
      notes);

  @override
  String toString() {
    return 'InventoryItemModel(id: $id, name: $name, category: $category, unit: $unit, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, purchasePrice: $purchasePrice, supplier: $supplier, purchaseDate: $purchaseDate, expiryDate: $expiryDate, storageLocation: $storageLocation, status: $status, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InventoryItemModelCopyWith<$Res>
    implements $InventoryItemModelCopyWith<$Res> {
  factory _$InventoryItemModelCopyWith(
          _InventoryItemModel value, $Res Function(_InventoryItemModel) _then) =
      __$InventoryItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      InventoryCategoryModel category,
      String unit,
      double currentQuantity,
      double minimumQuantity,
      double? maximumQuantity,
      double purchasePrice,
      String? supplier,
      String purchaseDate,
      String? expiryDate,
      String? storageLocation,
      String status,
      String? notes});

  @override
  $InventoryCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$InventoryItemModelCopyWithImpl<$Res>
    implements _$InventoryItemModelCopyWith<$Res> {
  __$InventoryItemModelCopyWithImpl(this._self, this._then);

  final _InventoryItemModel _self;
  final $Res Function(_InventoryItemModel) _then;

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? unit = null,
    Object? currentQuantity = null,
    Object? minimumQuantity = null,
    Object? maximumQuantity = freezed,
    Object? purchasePrice = null,
    Object? supplier = freezed,
    Object? purchaseDate = null,
    Object? expiryDate = freezed,
    Object? storageLocation = freezed,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_InventoryItemModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as InventoryCategoryModel,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      currentQuantity: null == currentQuantity
          ? _self.currentQuantity
          : currentQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      minimumQuantity: null == minimumQuantity
          ? _self.minimumQuantity
          : minimumQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      maximumQuantity: freezed == maximumQuantity
          ? _self.maximumQuantity
          : maximumQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasePrice: null == purchasePrice
          ? _self.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      supplier: freezed == supplier
          ? _self.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: null == purchaseDate
          ? _self.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      storageLocation: freezed == storageLocation
          ? _self.storageLocation
          : storageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InventoryItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryCategoryModelCopyWith<$Res> get category {
    return $InventoryCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$InventoryTransactionModel {
  String get id;
  String get itemId;
  double get quantity;
  String get type;
  String? get batchId;
  String get date;
  String? get reason;

  /// Create a copy of InventoryTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryTransactionModelCopyWith<InventoryTransactionModel> get copyWith =>
      _$InventoryTransactionModelCopyWithImpl<InventoryTransactionModel>(
          this as InventoryTransactionModel, _$identity);

  /// Serializes this InventoryTransactionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryTransactionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, itemId, quantity, type, batchId, date, reason);

  @override
  String toString() {
    return 'InventoryTransactionModel(id: $id, itemId: $itemId, quantity: $quantity, type: $type, batchId: $batchId, date: $date, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $InventoryTransactionModelCopyWith<$Res> {
  factory $InventoryTransactionModelCopyWith(InventoryTransactionModel value,
          $Res Function(InventoryTransactionModel) _then) =
      _$InventoryTransactionModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String itemId,
      double quantity,
      String type,
      String? batchId,
      String date,
      String? reason});
}

/// @nodoc
class _$InventoryTransactionModelCopyWithImpl<$Res>
    implements $InventoryTransactionModelCopyWith<$Res> {
  _$InventoryTransactionModelCopyWithImpl(this._self, this._then);

  final InventoryTransactionModel _self;
  final $Res Function(InventoryTransactionModel) _then;

  /// Create a copy of InventoryTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? quantity = null,
    Object? type = null,
    Object? batchId = freezed,
    Object? date = null,
    Object? reason = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryTransactionModel].
extension InventoryTransactionModelPatterns on InventoryTransactionModel {
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
    TResult Function(_InventoryTransactionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel() when $default != null:
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
    TResult Function(_InventoryTransactionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel():
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
    TResult? Function(_InventoryTransactionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel() when $default != null:
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
    TResult Function(String id, String itemId, double quantity, String type,
            String? batchId, String date, String? reason)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel() when $default != null:
        return $default(_that.id, _that.itemId, _that.quantity, _that.type,
            _that.batchId, _that.date, _that.reason);
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
    TResult Function(String id, String itemId, double quantity, String type,
            String? batchId, String date, String? reason)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel():
        return $default(_that.id, _that.itemId, _that.quantity, _that.type,
            _that.batchId, _that.date, _that.reason);
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
    TResult? Function(String id, String itemId, double quantity, String type,
            String? batchId, String date, String? reason)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransactionModel() when $default != null:
        return $default(_that.id, _that.itemId, _that.quantity, _that.type,
            _that.batchId, _that.date, _that.reason);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InventoryTransactionModel implements InventoryTransactionModel {
  const _InventoryTransactionModel(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.type,
      this.batchId,
      required this.date,
      this.reason});
  factory _InventoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryTransactionModelFromJson(json);

  @override
  final String id;
  @override
  final String itemId;
  @override
  final double quantity;
  @override
  final String type;
  @override
  final String? batchId;
  @override
  final String date;
  @override
  final String? reason;

  /// Create a copy of InventoryTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryTransactionModelCopyWith<_InventoryTransactionModel>
      get copyWith =>
          __$InventoryTransactionModelCopyWithImpl<_InventoryTransactionModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InventoryTransactionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryTransactionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, itemId, quantity, type, batchId, date, reason);

  @override
  String toString() {
    return 'InventoryTransactionModel(id: $id, itemId: $itemId, quantity: $quantity, type: $type, batchId: $batchId, date: $date, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class _$InventoryTransactionModelCopyWith<$Res>
    implements $InventoryTransactionModelCopyWith<$Res> {
  factory _$InventoryTransactionModelCopyWith(_InventoryTransactionModel value,
          $Res Function(_InventoryTransactionModel) _then) =
      __$InventoryTransactionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      double quantity,
      String type,
      String? batchId,
      String date,
      String? reason});
}

/// @nodoc
class __$InventoryTransactionModelCopyWithImpl<$Res>
    implements _$InventoryTransactionModelCopyWith<$Res> {
  __$InventoryTransactionModelCopyWithImpl(this._self, this._then);

  final _InventoryTransactionModel _self;
  final $Res Function(_InventoryTransactionModel) _then;

  /// Create a copy of InventoryTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? quantity = null,
    Object? type = null,
    Object? batchId = freezed,
    Object? date = null,
    Object? reason = freezed,
  }) {
    return _then(_InventoryTransactionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
