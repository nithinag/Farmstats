// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeModel {
  String get id;
  String get saleDate;
  String? get batchId;
  BuyerModel get buyer;
  IncomeCategoryModel get category;
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

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeModelCopyWith<IncomeModel> get copyWith =>
      _$IncomeModelCopyWithImpl<IncomeModel>(this as IncomeModel, _$identity);

  /// Serializes this IncomeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'IncomeModel(id: $id, saleDate: $saleDate, batchId: $batchId, buyer: $buyer, category: $category, cocoonGrade: $cocoonGrade, quantity: $quantity, rate: $rate, grossAmount: $grossAmount, transportCharges: $transportCharges, commission: $commission, netAmount: $netAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, invoiceNumber: $invoiceNumber, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $IncomeModelCopyWith<$Res> {
  factory $IncomeModelCopyWith(
          IncomeModel value, $Res Function(IncomeModel) _then) =
      _$IncomeModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String saleDate,
      String? batchId,
      BuyerModel buyer,
      IncomeCategoryModel category,
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

  $BuyerModelCopyWith<$Res> get buyer;
  $IncomeCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$IncomeModelCopyWithImpl<$Res> implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._self, this._then);

  final IncomeModel _self;
  final $Res Function(IncomeModel) _then;

  /// Create a copy of IncomeModel
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
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyer: null == buyer
          ? _self.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerModel,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategoryModel,
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

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuyerModelCopyWith<$Res> get buyer {
    return $BuyerModelCopyWith<$Res>(_self.buyer, (value) {
      return _then(_self.copyWith(buyer: value));
    });
  }

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomeCategoryModelCopyWith<$Res> get category {
    return $IncomeCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [IncomeModel].
extension IncomeModelPatterns on IncomeModel {
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
    TResult Function(_IncomeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomeModel() when $default != null:
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
    TResult Function(_IncomeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeModel():
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
    TResult? Function(_IncomeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeModel() when $default != null:
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
            String saleDate,
            String? batchId,
            BuyerModel buyer,
            IncomeCategoryModel category,
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
      case _IncomeModel() when $default != null:
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
            String saleDate,
            String? batchId,
            BuyerModel buyer,
            IncomeCategoryModel category,
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
      case _IncomeModel():
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
            String saleDate,
            String? batchId,
            BuyerModel buyer,
            IncomeCategoryModel category,
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
      case _IncomeModel() when $default != null:
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
@JsonSerializable()
class _IncomeModel implements IncomeModel {
  const _IncomeModel(
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
  factory _IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);

  @override
  final String id;
  @override
  final String saleDate;
  @override
  final String? batchId;
  @override
  final BuyerModel buyer;
  @override
  final IncomeCategoryModel category;
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

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomeModelCopyWith<_IncomeModel> get copyWith =>
      __$IncomeModelCopyWithImpl<_IncomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IncomeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'IncomeModel(id: $id, saleDate: $saleDate, batchId: $batchId, buyer: $buyer, category: $category, cocoonGrade: $cocoonGrade, quantity: $quantity, rate: $rate, grossAmount: $grossAmount, transportCharges: $transportCharges, commission: $commission, netAmount: $netAmount, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, invoiceNumber: $invoiceNumber, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$IncomeModelCopyWith<$Res>
    implements $IncomeModelCopyWith<$Res> {
  factory _$IncomeModelCopyWith(
          _IncomeModel value, $Res Function(_IncomeModel) _then) =
      __$IncomeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String saleDate,
      String? batchId,
      BuyerModel buyer,
      IncomeCategoryModel category,
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
  $BuyerModelCopyWith<$Res> get buyer;
  @override
  $IncomeCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$IncomeModelCopyWithImpl<$Res> implements _$IncomeModelCopyWith<$Res> {
  __$IncomeModelCopyWithImpl(this._self, this._then);

  final _IncomeModel _self;
  final $Res Function(_IncomeModel) _then;

  /// Create a copy of IncomeModel
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
    return _then(_IncomeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saleDate: null == saleDate
          ? _self.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      buyer: null == buyer
          ? _self.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerModel,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategoryModel,
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

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuyerModelCopyWith<$Res> get buyer {
    return $BuyerModelCopyWith<$Res>(_self.buyer, (value) {
      return _then(_self.copyWith(buyer: value));
    });
  }

  /// Create a copy of IncomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomeCategoryModelCopyWith<$Res> get category {
    return $IncomeCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
mixin _$IncomeCategoryModel {
  String get id;
  String get name;
  String get colorCode;
  String get iconName;

  /// Create a copy of IncomeCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeCategoryModelCopyWith<IncomeCategoryModel> get copyWith =>
      _$IncomeCategoryModelCopyWithImpl<IncomeCategoryModel>(
          this as IncomeCategoryModel, _$identity);

  /// Serializes this IncomeCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeCategoryModel &&
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
    return 'IncomeCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class $IncomeCategoryModelCopyWith<$Res> {
  factory $IncomeCategoryModelCopyWith(
          IncomeCategoryModel value, $Res Function(IncomeCategoryModel) _then) =
      _$IncomeCategoryModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class _$IncomeCategoryModelCopyWithImpl<$Res>
    implements $IncomeCategoryModelCopyWith<$Res> {
  _$IncomeCategoryModelCopyWithImpl(this._self, this._then);

  final IncomeCategoryModel _self;
  final $Res Function(IncomeCategoryModel) _then;

  /// Create a copy of IncomeCategoryModel
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

/// Adds pattern-matching-related methods to [IncomeCategoryModel].
extension IncomeCategoryModelPatterns on IncomeCategoryModel {
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
    TResult Function(_IncomeCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomeCategoryModel() when $default != null:
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
    TResult Function(_IncomeCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeCategoryModel():
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
    TResult? Function(_IncomeCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomeCategoryModel() when $default != null:
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
      case _IncomeCategoryModel() when $default != null:
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
      case _IncomeCategoryModel():
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
      case _IncomeCategoryModel() when $default != null:
        return $default(_that.id, _that.name, _that.colorCode, _that.iconName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IncomeCategoryModel implements IncomeCategoryModel {
  const _IncomeCategoryModel(
      {required this.id,
      required this.name,
      required this.colorCode,
      required this.iconName});
  factory _IncomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeCategoryModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String colorCode;
  @override
  final String iconName;

  /// Create a copy of IncomeCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomeCategoryModelCopyWith<_IncomeCategoryModel> get copyWith =>
      __$IncomeCategoryModelCopyWithImpl<_IncomeCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IncomeCategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeCategoryModel &&
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
    return 'IncomeCategoryModel(id: $id, name: $name, colorCode: $colorCode, iconName: $iconName)';
  }
}

/// @nodoc
abstract mixin class _$IncomeCategoryModelCopyWith<$Res>
    implements $IncomeCategoryModelCopyWith<$Res> {
  factory _$IncomeCategoryModelCopyWith(_IncomeCategoryModel value,
          $Res Function(_IncomeCategoryModel) _then) =
      __$IncomeCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String colorCode, String iconName});
}

/// @nodoc
class __$IncomeCategoryModelCopyWithImpl<$Res>
    implements _$IncomeCategoryModelCopyWith<$Res> {
  __$IncomeCategoryModelCopyWithImpl(this._self, this._then);

  final _IncomeCategoryModel _self;
  final $Res Function(_IncomeCategoryModel) _then;

  /// Create a copy of IncomeCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
    Object? iconName = null,
  }) {
    return _then(_IncomeCategoryModel(
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
mixin _$BuyerModel {
  String get id;
  String get name;
  String get contact;

  /// Create a copy of BuyerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuyerModelCopyWith<BuyerModel> get copyWith =>
      _$BuyerModelCopyWithImpl<BuyerModel>(this as BuyerModel, _$identity);

  /// Serializes this BuyerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuyerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, contact);

  @override
  String toString() {
    return 'BuyerModel(id: $id, name: $name, contact: $contact)';
  }
}

/// @nodoc
abstract mixin class $BuyerModelCopyWith<$Res> {
  factory $BuyerModelCopyWith(
          BuyerModel value, $Res Function(BuyerModel) _then) =
      _$BuyerModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, String contact});
}

/// @nodoc
class _$BuyerModelCopyWithImpl<$Res> implements $BuyerModelCopyWith<$Res> {
  _$BuyerModelCopyWithImpl(this._self, this._then);

  final BuyerModel _self;
  final $Res Function(BuyerModel) _then;

  /// Create a copy of BuyerModel
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

/// Adds pattern-matching-related methods to [BuyerModel].
extension BuyerModelPatterns on BuyerModel {
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
    TResult Function(_BuyerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BuyerModel() when $default != null:
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
    TResult Function(_BuyerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuyerModel():
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
    TResult? Function(_BuyerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BuyerModel() when $default != null:
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
      case _BuyerModel() when $default != null:
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
      case _BuyerModel():
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
      case _BuyerModel() when $default != null:
        return $default(_that.id, _that.name, _that.contact);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BuyerModel implements BuyerModel {
  const _BuyerModel(
      {required this.id, required this.name, required this.contact});
  factory _BuyerModel.fromJson(Map<String, dynamic> json) =>
      _$BuyerModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String contact;

  /// Create a copy of BuyerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuyerModelCopyWith<_BuyerModel> get copyWith =>
      __$BuyerModelCopyWithImpl<_BuyerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuyerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuyerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, contact);

  @override
  String toString() {
    return 'BuyerModel(id: $id, name: $name, contact: $contact)';
  }
}

/// @nodoc
abstract mixin class _$BuyerModelCopyWith<$Res>
    implements $BuyerModelCopyWith<$Res> {
  factory _$BuyerModelCopyWith(
          _BuyerModel value, $Res Function(_BuyerModel) _then) =
      __$BuyerModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String contact});
}

/// @nodoc
class __$BuyerModelCopyWithImpl<$Res> implements _$BuyerModelCopyWith<$Res> {
  __$BuyerModelCopyWithImpl(this._self, this._then);

  final _BuyerModel _self;
  final $Res Function(_BuyerModel) _then;

  /// Create a copy of BuyerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contact = null,
  }) {
    return _then(_BuyerModel(
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

// dart format on
