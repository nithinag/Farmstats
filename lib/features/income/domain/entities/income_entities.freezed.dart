// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Income {
  String get id;
  DateTime get saleDate;
  String? get batchId;
  Buyer get buyer;
  IncomeCategory get category;
  String get cocoonGrade;
  double get quantity;
  double get rate;
  double get grossAmount;
  double get transportCharges;
  double get commission;
  double get netAmount;
  String get paymentMethod;
  String get paymentStatus;
  String? get invoiceNumber;
  String? get remarks;

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeCopyWith<Income> get copyWith =>
      _$IncomeCopyWithImpl<Income>(this as Income, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Income &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cocoonGrade, cocoonGrade) ||
                other.cocoonGrade == cocoonGrade) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.transportCharges, transportCharges) ||
                other.transportCharges == transportCharges) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      saleDate,
      batchId,
      buyer,
      category,
      cocoonGrade,
      quantity,
      rate,
      grossAmount,
      transportCharges,
      commission,
      netAmount,
      paymentMethod,
      paymentStatus,
      invoiceNumber,
      remarks);

  @override
  String toString() {
    return 'Income(id: $id, saleDate: $saleDate, batchId: $batchId, buyer: $buyer, category: $category, cocoonGrade: $cocoonGrade, quantity: $quantity, rate: $rate, grossAmount: $grossAmount, transportCharges: $transportCharges, commission: $commission, netAmount: $netAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, invoiceNumber: $invoiceNumber, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) _then) =
      _$IncomeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      DateTime saleDate,
      String? batchId,
      Buyer buyer,
      IncomeCategory category,
      String cocoonGrade,
      double quantity,
      double rate,
      double grossAmount,
      double transportCharges,
      double commission,
      double netAmount,
      String paymentMethod,
      String paymentStatus,
      String? invoiceNumber,
      String? remarks});

  $BuyerCopyWith<$Res> get buyer;
  $IncomeCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res> implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._self, this._then);

  final Income _self;
  final $Res Function(Income) _then;

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleDate = null,
    Object? batchId = freezed,
    Object? buyer = null,
    Object? category = null,
    Object? cocoonGrade = null,
    Object? quantity = null,
    Object? rate = null,
    Object? grossAmount = null,
    Object? transportCharges = null,
    Object? commission = null,
    Object? netAmount = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? invoiceNumber = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saleDate: null == saleDate
          ? _self.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyer: null == buyer
          ? _self.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as Buyer,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategory,
      cocoonGrade: null == cocoonGrade
          ? _self.cocoonGrade
          : cocoonGrade // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transportCharges: null == transportCharges
          ? _self.transportCharges
          : transportCharges // ignore: cast_nullable_to_non_nullable
              as double,
      commission: null == commission
          ? _self.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: freezed == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuyerCopyWith<$Res> get buyer {
    return $BuyerCopyWith<$Res>(_self.buyer, (value) {
      return _then(_self.copyWith(buyer: value));
    });
  }

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomeCategoryCopyWith<$Res> get category {
    return $IncomeCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Income].
