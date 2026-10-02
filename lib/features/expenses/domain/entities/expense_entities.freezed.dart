// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Expense {
  String get id;
  double get amount;
  double? get quantity;
  DateTime get date;
  ExpenseCategory get category;
  String get paymentMethod;
  String get description;
  String? get batchId;
  String? get receiptUrl;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<Expense> get copyWith =>
      _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Expense &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, amount, quantity, date,
      category, paymentMethod, description, batchId, receiptUrl);

  @override
  String toString() {
    return 'Expense(id: $id, amount: $amount, quantity: $quantity, date: $date, category: $category, paymentMethod: $paymentMethod, description: $description, batchId: $batchId, receiptUrl: $receiptUrl)';
  }
}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) =
      _$ExpenseCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      double amount,
      double? quantity,
      DateTime date,
      ExpenseCategory category,
      String paymentMethod,
      String description,
      String? batchId,
      String? receiptUrl});

  $ExpenseCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res> implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

  /// Create a copy of Expense
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
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory,
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

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res> get category {
    return $ExpenseCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
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
    TResult Function(_Expense value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Expense() when $default != null:
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
    TResult Function(_Expense value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Expense():
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
    TResult? Function(_Expense value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Expense() when $default != null:
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
            double amount,
            double? quantity,
            DateTime date,
            ExpenseCategory category,
            String paymentMethod,
            String description,
            String? batchId,
            String? receiptUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Expense() when $default != null:
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
            String id,
            double amount,
            double? quantity,
            DateTime date,
            ExpenseCategory category,
            String paymentMethod,
            String description,
            String? batchId,
            String? receiptUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Expense():
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
            String id,
            double amount,
            double? quantity,
            DateTime date,
            ExpenseCategory category,
            String paymentMethod,
            String description,
            String? batchId,
            String? receiptUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Expense() when $default != null:
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

class _Expense implements Expense {
  const _Expense(
      {required this.id,
      required this.amount,
      this.quantity,
      required this.date,
      required this.category,
      required this.paymentMethod,
      required this.description,
      this.batchId,
      this.receiptUrl});

  @override
  final String id;
  @override
  final double amount;
  @override
  final double? quantity;
  @override
  final DateTime date;
  @override
  final ExpenseCategory category;
  @override
  final String paymentMethod;
  @override
  final String description;
  @override
  final String? batchId;
  @override
  final String? receiptUrl;

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseCopyWith<_Expense> get copyWith =>
      __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Expense &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, amount, quantity, date,
      category, paymentMethod, description, batchId, receiptUrl);

  @override
  String toString() {
    return 'Expense(id: $id, amount: $amount, quantity: $quantity, date: $date, category: $category, paymentMethod: $paymentMethod, description: $description, batchId: $batchId, receiptUrl: $receiptUrl)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) =
      __$ExpenseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      double? quantity,
      DateTime date,
      ExpenseCategory category,
      String paymentMethod,
      String description,
      String? batchId,
      String? receiptUrl});

  @override
  $ExpenseCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res> implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

  /// Create a copy of Expense
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
    return _then(_Expense(
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
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory,
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

  /// Create a copy of Expense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res> get category {
    return $ExpenseCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$ExpenseCategory {
  String get id;
  String get name;
  String get colorCode;
  String get iconName;

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<ExpenseCategory> get copyWith =>
      _$ExpenseCategoryCopyWithImpl<ExpenseCategory>(
          this as ExpenseCategory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseCategory &&
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
    return 'ExpenseCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $ExpenseCategoryCopyWith<$Res> {
  factory $ExpenseCategoryCopyWith(
          ExpenseCategory value, $Res Function(ExpenseCategory) _then) =
      _$ExpenseCategoryCopyWithImpl;
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._self, this._then);

  final ExpenseCategory _self;
  final $Res Function(ExpenseCategory) _then;

  /// Create a copy of ExpenseCategory
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

/// Adds pattern-matching-related methods to [ExpenseCategory].
extension ExpenseCategoryPatterns on ExpenseCategory {
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
    TResult Function(_ExpenseCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategory() when $default != null:
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
    TResult Function(_ExpenseCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategory():
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
    TResult? Function(_ExpenseCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseCategory() when $default != null:
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
      case _ExpenseCategory() when $default != null:
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
      case _ExpenseCategory():
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
      case _ExpenseCategory() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseCategory implements ExpenseCategory {
  const _ExpenseCategory(
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

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseCategoryCopyWith<_ExpenseCategory> get copyWith =>
      __$ExpenseCategoryCopyWithImpl<_ExpenseCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseCategory &&
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
    return 'ExpenseCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseCategoryCopyWith<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  factory _$ExpenseCategoryCopyWith(
          _ExpenseCategory value, $Res Function(_ExpenseCategory) _then) =
      __$ExpenseCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class __$ExpenseCategoryCopyWithImpl<$Res>
    implements _$ExpenseCategoryCopyWith<$Res> {
  __$ExpenseCategoryCopyWithImpl(this._self, this._then);

  final _ExpenseCategory _self;
  final $Res Function(_ExpenseCategory) _then;

  /// Create a copy of ExpenseCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_ExpenseCategory(
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
mixin _$ExpenseSummary {
  double get totalAmount;
  int get count;
  DateTime get startDate;
  DateTime get endDate;
  Map<String, double> get amountByCategory;

  /// Create a copy of ExpenseSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseSummaryCopyWith<ExpenseSummary> get copyWith =>
      _$ExpenseSummaryCopyWithImpl<ExpenseSummary>(
          this as ExpenseSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseSummary &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other.amountByCategory, amountByCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalAmount, count, startDate,
      endDate, const DeepCollectionEquality().hash(amountByCategory));

  @override
  String toString() {
    return 'ExpenseSummary(totalAmount: $totalAmount, count: $count, startDate: $startDate, endDate: $endDate, amountByCategory: $amountByCategory)';
  }
}

/// @nodoc
abstract mixin class $ExpenseSummaryCopyWith<$Res> {
  factory $ExpenseSummaryCopyWith(
          ExpenseSummary value, $Res Function(ExpenseSummary) _then) =
      _$ExpenseSummaryCopyWithImpl;
  @useResult
  $Res call(
      {double totalAmount,
      int count,
      DateTime startDate,
      DateTime endDate,
      Map<String, double> amountByCategory});
}

/// @nodoc
class _$ExpenseSummaryCopyWithImpl<$Res>
    implements $ExpenseSummaryCopyWith<$Res> {
  _$ExpenseSummaryCopyWithImpl(this._self, this._then);

  final ExpenseSummary _self;
  final $Res Function(ExpenseSummary) _then;

  /// Create a copy of ExpenseSummary
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
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amountByCategory: null == amountByCategory
          ? _self.amountByCategory
          : amountByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseSummary].
extension ExpenseSummaryPatterns on ExpenseSummary {
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
    TResult Function(_ExpenseSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary() when $default != null:
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
    TResult Function(_ExpenseSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary():
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
    TResult? Function(_ExpenseSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary() when $default != null:
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
    TResult Function(double totalAmount, int count, DateTime startDate,
            DateTime endDate, Map<String, double> amountByCategory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary() when $default != null:
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
    TResult Function(double totalAmount, int count, DateTime startDate,
            DateTime endDate, Map<String, double> amountByCategory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary():
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
    TResult? Function(double totalAmount, int count, DateTime startDate,
            DateTime endDate, Map<String, double> amountByCategory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseSummary() when $default != null:
        return $default(_that.totalAmount, _that.count, _that.startDate,
            _that.endDate, _that.amountByCategory);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseSummary implements ExpenseSummary {
  const _ExpenseSummary(
      {required this.totalAmount,
      required this.count,
      required this.startDate,
      required this.endDate,
      required final Map<String, double> amountByCategory})
      : _amountByCategory = amountByCategory;

  @override
  final double totalAmount;
  @override
  final int count;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final Map<String, double> _amountByCategory;
  @override
  Map<String, double> get amountByCategory {
    if (_amountByCategory is EqualUnmodifiableMapView) return _amountByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_amountByCategory);
  }

  /// Create a copy of ExpenseSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseSummaryCopyWith<_ExpenseSummary> get copyWith =>
      __$ExpenseSummaryCopyWithImpl<_ExpenseSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseSummary &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._amountByCategory, _amountByCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalAmount, count, startDate,
      endDate, const DeepCollectionEquality().hash(_amountByCategory));

  @override
  String toString() {
    return 'ExpenseSummary(totalAmount: $totalAmount, count: $count, startDate: $startDate, endDate: $endDate, amountByCategory: $amountByCategory)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseSummaryCopyWith<$Res>
    implements $ExpenseSummaryCopyWith<$Res> {
  factory _$ExpenseSummaryCopyWith(
          _ExpenseSummary value, $Res Function(_ExpenseSummary) _then) =
      __$ExpenseSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalAmount,
      int count,
      DateTime startDate,
      DateTime endDate,
      Map<String, double> amountByCategory});
}

/// @nodoc
class __$ExpenseSummaryCopyWithImpl<$Res>
    implements _$ExpenseSummaryCopyWith<$Res> {
  __$ExpenseSummaryCopyWithImpl(this._self, this._then);

  final _ExpenseSummary _self;
  final $Res Function(_ExpenseSummary) _then;

  /// Create a copy of ExpenseSummary
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
    return _then(_ExpenseSummary(
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
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amountByCategory: null == amountByCategory
          ? _self._amountByCategory
          : amountByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
mixin _$ExpenseFilter {
  DateTime? get startDate;
  DateTime? get endDate;
  List<String>? get categoryIds;
  String? get batchId;
  String? get paymentMethod;
  double? get minAmount;
  double? get maxAmount;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseFilterCopyWith<ExpenseFilter> get copyWith =>
      _$ExpenseFilterCopyWithImpl<ExpenseFilter>(
          this as ExpenseFilter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseFilter &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other.categoryIds, categoryIds) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(categoryIds),
      batchId,
      paymentMethod,
      minAmount,
      maxAmount);

  @override
  String toString() {
    return 'ExpenseFilter(startDate: $startDate, endDate: $endDate, categoryIds: $categoryIds, batchId: $batchId, paymentMethod: $paymentMethod, minAmount: $minAmount, maxAmount: $maxAmount)';
  }
}

/// @nodoc
abstract mixin class $ExpenseFilterCopyWith<$Res> {
  factory $ExpenseFilterCopyWith(
          ExpenseFilter value, $Res Function(ExpenseFilter) _then) =
      _$ExpenseFilterCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? categoryIds,
      String? batchId,
      String? paymentMethod,
      double? minAmount,
      double? maxAmount});
}

/// @nodoc
class _$ExpenseFilterCopyWithImpl<$Res>
    implements $ExpenseFilterCopyWith<$Res> {
  _$ExpenseFilterCopyWithImpl(this._self, this._then);

  final ExpenseFilter _self;
  final $Res Function(ExpenseFilter) _then;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? categoryIds = freezed,
    Object? batchId = freezed,
    Object? paymentMethod = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
  }) {
    return _then(_self.copyWith(
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryIds: freezed == categoryIds
          ? _self.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmount: freezed == minAmount
          ? _self.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _self.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseFilter].
extension ExpenseFilterPatterns on ExpenseFilter {
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
    TResult Function(_ExpenseFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter() when $default != null:
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
    TResult Function(_ExpenseFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter():
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
    TResult? Function(_ExpenseFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter() when $default != null:
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
            DateTime? startDate,
            DateTime? endDate,
            List<String>? categoryIds,
            String? batchId,
            String? paymentMethod,
            double? minAmount,
            double? maxAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.categoryIds,
            _that.batchId,
            _that.paymentMethod,
            _that.minAmount,
            _that.maxAmount);
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
            DateTime? startDate,
            DateTime? endDate,
            List<String>? categoryIds,
            String? batchId,
            String? paymentMethod,
            double? minAmount,
            double? maxAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter():
        return $default(
            _that.startDate,
            _that.endDate,
            _that.categoryIds,
            _that.batchId,
            _that.paymentMethod,
            _that.minAmount,
            _that.maxAmount);
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
            DateTime? startDate,
            DateTime? endDate,
            List<String>? categoryIds,
            String? batchId,
            String? paymentMethod,
            double? minAmount,
            double? maxAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseFilter() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.categoryIds,
            _that.batchId,
            _that.paymentMethod,
            _that.minAmount,
            _that.maxAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseFilter implements ExpenseFilter {
  const _ExpenseFilter(
      {this.startDate,
      this.endDate,
      final List<String>? categoryIds,
      this.batchId,
      this.paymentMethod,
      this.minAmount,
      this.maxAmount})
      : _categoryIds = categoryIds;

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<String>? _categoryIds;
  @override
  List<String>? get categoryIds {
    final value = _categoryIds;
    if (value == null) return null;
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? batchId;
  @override
  final String? paymentMethod;
  @override
  final double? minAmount;
  @override
  final double? maxAmount;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseFilterCopyWith<_ExpenseFilter> get copyWith =>
      __$ExpenseFilterCopyWithImpl<_ExpenseFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseFilter &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_categoryIds),
      batchId,
      paymentMethod,
      minAmount,
      maxAmount);

  @override
  String toString() {
    return 'ExpenseFilter(startDate: $startDate, endDate: $endDate, categoryIds: $categoryIds, batchId: $batchId, paymentMethod: $paymentMethod, minAmount: $minAmount, maxAmount: $maxAmount)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseFilterCopyWith<$Res>
    implements $ExpenseFilterCopyWith<$Res> {
  factory _$ExpenseFilterCopyWith(
          _ExpenseFilter value, $Res Function(_ExpenseFilter) _then) =
      __$ExpenseFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? categoryIds,
      String? batchId,
      String? paymentMethod,
      double? minAmount,
      double? maxAmount});
}

/// @nodoc
class __$ExpenseFilterCopyWithImpl<$Res>
    implements _$ExpenseFilterCopyWith<$Res> {
  __$ExpenseFilterCopyWithImpl(this._self, this._then);

  final _ExpenseFilter _self;
  final $Res Function(_ExpenseFilter) _then;

  /// Create a copy of ExpenseFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? categoryIds = freezed,
    Object? batchId = freezed,
    Object? paymentMethod = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
  }) {
    return _then(_ExpenseFilter(
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryIds: freezed == categoryIds
          ? _self._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmount: freezed == minAmount
          ? _self.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _self.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$ExpenseStatistics {
  double get averageDailyExpense;
  String get highestCategory;
  double get highestCategoryAmount;
  List<double> get weeklyTrend;

  /// Create a copy of ExpenseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseStatisticsCopyWith<ExpenseStatistics> get copyWith =>
      _$ExpenseStatisticsCopyWithImpl<ExpenseStatistics>(
          this as ExpenseStatistics, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseStatistics &&
            (identical(other.averageDailyExpense, averageDailyExpense) ||
                other.averageDailyExpense == averageDailyExpense) &&
            (identical(other.highestCategory, highestCategory) ||
                other.highestCategory == highestCategory) &&
            (identical(other.highestCategoryAmount, highestCategoryAmount) ||
                other.highestCategoryAmount == highestCategoryAmount) &&
            const DeepCollectionEquality()
                .equals(other.weeklyTrend, weeklyTrend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageDailyExpense,
      highestCategory,
      highestCategoryAmount,
      const DeepCollectionEquality().hash(weeklyTrend));

  @override
  String toString() {
    return 'ExpenseStatistics(averageDailyExpense: $averageDailyExpense, highestCategory: $highestCategory, highestCategoryAmount: $highestCategoryAmount, weeklyTrend: $weeklyTrend)';
  }
}

/// @nodoc
abstract mixin class $ExpenseStatisticsCopyWith<$Res> {
  factory $ExpenseStatisticsCopyWith(
          ExpenseStatistics value, $Res Function(ExpenseStatistics) _then) =
      _$ExpenseStatisticsCopyWithImpl;
  @useResult
  $Res call(
      {double averageDailyExpense,
      String highestCategory,
      double highestCategoryAmount,
      List<double> weeklyTrend});
}

/// @nodoc
class _$ExpenseStatisticsCopyWithImpl<$Res>
    implements $ExpenseStatisticsCopyWith<$Res> {
  _$ExpenseStatisticsCopyWithImpl(this._self, this._then);

  final ExpenseStatistics _self;
  final $Res Function(ExpenseStatistics) _then;

  /// Create a copy of ExpenseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageDailyExpense = null,
    Object? highestCategory = null,
    Object? highestCategoryAmount = null,
    Object? weeklyTrend = null,
  }) {
    return _then(_self.copyWith(
      averageDailyExpense: null == averageDailyExpense
          ? _self.averageDailyExpense
          : averageDailyExpense // ignore: cast_nullable_to_non_nullable
              as double,
      highestCategory: null == highestCategory
          ? _self.highestCategory
          : highestCategory // ignore: cast_nullable_to_non_nullable
              as String,
      highestCategoryAmount: null == highestCategoryAmount
          ? _self.highestCategoryAmount
          : highestCategoryAmount // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyTrend: null == weeklyTrend
          ? _self.weeklyTrend
          : weeklyTrend // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseStatistics].
extension ExpenseStatisticsPatterns on ExpenseStatistics {
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
    TResult Function(_ExpenseStatistics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics() when $default != null:
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
    TResult Function(_ExpenseStatistics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics():
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
    TResult? Function(_ExpenseStatistics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics() when $default != null:
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
    TResult Function(double averageDailyExpense, String highestCategory,
            double highestCategoryAmount, List<double> weeklyTrend)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics() when $default != null:
        return $default(_that.averageDailyExpense, _that.highestCategory,
            _that.highestCategoryAmount, _that.weeklyTrend);
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
    TResult Function(double averageDailyExpense, String highestCategory,
            double highestCategoryAmount, List<double> weeklyTrend)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics():
        return $default(_that.averageDailyExpense, _that.highestCategory,
            _that.highestCategoryAmount, _that.weeklyTrend);
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
    TResult? Function(double averageDailyExpense, String highestCategory,
            double highestCategoryAmount, List<double> weeklyTrend)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseStatistics() when $default != null:
        return $default(_that.averageDailyExpense, _that.highestCategory,
            _that.highestCategoryAmount, _that.weeklyTrend);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseStatistics implements ExpenseStatistics {
  const _ExpenseStatistics(
      {required this.averageDailyExpense,
      required this.highestCategory,
      required this.highestCategoryAmount,
      required final List<double> weeklyTrend})
      : _weeklyTrend = weeklyTrend;

  @override
  final double averageDailyExpense;
  @override
  final String highestCategory;
  @override
  final double highestCategoryAmount;
  final List<double> _weeklyTrend;
  @override
  List<double> get weeklyTrend {
    if (_weeklyTrend is EqualUnmodifiableListView) return _weeklyTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyTrend);
  }

  /// Create a copy of ExpenseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseStatisticsCopyWith<_ExpenseStatistics> get copyWith =>
      __$ExpenseStatisticsCopyWithImpl<_ExpenseStatistics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseStatistics &&
            (identical(other.averageDailyExpense, averageDailyExpense) ||
                other.averageDailyExpense == averageDailyExpense) &&
            (identical(other.highestCategory, highestCategory) ||
                other.highestCategory == highestCategory) &&
            (identical(other.highestCategoryAmount, highestCategoryAmount) ||
                other.highestCategoryAmount == highestCategoryAmount) &&
            const DeepCollectionEquality()
                .equals(other._weeklyTrend, _weeklyTrend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageDailyExpense,
      highestCategory,
      highestCategoryAmount,
      const DeepCollectionEquality().hash(_weeklyTrend));

  @override
  String toString() {
    return 'ExpenseStatistics(averageDailyExpense: $averageDailyExpense, highestCategory: $highestCategory, highestCategoryAmount: $highestCategoryAmount, weeklyTrend: $weeklyTrend)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseStatisticsCopyWith<$Res>
    implements $ExpenseStatisticsCopyWith<$Res> {
  factory _$ExpenseStatisticsCopyWith(
          _ExpenseStatistics value, $Res Function(_ExpenseStatistics) _then) =
      __$ExpenseStatisticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double averageDailyExpense,
      String highestCategory,
      double highestCategoryAmount,
      List<double> weeklyTrend});
}

/// @nodoc
class __$ExpenseStatisticsCopyWithImpl<$Res>
    implements _$ExpenseStatisticsCopyWith<$Res> {
  __$ExpenseStatisticsCopyWithImpl(this._self, this._then);

  final _ExpenseStatistics _self;
  final $Res Function(_ExpenseStatistics) _then;

  /// Create a copy of ExpenseStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? averageDailyExpense = null,
    Object? highestCategory = null,
    Object? highestCategoryAmount = null,
    Object? weeklyTrend = null,
  }) {
    return _then(_ExpenseStatistics(
      averageDailyExpense: null == averageDailyExpense
          ? _self.averageDailyExpense
          : averageDailyExpense // ignore: cast_nullable_to_non_nullable
              as double,
      highestCategory: null == highestCategory
          ? _self.highestCategory
          : highestCategory // ignore: cast_nullable_to_non_nullable
              as String,
      highestCategoryAmount: null == highestCategoryAmount
          ? _self.highestCategoryAmount
          : highestCategoryAmount // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyTrend: null == weeklyTrend
          ? _self._weeklyTrend
          : weeklyTrend // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

// dart format on
