// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseModel {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'amount')
  double get amount;
  @JsonKey(name: 'quantity')
  double? get quantity;
  @JsonKey(name: 'date')
  String get date;
  @JsonKey(name: 'category')
  ExpenseCategoryModel get category;
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @JsonKey(name: 'description')
  String get description;
  @JsonKey(name: 'batch_id')
  String? get batchId;
  @JsonKey(name: 'receipt_url')
  String? get receiptUrl;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      _$ExpenseModelCopyWithImpl<ExpenseModel>(
          this as ExpenseModel, _$identity);

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, quantity, date,
      category, paymentMethod, description, batchId, receiptUrl);

  @override
  String toString() {
    return 'ExpenseModel(id: $id, amount: $amount, quantity: $quantity, date: $date, category: $category, paymentMethod: $paymentMethod, description: $description, batchId: $batchId, receiptUrl: $receiptUrl)';
  }
}

/// @nodoc
abstract mixin class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) _then) =
      _$ExpenseModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'quantity') double? quantity,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'category') ExpenseCategoryModel category,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'batch_id') String? batchId,
      @JsonKey(name: 'receipt_url') String? receiptUrl});

  $ExpenseCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res> implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._self, this._then);

  final ExpenseModel _self;
  final $Res Function(ExpenseModel) _then;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? quantity = freezed,
    Object? date = null,
    Object? category = null,
    Object? paymentMethod = null,
    Object? description = null,
    Object? batchId = freezed,
    Object? receiptUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategoryModel,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryModelCopyWith<$Res> get category {
    return $ExpenseCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ExpenseModel].
extension ExpenseModelPatterns on ExpenseModel {
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
    TResult Function(_ExpenseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel() when $default != null:
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
    TResult Function(_ExpenseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel():
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
    TResult? Function(_ExpenseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'amount') double amount,
            @JsonKey(name: 'quantity') double? quantity,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'category') ExpenseCategoryModel category,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'batch_id') String? batchId,
            @JsonKey(name: 'receipt_url') String? receiptUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel() when $default != null:
        return $default(
            _that.id,
            _that.amount,
            _that.quantity,
            _that.date,
            _that.category,
            _that.paymentMethod,
            _that.description,
            _that.batchId,
            _that.receiptUrl);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'amount') double amount,
            @JsonKey(name: 'quantity') double? quantity,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'category') ExpenseCategoryModel category,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'batch_id') String? batchId,
            @JsonKey(name: 'receipt_url') String? receiptUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel():
        return $default(
            _that.id,
            _that.amount,
            _that.quantity,
            _that.date,
            _that.category,
            _that.paymentMethod,
            _that.description,
            _that.batchId,
            _that.receiptUrl);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'amount') double amount,
            @JsonKey(name: 'quantity') double? quantity,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'category') ExpenseCategoryModel category,
            @JsonKey(name: 'payment_method') String paymentMethod,
            @JsonKey(name: 'description') String description,
            @JsonKey(name: 'batch_id') String? batchId,
            @JsonKey(name: 'receipt_url') String? receiptUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseModel() when $default != null:
        return $default(
            _that.id,
            _that.amount,
            _that.quantity,
            _that.date,
            _that.category,
            _that.paymentMethod,
            _that.description,
            _that.batchId,
            _that.receiptUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExpenseModel implements ExpenseModel {
  const _ExpenseModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'batch_id') this.batchId,
      @JsonKey(name: 'receipt_url') this.receiptUrl});
  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'amount')
  final double amount;
  @override
  @JsonKey(name: 'quantity')
  final double? quantity;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'category')
  final ExpenseCategoryModel category;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'batch_id')
  final String? batchId;
  @override
  @JsonKey(name: 'receipt_url')
  final String? receiptUrl;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseModelCopyWith<_ExpenseModel> get copyWith =>
      __$ExpenseModelCopyWithImpl<_ExpenseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExpenseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, quantity, date,
      category, paymentMethod, description, batchId, receiptUrl);

  @override
  String toString() {
    return 'ExpenseModel(id: $id, amount: $amount, quantity: $quantity, date: $date, category: $category, paymentMethod: $paymentMethod, description: $description, batchId: $batchId, receiptUrl: $receiptUrl)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseModelCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$ExpenseModelCopyWith(
          _ExpenseModel value, $Res Function(_ExpenseModel) _then) =
      __$ExpenseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'quantity') double? quantity,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'category') ExpenseCategoryModel category,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'batch_id') String? batchId,
      @JsonKey(name: 'receipt_url') String? receiptUrl});

  @override
  $ExpenseCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$ExpenseModelCopyWithImpl<$Res>
    implements _$ExpenseModelCopyWith<$Res> {
  __$ExpenseModelCopyWithImpl(this._self, this._then);

  final _ExpenseModel _self;
  final $Res Function(_ExpenseModel) _then;

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? quantity = freezed,
    Object? date = null,
    Object? category = null,
    Object? paymentMethod = null,
    Object? description = null,
    Object? batchId = freezed,
    Object? receiptUrl = freezed,
  }) {
    return _then(_ExpenseModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategoryModel,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptUrl: freezed == receiptUrl
          ? _self.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryModelCopyWith<$Res> get category {
    return $ExpenseCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$ExpenseCategoryModel {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'color_code')
  String get colorCode;
  @JsonKey(name: 'icon_name')
  String get iconName;

  /// Create a copy of ExpenseCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseCategoryModelCopyWith<ExpenseCategoryModel> get copyWith =>
      _$ExpenseCategoryModelCopyWithImpl<ExpenseCategoryModel>(
          this as ExpenseCategoryModel, _$identity);

  /// Serializes this ExpenseCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseCategoryModel &&
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
    return 'ExpenseCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $ExpenseCategoryModelCopyWith<$Res> {
  factory $ExpenseCategoryModelCopyWith(ExpenseCategoryModel value,
          $Res Function(ExpenseCategoryModel) _then) =
      _$ExpenseCategoryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'color_code') String colorCode,
      @JsonKey(name: 'icon_name') String iconName});
}

