// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryCategory {
  String get id;
  String get name;
  String get colorCode;
  String get iconName;

  /// Create a copy of InventoryCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryCategoryCopyWith<InventoryCategory> get copyWith =>
      _$InventoryCategoryCopyWithImpl<InventoryCategory>(
          this as InventoryCategory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorCode, iconName);

  @override
  String toString() {
    return 'InventoryCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $InventoryCategoryCopyWith<$Res> {
  factory $InventoryCategoryCopyWith(
          InventoryCategory value, $Res Function(InventoryCategory) _then) =
      _$InventoryCategoryCopyWithImpl;
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class _$InventoryCategoryCopyWithImpl<$Res>
    implements $InventoryCategoryCopyWith<$Res> {
  _$InventoryCategoryCopyWithImpl(this._self, this._then);

  final InventoryCategory _self;
  final $Res Function(InventoryCategory) _then;

  /// Create a copy of InventoryCategory
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

/// Adds pattern-matching-related methods to [InventoryCategory].
extension InventoryCategoryPatterns on InventoryCategory {
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
    TResult Function(_InventoryCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryCategory() when $default != null:
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
    TResult Function(_InventoryCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategory():
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
    TResult? Function(_InventoryCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryCategory() when $default != null:
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
      case _InventoryCategory() when $default != null:
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
      case _InventoryCategory():
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
      case _InventoryCategory() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InventoryCategory implements InventoryCategory {
  const _InventoryCategory(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});

  @override
  final String id;
  @override
  final String name;
  @override
  final String colorCode;
  @override
  final String iconName;

  /// Create a copy of InventoryCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryCategoryCopyWith<_InventoryCategory> get copyWith =>
      __$InventoryCategoryCopyWithImpl<_InventoryCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorCode, iconName);

  @override
  String toString() {
    return 'InventoryCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$InventoryCategoryCopyWith<$Res>
    implements $InventoryCategoryCopyWith<$Res> {
  factory _$InventoryCategoryCopyWith(
          _InventoryCategory value, $Res Function(_InventoryCategory) _then) =
      __$InventoryCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class __$InventoryCategoryCopyWithImpl<$Res>
    implements _$InventoryCategoryCopyWith<$Res> {
  __$InventoryCategoryCopyWithImpl(this._self, this._then);

  final _InventoryCategory _self;
  final $Res Function(_InventoryCategory) _then;

  /// Create a copy of InventoryCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_InventoryCategory(
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
mixin _$InventoryItem {
  String get id;
  String get name;
  InventoryCategory get category;
  String get unit;
  double get currentQuantity;
  double get minimumQuantity;
  double? get maximumQuantity;
  double get purchasePrice;
  String? get supplier;
  DateTime get purchaseDate;
  DateTime? get expiryDate;
  String? get storageLocation;
  InventoryStatus get status;
  String? get notes;

  /// Create a copy of InventoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryItemCopyWith<InventoryItem> get copyWith =>
      _$InventoryItemCopyWithImpl<InventoryItem>(
          this as InventoryItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryItem &&
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
    return 'InventoryItem(id: $id, name: $name, category: $category, unit: $unit, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, purchasePrice: $purchasePrice, supplier: $supplier, purchaseDate: $purchaseDate, expiryDate: $expiryDate, storageLocation: $storageLocation, status: $status, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $InventoryItemCopyWith<$Res> {
  factory $InventoryItemCopyWith(
          InventoryItem value, $Res Function(InventoryItem) _then) =
      _$InventoryItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      InventoryCategory category,
      String unit,
      double currentQuantity,
      double minimumQuantity,
      double? maximumQuantity,
      double purchasePrice,
      String? supplier,
      DateTime purchaseDate,
      DateTime? expiryDate,
      String? storageLocation,
      InventoryStatus status,
      String? notes});

  $InventoryCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$InventoryItemCopyWithImpl<$Res>
    implements $InventoryItemCopyWith<$Res> {
  _$InventoryItemCopyWithImpl(this._self, this._then);

  final InventoryItem _self;
  final $Res Function(InventoryItem) _then;

  /// Create a copy of InventoryItem
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
              as InventoryCategory,
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
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageLocation: freezed == storageLocation
          ? _self.storageLocation
          : storageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryStatus,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InventoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryCategoryCopyWith<$Res> get category {
    return $InventoryCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InventoryItem].
extension InventoryItemPatterns on InventoryItem {
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
    TResult Function(_InventoryItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryItem() when $default != null:
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
    TResult Function(_InventoryItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItem():
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
    TResult? Function(_InventoryItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItem() when $default != null:
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
            InventoryCategory category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            DateTime purchaseDate,
            DateTime? expiryDate,
            String? storageLocation,
            InventoryStatus status,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryItem() when $default != null:
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
            InventoryCategory category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            DateTime purchaseDate,
            DateTime? expiryDate,
            String? storageLocation,
            InventoryStatus status,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItem():
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
            InventoryCategory category,
            String unit,
            double currentQuantity,
            double minimumQuantity,
            double? maximumQuantity,
            double purchasePrice,
            String? supplier,
            DateTime purchaseDate,
            DateTime? expiryDate,
            String? storageLocation,
            InventoryStatus status,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryItem() when $default != null:
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

class _InventoryItem implements InventoryItem {
  const _InventoryItem(
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

  @override
  final String id;
  @override
  final String name;
  @override
  final InventoryCategory category;
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
  final DateTime purchaseDate;
  @override
  final DateTime? expiryDate;
  @override
  final String? storageLocation;
  @override
  final InventoryStatus status;
  @override
  final String? notes;

  /// Create a copy of InventoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryItemCopyWith<_InventoryItem> get copyWith =>
      __$InventoryItemCopyWithImpl<_InventoryItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryItem &&
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
    return 'InventoryItem(id: $id, name: $name, category: $category, unit: $unit, currentQuantity: $currentQuantity, minimumQuantity: $minimumQuantity, maximumQuantity: $maximumQuantity, purchasePrice: $purchasePrice, supplier: $supplier, purchaseDate: $purchaseDate, expiryDate: $expiryDate, storageLocation: $storageLocation, status: $status, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$InventoryItemCopyWith<$Res>
    implements $InventoryItemCopyWith<$Res> {
  factory _$InventoryItemCopyWith(
          _InventoryItem value, $Res Function(_InventoryItem) _then) =
      __$InventoryItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      InventoryCategory category,
      String unit,
      double currentQuantity,
      double minimumQuantity,
      double? maximumQuantity,
      double purchasePrice,
      String? supplier,
      DateTime purchaseDate,
      DateTime? expiryDate,
      String? storageLocation,
      InventoryStatus status,
      String? notes});

  @override
  $InventoryCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$InventoryItemCopyWithImpl<$Res>
    implements _$InventoryItemCopyWith<$Res> {
  __$InventoryItemCopyWithImpl(this._self, this._then);

  final _InventoryItem _self;
  final $Res Function(_InventoryItem) _then;

  /// Create a copy of InventoryItem
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
    return _then(_InventoryItem(
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
              as InventoryCategory,
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
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageLocation: freezed == storageLocation
          ? _self.storageLocation
          : storageLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryStatus,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InventoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryCategoryCopyWith<$Res> get category {
    return $InventoryCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$InventoryTransaction {
  String get id;
  String get itemId;
  double get quantity;
  TransactionType get type;
  String? get batchId;
  DateTime get date;
  String? get reason;

  /// Create a copy of InventoryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryTransactionCopyWith<InventoryTransaction> get copyWith =>
      _$InventoryTransactionCopyWithImpl<InventoryTransaction>(
          this as InventoryTransaction, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, itemId, quantity, type, batchId, date, reason);

  @override
  String toString() {
    return 'InventoryTransaction(id: $id, itemId: $itemId, quantity: $quantity, type: $type, batchId: $batchId, date: $date, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $InventoryTransactionCopyWith<$Res> {
  factory $InventoryTransactionCopyWith(InventoryTransaction value,
          $Res Function(InventoryTransaction) _then) =
      _$InventoryTransactionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String itemId,
      double quantity,
      TransactionType type,
      String? batchId,
      DateTime date,
      String? reason});
}

/// @nodoc
class _$InventoryTransactionCopyWithImpl<$Res>
    implements $InventoryTransactionCopyWith<$Res> {
  _$InventoryTransactionCopyWithImpl(this._self, this._then);

  final InventoryTransaction _self;
  final $Res Function(InventoryTransaction) _then;

  /// Create a copy of InventoryTransaction
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
              as TransactionType,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryTransaction].
extension InventoryTransactionPatterns on InventoryTransaction {
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
    TResult Function(_InventoryTransaction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction() when $default != null:
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
    TResult Function(_InventoryTransaction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction():
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
    TResult? Function(_InventoryTransaction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction() when $default != null:
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
            String itemId,
            double quantity,
            TransactionType type,
            String? batchId,
            DateTime date,
            String? reason)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction() when $default != null:
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
    TResult Function(
            String id,
            String itemId,
            double quantity,
            TransactionType type,
            String? batchId,
            DateTime date,
            String? reason)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction():
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
    TResult? Function(
            String id,
            String itemId,
            double quantity,
            TransactionType type,
            String? batchId,
            DateTime date,
            String? reason)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryTransaction() when $default != null:
        return $default(_that.id, _that.itemId, _that.quantity, _that.type,
            _that.batchId, _that.date, _that.reason);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InventoryTransaction implements InventoryTransaction {
  const _InventoryTransaction(
      {required this.id,
      required this.itemId,
      required this.quantity,
      required this.type,
      this.batchId,
      required this.date,
      this.reason});

  @override
  final String id;
  @override
  final String itemId;
  @override
  final double quantity;
  @override
  final TransactionType type;
  @override
  final String? batchId;
  @override
  final DateTime date;
  @override
  final String? reason;

  /// Create a copy of InventoryTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryTransactionCopyWith<_InventoryTransaction> get copyWith =>
      __$InventoryTransactionCopyWithImpl<_InventoryTransaction>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, itemId, quantity, type, batchId, date, reason);

  @override
  String toString() {
    return 'InventoryTransaction(id: $id, itemId: $itemId, quantity: $quantity, type: $type, batchId: $batchId, date: $date, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class _$InventoryTransactionCopyWith<$Res>
    implements $InventoryTransactionCopyWith<$Res> {
  factory _$InventoryTransactionCopyWith(_InventoryTransaction value,
          $Res Function(_InventoryTransaction) _then) =
      __$InventoryTransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      double quantity,
      TransactionType type,
      String? batchId,
      DateTime date,
      String? reason});
}

/// @nodoc
class __$InventoryTransactionCopyWithImpl<$Res>
    implements _$InventoryTransactionCopyWith<$Res> {
  __$InventoryTransactionCopyWithImpl(this._self, this._then);

  final _InventoryTransaction _self;
  final $Res Function(_InventoryTransaction) _then;

  /// Create a copy of InventoryTransaction
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
    return _then(_InventoryTransaction(
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
              as TransactionType,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$InventoryFilter {
  String? get categoryId;
  InventoryStatus? get status;
  bool? get lowStockOnly;
  bool? get expiringSoonOnly;

  /// Create a copy of InventoryFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryFilterCopyWith<InventoryFilter> get copyWith =>
      _$InventoryFilterCopyWithImpl<InventoryFilter>(
          this as InventoryFilter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryFilter &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.expiringSoonOnly, expiringSoonOnly) ||
                other.expiringSoonOnly == expiringSoonOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, status, lowStockOnly, expiringSoonOnly);

  @override
  String toString() {
    return 'InventoryFilter(categoryId: $categoryId, status: $status, lowStockOnly: $lowStockOnly, expiringSoonOnly: $expiringSoonOnly)';
  }
}

/// @nodoc
abstract mixin class $InventoryFilterCopyWith<$Res> {
  factory $InventoryFilterCopyWith(
          InventoryFilter value, $Res Function(InventoryFilter) _then) =
      _$InventoryFilterCopyWithImpl;
  @useResult
  $Res call(
      {String? categoryId,
      InventoryStatus? status,
      bool? lowStockOnly,
      bool? expiringSoonOnly});
}

/// @nodoc
class _$InventoryFilterCopyWithImpl<$Res>
    implements $InventoryFilterCopyWith<$Res> {
  _$InventoryFilterCopyWithImpl(this._self, this._then);

  final InventoryFilter _self;
  final $Res Function(InventoryFilter) _then;

  /// Create a copy of InventoryFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? lowStockOnly = freezed,
    Object? expiringSoonOnly = freezed,
  }) {
    return _then(_self.copyWith(
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryStatus?,
      lowStockOnly: freezed == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiringSoonOnly: freezed == expiringSoonOnly
          ? _self.expiringSoonOnly
          : expiringSoonOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InventoryFilter].
extension InventoryFilterPatterns on InventoryFilter {
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
    TResult Function(_InventoryFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter() when $default != null:
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
    TResult Function(_InventoryFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter():
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
    TResult? Function(_InventoryFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter() when $default != null:
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
    TResult Function(String? categoryId, InventoryStatus? status,
            bool? lowStockOnly, bool? expiringSoonOnly)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter() when $default != null:
        return $default(_that.categoryId, _that.status, _that.lowStockOnly,
            _that.expiringSoonOnly);
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
    TResult Function(String? categoryId, InventoryStatus? status,
            bool? lowStockOnly, bool? expiringSoonOnly)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter():
        return $default(_that.categoryId, _that.status, _that.lowStockOnly,
            _that.expiringSoonOnly);
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
    TResult? Function(String? categoryId, InventoryStatus? status,
            bool? lowStockOnly, bool? expiringSoonOnly)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InventoryFilter() when $default != null:
        return $default(_that.categoryId, _that.status, _that.lowStockOnly,
            _that.expiringSoonOnly);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InventoryFilter implements InventoryFilter {
  const _InventoryFilter(
      {this.categoryId, this.status, this.lowStockOnly, this.expiringSoonOnly});

  @override
  final String? categoryId;
  @override
  final InventoryStatus? status;
  @override
  final bool? lowStockOnly;
  @override
  final bool? expiringSoonOnly;

  /// Create a copy of InventoryFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InventoryFilterCopyWith<_InventoryFilter> get copyWith =>
      __$InventoryFilterCopyWithImpl<_InventoryFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InventoryFilter &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lowStockOnly, lowStockOnly) ||
                other.lowStockOnly == lowStockOnly) &&
            (identical(other.expiringSoonOnly, expiringSoonOnly) ||
                other.expiringSoonOnly == expiringSoonOnly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, status, lowStockOnly, expiringSoonOnly);

  @override
  String toString() {
    return 'InventoryFilter(categoryId: $categoryId, status: $status, lowStockOnly: $lowStockOnly, expiringSoonOnly: $expiringSoonOnly)';
  }
}

/// @nodoc
abstract mixin class _$InventoryFilterCopyWith<$Res>
    implements $InventoryFilterCopyWith<$Res> {
  factory _$InventoryFilterCopyWith(
          _InventoryFilter value, $Res Function(_InventoryFilter) _then) =
      __$InventoryFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? categoryId,
      InventoryStatus? status,
      bool? lowStockOnly,
      bool? expiringSoonOnly});
}

/// @nodoc
class __$InventoryFilterCopyWithImpl<$Res>
    implements _$InventoryFilterCopyWith<$Res> {
  __$InventoryFilterCopyWithImpl(this._self, this._then);

  final _InventoryFilter _self;
  final $Res Function(_InventoryFilter) _then;

  /// Create a copy of InventoryFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = freezed,
    Object? status = freezed,
    Object? lowStockOnly = freezed,
    Object? expiringSoonOnly = freezed,
  }) {
    return _then(_InventoryFilter(
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as InventoryStatus?,
      lowStockOnly: freezed == lowStockOnly
          ? _self.lowStockOnly
          : lowStockOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      expiringSoonOnly: freezed == expiringSoonOnly
          ? _self.expiringSoonOnly
          : expiringSoonOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