extension IncomePatterns on Income {
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
    TResult Function(_Income value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Income() when $default != null:
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
    TResult Function(_Income value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Income():
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
    TResult? Function(_Income value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Income() when $default != null:
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
            DateTime saleDate,
            String? batchId,
            Buyer buyer,
            IncomeCategory category,
            String cocoonGrade,
            double quantity,
            double rate,
            double grossAmount,
            double transportCharges,
            double commission,
            double netAmount,
            String paymentMethod,
            String paymentStatus,
            String? invoiceNumber,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Income() when $default != null:
        return $default(
            _that.id,
            _that.saleDate,
            _that.batchId,
            _that.buyer,
            _that.category,
            _that.cocoonGrade,
            _that.quantity,
            _that.rate,
            _that.grossAmount,
            _that.transportCharges,
            _that.commission,
            _that.netAmount,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.invoiceNumber,
            _that.remarks);
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
            DateTime saleDate,
            String? batchId,
            Buyer buyer,
            IncomeCategory category,
            String cocoonGrade,
            double quantity,
            double rate,
            double grossAmount,
            double transportCharges,
            double commission,
            double netAmount,
            String paymentMethod,
            String paymentStatus,
            String? invoiceNumber,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Income():
        return $default(
            _that.id,
            _that.saleDate,
            _that.batchId,
            _that.buyer,
            _that.category,
            _that.cocoonGrade,
            _that.quantity,
            _that.rate,
            _that.grossAmount,
            _that.transportCharges,
            _that.commission,
            _that.netAmount,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.invoiceNumber,
            _that.remarks);
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
            DateTime saleDate,
            String? batchId,
            Buyer buyer,
            IncomeCategory category,
            String cocoonGrade,
            double quantity,
            double rate,
            double grossAmount,
            double transportCharges,
            double commission,
            double netAmount,
            String paymentMethod,
            String paymentStatus,
            String? invoiceNumber,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Income() when $default != null:
        return $default(
            _that.id,
            _that.saleDate,
            _that.batchId,
            _that.buyer,
            _that.category,
            _that.cocoonGrade,
            _that.quantity,
            _that.rate,
            _that.grossAmount,
            _that.transportCharges,
            _that.commission,
            _that.netAmount,
            _that.paymentMethod,
            _that.paymentStatus,
            _that.invoiceNumber,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Income implements Income {
  const _Income(
      {required this.id,
      required this.saleDate,
      this.batchId,
      required this.buyer,
      required this.category,
      required this.cocoonGrade,
      required this.quantity,
      required this.rate,
      required this.grossAmount,
      required this.transportCharges,
      required this.commission,
      required this.netAmount,
      required this.paymentMethod,
      required this.paymentStatus,
      this.invoiceNumber,
      this.remarks});

  @override
  final String id;
  @override
  final DateTime saleDate;
  @override
  final String? batchId;
  @override
  final Buyer buyer;
  @override
  final IncomeCategory category;
  @override
  final String cocoonGrade;
  @override
  final double quantity;
  @override
  final double rate;
  @override
  final double grossAmount;
  @override
  final double transportCharges;
  @override
  final double commission;
  @override
  final double netAmount;
  @override
  final String paymentMethod;
  @override
  final String paymentStatus;
  @override
  final String? invoiceNumber;
  @override
  final String? remarks;

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomeCopyWith<_Income> get copyWith =>
      __$IncomeCopyWithImpl<_Income>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Income &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cocoonGrade, cocoonGrade) ||
                other.cocoonGrade == cocoonGrade) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.transportCharges, transportCharges) ||
                other.transportCharges == transportCharges) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      saleDate,
      batchId,
      buyer,
      category,
      cocoonGrade,
      quantity,
      rate,
      grossAmount,
      transportCharges,
      commission,
      netAmount,
      paymentMethod,
      paymentStatus,
      invoiceNumber,
      remarks);