/// @nodoc
class _$ExpenseCategoryModelCopyWithImpl<$Res>
    implements $ExpenseCategoryModelCopyWith<$Res> {
  _$ExpenseCategoryModelCopyWithImpl(this._self, this._then);

  final ExpenseCategoryModel _self;
  final $Res Function(ExpenseCategoryModel) _then;

  /// Create a copy of ExpenseCategoryModel
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

/// Adds pattern-matching-related methods to [ExpenseCategoryModel].
extension ExpenseCategoryModelPatterns on ExpenseCategoryModel {
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
    TResult Function(_ExpenseCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel() when $default != null:
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
    TResult Function(_ExpenseCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel():
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
    TResult? Function(_ExpenseCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'color_code') String colorCode,
            @JsonKey(name: 'icon_name') String iconName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'color_code') String colorCode,
            @JsonKey(name: 'icon_name') String iconName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel():
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'color_code') String colorCode,
            @JsonKey(name: 'icon_name') String iconName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategoryModel() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExpenseCategoryModel implements ExpenseCategoryModel {
  const _ExpenseCategoryModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'color_code') required this.colorCode,
      @JsonKey(name: 'icon_name') required this.iconName});
  factory _ExpenseCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'color_code')
  final String colorCode;
  @override
  @JsonKey(name: 'icon_name')
  final String iconName;

  /// Create a copy of ExpenseCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseCategoryModelCopyWith<_ExpenseCategoryModel> get copyWith =>
      __$ExpenseCategoryModelCopyWithImpl<_ExpenseCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExpenseCategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseCategoryModel &&
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
    return 'ExpenseCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseCategoryModelCopyWith<$Res>
    implements $ExpenseCategoryModelCopyWith<$Res> {
  factory _$ExpenseCategoryModelCopyWith(_ExpenseCategoryModel value,
          $Res Function(_ExpenseCategoryModel) _then) =
      __$ExpenseCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'color_code') String colorCode,
      @JsonKey(name: 'icon_name') String iconName});
}

/// @nodoc
class __$ExpenseCategoryModelCopyWithImpl<$Res>
    implements _$ExpenseCategoryModelCopyWith<$Res> {
  __$ExpenseCategoryModelCopyWithImpl(this._self, this._then);

  final _ExpenseCategoryModel _self;
  final $Res Function(_ExpenseCategoryModel) _then;

  /// Create a copy of ExpenseCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_ExpenseCategoryModel(
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
mixin _$ExpenseSummaryModel {
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @JsonKey(name: 'count')
  int get count;
  @JsonKey(name: 'start_date')
  String get startDate;
  @JsonKey(name: 'end_date')
  String get endDate;
  @JsonKey(name: 'amount_by_category')
  Map<String, double> get amountByCategory;

  /// Create a copy of ExpenseSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseSummaryModelCopyWith<ExpenseSummaryModel> get copyWith =>
      _$ExpenseSummaryModelCopyWithImpl<ExpenseSummaryModel>(
          this as ExpenseSummaryModel, _$identity);

  /// Serializes this ExpenseSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseSummaryModel &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other.amountByCategory, amountByCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalAmount, count, startDate,
      endDate, const DeepCollectionEquality().hash(amountByCategory));

  @override
  String toString() {
    return 'ExpenseSummaryModel(totalAmount: $totalAmount, count: $count, startDate: $startDate, endDate: $endDate, amountByCategory: $amountByCategory)';
  }
}

/// @nodoc
abstract mixin class $ExpenseSummaryModelCopyWith<$Res> {
  factory $ExpenseSummaryModelCopyWith(
          ExpenseSummaryModel value, $Res Function(ExpenseSummaryModel) _then) =
      _$ExpenseSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'amount_by_category')
      Map<String, double> amountByCategory});
}

/// @nodoc
class _$ExpenseSummaryModelCopyWithImpl<$Res>
    implements $ExpenseSummaryModelCopyWith<$Res> {
  _$ExpenseSummaryModelCopyWithImpl(this._self, this._then);

  final ExpenseSummaryModel _self;
  final $Res Function(ExpenseSummaryModel) _then;

  /// Create a copy of ExpenseSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? count = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? amountByCategory = null,
  }) {
    return _then(_self.copyWith(
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      amountByCategory: null == amountByCategory
          ? _self.amountByCategory
          : amountByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseSummaryModel].
extension ExpenseSummaryModelPatterns on ExpenseSummaryModel {
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
    TResult Function(_ExpenseSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel() when $default != null:
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
    TResult Function(_ExpenseSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel():
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
    TResult? Function(_ExpenseSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel() when $default != null:
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
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'count') int count,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'amount_by_category')
            Map<String, double> amountByCategory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel() when $default != null:
        return $default(_that.totalAmount, _that.count, _that.startDate,
            _that.endDate, _that.amountByCategory);
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
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'count') int count,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'amount_by_category')
            Map<String, double> amountByCategory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel():
        return $default(_that.totalAmount, _that.count, _that.startDate,
            _that.endDate, _that.amountByCategory);
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
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'count') int count,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            @JsonKey(name: 'amount_by_category')
            Map<String, double> amountByCategory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummaryModel() when $default != null:
        return $default(_that.totalAmount, _that.count, _that.startDate,
            _that.endDate, _that.amountByCategory);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExpenseSummaryModel implements ExpenseSummaryModel {
  const _ExpenseSummaryModel(
      {@JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'amount_by_category')
      required final Map<String, double> amountByCategory})
      : _amountByCategory = amountByCategory;
  factory _ExpenseSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseSummaryModelFromJson(json);

  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  final Map<String, double> _amountByCategory;
  @override
  @JsonKey(name: 'amount_by_category')
  Map<String, double> get amountByCategory {
    if (_amountByCategory is EqualUnmodifiableMapView) return _amountByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_amountByCategory);
  }

  /// Create a copy of ExpenseSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseSummaryModelCopyWith<_ExpenseSummaryModel> get copyWith =>
      __$ExpenseSummaryModelCopyWithImpl<_ExpenseSummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExpenseSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseSummaryModel &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._amountByCategory, _amountByCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalAmount, count, startDate,
      endDate, const DeepCollectionEquality().hash(_amountByCategory));

  @override
  String toString() {
    return 'ExpenseSummaryModel(totalAmount: $totalAmount, count: $count, startDate: $startDate, endDate: $endDate, amountByCategory: $amountByCategory)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseSummaryModelCopyWith<$Res>
    implements $ExpenseSummaryModelCopyWith<$Res> {
  factory _$ExpenseSummaryModelCopyWith(_ExpenseSummaryModel value,
          $Res Function(_ExpenseSummaryModel) _then) =
      __$ExpenseSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'amount_by_category')
      Map<String, double> amountByCategory});
}

/// @nodoc
class __$ExpenseSummaryModelCopyWithImpl<$Res>
    implements _$ExpenseSummaryModelCopyWith<$Res> {
  __$ExpenseSummaryModelCopyWithImpl(this._self, this._then);

  final _ExpenseSummaryModel _self;
  final $Res Function(_ExpenseSummaryModel) _then;

  /// Create a copy of ExpenseSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalAmount = null,
    Object? count = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? amountByCategory = null,
  }) {
    return _then(_ExpenseSummaryModel(
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      amountByCategory: null == amountByCategory
          ? _self._amountByCategory
          : amountByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

// dart format on