  @override
  String toString() {
    return 'Income(id: $id, saleDate: $saleDate, batchId: $batchId, buyer: $buyer, category: $category, cocoonGrade: $cocoonGrade, quantity: $quantity, rate: $rate, grossAmount: $grossAmount, transportCharges: $transportCharges, commission: $commission, netAmount: $netAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, invoiceNumber: $invoiceNumber, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$IncomeCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$IncomeCopyWith(_Income value, $Res Function(_Income) _then) =
      __$IncomeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime saleDate,
      String? batchId,
      Buyer buyer,
      IncomeCategory category,
      String cocoonGrade,
      double quantity,
      double rate,
      double grossAmount,
      double transportCharges,
      double commission,
      double netAmount,
      String paymentMethod,
      String paymentStatus,
      String? invoiceNumber,
      String? remarks});

  @override
  $BuyerCopyWith<$Res> get buyer;
  @override
  $IncomeCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$IncomeCopyWithImpl<$Res> implements _$IncomeCopyWith<$Res> {
  __$IncomeCopyWithImpl(this._self, this._then);

  final _Income _self;
  final $Res Function(_Income) _then;

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? saleDate = null,
    Object? batchId = freezed,
    Object? buyer = null,
    Object? category = null,
    Object? cocoonGrade = null,
    Object? quantity = null,
    Object? rate = null,
    Object? grossAmount = null,
    Object? transportCharges = null,
    Object? commission = null,
    Object? netAmount = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? invoiceNumber = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_Income(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saleDate: null == saleDate
          ? _self.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyer: null == buyer
          ? _self.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as Buyer,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategory,
      cocoonGrade: null == cocoonGrade
          ? _self.cocoonGrade
          : cocoonGrade // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      grossAmount: null == grossAmount
          ? _self.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transportCharges: null == transportCharges
          ? _self.transportCharges
          : transportCharges // ignore: cast_nullable_to_non_nullable
              as double,
      commission: null == commission
          ? _self.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: freezed == invoiceNumber
          ? _self.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuyerCopyWith<$Res> get buyer {
    return $BuyerCopyWith<$Res>(_self.buyer, (value) {
      return _then(_self.copyWith(buyer: value));
    });
  }

  /// Create a copy of Income
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomeCategoryCopyWith<$Res> get category {
    return $IncomeCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$IncomeCategory {
  String get id;
  String get name;
  String get colorCode;
  String get iconName;

  /// Create a copy of IncomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeCategoryCopyWith<IncomeCategory> get copyWith =>
      _$IncomeCategoryCopyWithImpl<IncomeCategory>(
          this as IncomeCategory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeCategory &&
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
    return 'IncomeCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $IncomeCategoryCopyWith<$Res> {
  factory $IncomeCategoryCopyWith(
          IncomeCategory value, $Res Function(IncomeCategory) _then) =
      _$IncomeCategoryCopyWithImpl;
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class _$IncomeCategoryCopyWithImpl<$Res>
    implements $IncomeCategoryCopyWith<$Res> {
  _$IncomeCategoryCopyWithImpl(this._self, this._then);

  final IncomeCategory _self;
  final $Res Function(IncomeCategory) _then;

  /// Create a copy of IncomeCategory
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

/// Adds pattern-matching-related methods to [IncomeCategory].
extension IncomeCategoryPatterns on IncomeCategory {
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
    TResult Function(_IncomeCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomeCategory() when $default != null:
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
    TResult Function(_IncomeCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeCategory():
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
    TResult? Function(_IncomeCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeCategory() when $default != null:
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
      case _IncomeCategory() when $default != null:
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
      case _IncomeCategory():
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
      case _IncomeCategory() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IncomeCategory implements IncomeCategory {
  const _IncomeCategory(
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

  /// Create a copy of IncomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomeCategoryCopyWith<_IncomeCategory> get copyWith =>
      __$IncomeCategoryCopyWithImpl<_IncomeCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeCategory &&
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
    return 'IncomeCategory(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$IncomeCategoryCopyWith<$Res>
    implements $IncomeCategoryCopyWith<$Res> {
  factory _$IncomeCategoryCopyWith(
          _IncomeCategory value, $Res Function(_IncomeCategory) _then) =
      __$IncomeCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class __$IncomeCategoryCopyWithImpl<$Res>
    implements _$IncomeCategoryCopyWith<$Res> {
  __$IncomeCategoryCopyWithImpl(this._self, this._then);

  final _IncomeCategory _self;
  final $Res Function(_IncomeCategory) _then;

  /// Create a copy of IncomeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_IncomeCategory(
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
mixin _$Buyer {
  String get id;
  String get name;
  String get contact;

  /// Create a copy of Buyer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuyerCopyWith<Buyer> get copyWith =>
      _$BuyerCopyWithImpl<Buyer>(this as Buyer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Buyer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, contact);

  @override
  String toString() {
    return 'Buyer(id: $id, name: $name, contact: $contact)';
  }
}

/// @nodoc
abstract mixin class $BuyerCopyWith<$Res> {
  factory $BuyerCopyWith(Buyer value, $Res Function(Buyer) _then) =
      _$BuyerCopyWithImpl;
  @useResult
  $Res call({String id, String name, String contact});
}

/// @nodoc
class _$BuyerCopyWithImpl<$Res> implements $BuyerCopyWith<$Res> {
  _$BuyerCopyWithImpl(this._self, this._then);

  final Buyer _self;
  final $Res Function(Buyer) _then;

  /// Create a copy of Buyer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contact = null,
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
      contact: null == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Buyer].
extension BuyerPatterns on Buyer {
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
    TResult Function(_Buyer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Buyer() when $default != null:
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
    TResult Function(_Buyer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Buyer():
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
    TResult? Function(_Buyer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Buyer() when $default != null:
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
    TResult Function(String id, String name, String contact)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Buyer() when $default != null:
        return $default(_that.id, _that.name, _that.contact);
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
    TResult Function(String id, String name, String contact) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Buyer():
        return $default(_that.id, _that.name, _that.contact);
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
    TResult? Function(String id, String name, String contact)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Buyer() when $default != null:
        return $default(_that.id, _that.name, _that.contact);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Buyer implements Buyer {
  const _Buyer({required this.id, required this.name, required this.contact});

  @override
  final String id;
  @override
  final String name;
  @override
  final String contact;

  /// Create a copy of Buyer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuyerCopyWith<_Buyer> get copyWith =>
      __$BuyerCopyWithImpl<_Buyer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Buyer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, contact);

  @override
  String toString() {
    return 'Buyer(id: $id, name: $name, contact: $contact)';
  }
}

/// @nodoc
abstract mixin class _$BuyerCopyWith<$Res> implements $BuyerCopyWith<$Res> {
  factory _$BuyerCopyWith(_Buyer value, $Res Function(_Buyer) _then) =
      __$BuyerCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String contact});
}

/// @nodoc
class __$BuyerCopyWithImpl<$Res> implements _$BuyerCopyWith<$Res> {
  __$BuyerCopyWithImpl(this._self, this._then);

  final _Buyer _self;
  final $Res Function(_Buyer) _then;

  /// Create a copy of Buyer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contact = null,
  }) {
    return _then(_Buyer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$IncomeFilter {
  DateTime? get startDate;
  DateTime? get endDate;
  List<String>? get buyerIds;
  String? get batchId;
  String? get paymentStatus;
  double? get minAmount;
  double? get maxAmount;

  /// Create a copy of IncomeFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeFilterCopyWith<IncomeFilter> get copyWith =>
      _$IncomeFilterCopyWithImpl<IncomeFilter>(
          this as IncomeFilter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeFilter &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other.buyerIds, buyerIds) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
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
      const DeepCollectionEquality().hash(buyerIds),
      batchId,
      paymentStatus,
      minAmount,
      maxAmount);

  @override
  String toString() {
    return 'IncomeFilter(startDate: $startDate, endDate: $endDate, buyerIds: $buyerIds, batchId: $batchId, paymentStatus: $paymentStatus, minAmount: $minAmount, maxAmount: $maxAmount)';
  }
}

/// @nodoc
abstract mixin class $IncomeFilterCopyWith<$Res> {
  factory $IncomeFilterCopyWith(
          IncomeFilter value, $Res Function(IncomeFilter) _then) =
      _$IncomeFilterCopyWithImpl;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? buyerIds,
      String? batchId,
      String? paymentStatus,
      double? minAmount,
      double? maxAmount});
}

/// @nodoc
class _$IncomeFilterCopyWithImpl<$Res> implements $IncomeFilterCopyWith<$Res> {
  _$IncomeFilterCopyWithImpl(this._self, this._then);

  final IncomeFilter _self;
  final $Res Function(IncomeFilter) _then;

  /// Create a copy of IncomeFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? buyerIds = freezed,
    Object? batchId = freezed,
    Object? paymentStatus = freezed,
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
      buyerIds: freezed == buyerIds
          ? _self.buyerIds
          : buyerIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [IncomeFilter].
extension IncomeFilterPatterns on IncomeFilter {
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
    TResult Function(_IncomeFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter() when $default != null:
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
    TResult Function(_IncomeFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter():
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
    TResult? Function(_IncomeFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter() when $default != null:
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
            List<String>? buyerIds,
            String? batchId,
            String? paymentStatus,
            double? minAmount,
            double? maxAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.buyerIds,
            _that.batchId,
            _that.paymentStatus,
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
            List<String>? buyerIds,
            String? batchId,
            String? paymentStatus,
            double? minAmount,
            double? maxAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter():
        return $default(
            _that.startDate,
            _that.endDate,
            _that.buyerIds,
            _that.batchId,
            _that.paymentStatus,
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
            List<String>? buyerIds,
            String? batchId,
            String? paymentStatus,
            double? minAmount,
            double? maxAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeFilter() when $default != null:
        return $default(
            _that.startDate,
            _that.endDate,
            _that.buyerIds,
            _that.batchId,
            _that.paymentStatus,
            _that.minAmount,
            _that.maxAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _IncomeFilter implements IncomeFilter {
  const _IncomeFilter(
      {this.startDate,
      this.endDate,
      final List<String>? buyerIds,
      this.batchId,
      this.paymentStatus,
      this.minAmount,
      this.maxAmount})
      : _buyerIds = buyerIds;

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  final List<String>? _buyerIds;
  @override
  List<String>? get buyerIds {
    final value = _buyerIds;
    if (value == null) return null;
    if (_buyerIds is EqualUnmodifiableListView) return _buyerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? batchId;
  @override
  final String? paymentStatus;
  @override
  final double? minAmount;
  @override
  final double? maxAmount;

  /// Create a copy of IncomeFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomeFilterCopyWith<_IncomeFilter> get copyWith =>
      __$IncomeFilterCopyWithImpl<_IncomeFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeFilter &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._buyerIds, _buyerIds) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
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
      const DeepCollectionEquality().hash(_buyerIds),
      batchId,
      paymentStatus,
      minAmount,
      maxAmount);

  @override
  String toString() {
    return 'IncomeFilter(startDate: $startDate, endDate: $endDate, buyerIds: $buyerIds, batchId: $batchId, paymentStatus: $paymentStatus, minAmount: $minAmount, maxAmount: $maxAmount)';
  }
}

/// @nodoc
abstract mixin class _$IncomeFilterCopyWith<$Res>
    implements $IncomeFilterCopyWith<$Res> {
  factory _$IncomeFilterCopyWith(
          _IncomeFilter value, $Res Function(_IncomeFilter) _then) =
      __$IncomeFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? buyerIds,
      String? batchId,
      String? paymentStatus,
      double? minAmount,
      double? maxAmount});
}

/// @nodoc
class __$IncomeFilterCopyWithImpl<$Res>
    implements _$IncomeFilterCopyWith<$Res> {
  __$IncomeFilterCopyWithImpl(this._self, this._then);

  final _IncomeFilter _self;
  final $Res Function(_IncomeFilter) _then;

  /// Create a copy of IncomeFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? buyerIds = freezed,
    Object? batchId = freezed,
    Object? paymentStatus = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
  }) {
    return _then(_IncomeFilter(
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      buyerIds: freezed == buyerIds
          ? _self._buyerIds
          : buyerIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
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

// dart format on
