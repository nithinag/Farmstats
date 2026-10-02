// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinancialReportModel {
  double get totalIncome;
  double get totalExpenses;
  double get netProfit;
  Map<String, double> get expensesByCategory;
  Map<String, double> get incomeByBuyer;

  /// Create a copy of FinancialReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FinancialReportModelCopyWith<FinancialReportModel> get copyWith =>
      _$FinancialReportModelCopyWithImpl<FinancialReportModel>(
          this as FinancialReportModel, _$identity);

  /// Serializes this FinancialReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FinancialReportModel &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            const DeepCollectionEquality()
                .equals(other.expensesByCategory, expensesByCategory) &&
            const DeepCollectionEquality()
                .equals(other.incomeByBuyer, incomeByBuyer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalIncome,
      totalExpenses,
      netProfit,
      const DeepCollectionEquality().hash(expensesByCategory),
      const DeepCollectionEquality().hash(incomeByBuyer));

  @override
  String toString() {
    return 'FinancialReportModel(totalIncome: $totalIncome, totalExpenses: $totalExpenses, netProfit: $netProfit, expensesByCategory: $expensesByCategory, incomeByBuyer: $incomeByBuyer)';
  }
}

/// @nodoc
abstract mixin class $FinancialReportModelCopyWith<$Res> {
  factory $FinancialReportModelCopyWith(FinancialReportModel value,
          $Res Function(FinancialReportModel) _then) =
      _$FinancialReportModelCopyWithImpl;
  @useResult
  $Res call(
      {double totalIncome,
      double totalExpenses,
      double netProfit,
      Map<String, double> expensesByCategory,
      Map<String, double> incomeByBuyer});
}

/// @nodoc
class _$FinancialReportModelCopyWithImpl<$Res>
    implements $FinancialReportModelCopyWith<$Res> {
  _$FinancialReportModelCopyWithImpl(this._self, this._then);

  final FinancialReportModel _self;
  final $Res Function(FinancialReportModel) _then;

  /// Create a copy of FinancialReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
    Object? expensesByCategory = null,
    Object? incomeByBuyer = null,
  }) {
    return _then(_self.copyWith(
      totalIncome: null == totalIncome
          ? _self.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _self.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _self.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      expensesByCategory: null == expensesByCategory
          ? _self.expensesByCategory
          : expensesByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      incomeByBuyer: null == incomeByBuyer
          ? _self.incomeByBuyer
          : incomeByBuyer // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FinancialReportModel].
extension FinancialReportModelPatterns on FinancialReportModel {
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
    TResult Function(_FinancialReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel() when $default != null:
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
    TResult Function(_FinancialReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel():
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
    TResult? Function(_FinancialReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel() when $default != null:
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
            double totalIncome,
            double totalExpenses,
            double netProfit,
            Map<String, double> expensesByCategory,
            Map<String, double> incomeByBuyer)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel() when $default != null:
        return $default(_that.totalIncome, _that.totalExpenses, _that.netProfit,
            _that.expensesByCategory, _that.incomeByBuyer);
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
            double totalIncome,
            double totalExpenses,
            double netProfit,
            Map<String, double> expensesByCategory,
            Map<String, double> incomeByBuyer)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel():
        return $default(_that.totalIncome, _that.totalExpenses, _that.netProfit,
            _that.expensesByCategory, _that.incomeByBuyer);
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
            double totalIncome,
            double totalExpenses,
            double netProfit,
            Map<String, double> expensesByCategory,
            Map<String, double> incomeByBuyer)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReportModel() when $default != null:
        return $default(_that.totalIncome, _that.totalExpenses, _that.netProfit,
            _that.expensesByCategory, _that.incomeByBuyer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FinancialReportModel implements FinancialReportModel {
  const _FinancialReportModel(
      {required this.totalIncome,
      required this.totalExpenses,
      required this.netProfit,
      required final Map<String, double> expensesByCategory,
      required final Map<String, double> incomeByBuyer})
      : _expensesByCategory = expensesByCategory,
        _incomeByBuyer = incomeByBuyer;
  factory _FinancialReportModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialReportModelFromJson(json);

  @override
  final double totalIncome;
  @override
  final double totalExpenses;
  @override
  final double netProfit;
  final Map<String, double> _expensesByCategory;
  @override
  Map<String, double> get expensesByCategory {
    if (_expensesByCategory is EqualUnmodifiableMapView)
      return _expensesByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expensesByCategory);
  }

  final Map<String, double> _incomeByBuyer;
  @override
  Map<String, double> get incomeByBuyer {
    if (_incomeByBuyer is EqualUnmodifiableMapView) return _incomeByBuyer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_incomeByBuyer);
  }

  /// Create a copy of FinancialReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FinancialReportModelCopyWith<_FinancialReportModel> get copyWith =>
      __$FinancialReportModelCopyWithImpl<_FinancialReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FinancialReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FinancialReportModel &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            const DeepCollectionEquality()
                .equals(other._expensesByCategory, _expensesByCategory) &&
            const DeepCollectionEquality()
                .equals(other._incomeByBuyer, _incomeByBuyer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalIncome,
      totalExpenses,
      netProfit,
      const DeepCollectionEquality().hash(_expensesByCategory),
      const DeepCollectionEquality().hash(_incomeByBuyer));

  @override
  String toString() {
    return 'FinancialReportModel(totalIncome: $totalIncome, totalExpenses: $totalExpenses, netProfit: $netProfit, expensesByCategory: $expensesByCategory, incomeByBuyer: $incomeByBuyer)';
  }
}

/// @nodoc
abstract mixin class _$FinancialReportModelCopyWith<$Res>
    implements $FinancialReportModelCopyWith<$Res> {
  factory _$FinancialReportModelCopyWith(_FinancialReportModel value,
          $Res Function(_FinancialReportModel) _then) =
      __$FinancialReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalIncome,
      double totalExpenses,
      double netProfit,
      Map<String, double> expensesByCategory,
      Map<String, double> incomeByBuyer});
}

/// @nodoc
class __$FinancialReportModelCopyWithImpl<$Res>
    implements _$FinancialReportModelCopyWith<$Res> {
  __$FinancialReportModelCopyWithImpl(this._self, this._then);

  final _FinancialReportModel _self;
  final $Res Function(_FinancialReportModel) _then;

  /// Create a copy of FinancialReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalIncome = null,
    Object? totalExpenses = null,
    Object? netProfit = null,
    Object? expensesByCategory = null,
    Object? incomeByBuyer = null,
  }) {
    return _then(_FinancialReportModel(
      totalIncome: null == totalIncome
          ? _self.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpenses: null == totalExpenses
          ? _self.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
              as double,
      netProfit: null == netProfit
          ? _self.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      expensesByCategory: null == expensesByCategory
          ? _self._expensesByCategory
          : expensesByCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      incomeByBuyer: null == incomeByBuyer
          ? _self._incomeByBuyer
          : incomeByBuyer // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
mixin _$ProductionReportModel {
  double get averageYieldPercentage;
  double get averageSurvivalRate;
  double get totalGrossWeight;
  double get totalNetSaleableWeight;
  Map<String, double> get gradeDistribution;

  /// Create a copy of ProductionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionReportModelCopyWith<ProductionReportModel> get copyWith =>
      _$ProductionReportModelCopyWithImpl<ProductionReportModel>(
          this as ProductionReportModel, _$identity);

  /// Serializes this ProductionReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionReportModel &&
            (identical(other.averageYieldPercentage, averageYieldPercentage) ||
                other.averageYieldPercentage == averageYieldPercentage) &&
            (identical(other.averageSurvivalRate, averageSurvivalRate) ||
                other.averageSurvivalRate == averageSurvivalRate) &&
            (identical(other.totalGrossWeight, totalGrossWeight) ||
                other.totalGrossWeight == totalGrossWeight) &&
            (identical(other.totalNetSaleableWeight, totalNetSaleableWeight) ||
                other.totalNetSaleableWeight == totalNetSaleableWeight) &&
            const DeepCollectionEquality()
                .equals(other.gradeDistribution, gradeDistribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageYieldPercentage,
      averageSurvivalRate,
      totalGrossWeight,
      totalNetSaleableWeight,
      const DeepCollectionEquality().hash(gradeDistribution));

  @override
  String toString() {
    return 'ProductionReportModel(averageYieldPercentage: $averageYieldPercentage, averageSurvivalRate: $averageSurvivalRate, totalGrossWeight: $totalGrossWeight, totalNetSaleableWeight: $totalNetSaleableWeight, gradeDistribution: $gradeDistribution)';
  }
}

/// @nodoc
abstract mixin class $ProductionReportModelCopyWith<$Res> {
  factory $ProductionReportModelCopyWith(ProductionReportModel value,
          $Res Function(ProductionReportModel) _then) =
      _$ProductionReportModelCopyWithImpl;
  @useResult
  $Res call(
      {double averageYieldPercentage,
      double averageSurvivalRate,
      double totalGrossWeight,
      double totalNetSaleableWeight,
      Map<String, double> gradeDistribution});
}

/// @nodoc
class _$ProductionReportModelCopyWithImpl<$Res>
    implements $ProductionReportModelCopyWith<$Res> {
  _$ProductionReportModelCopyWithImpl(this._self, this._then);

  final ProductionReportModel _self;
  final $Res Function(ProductionReportModel) _then;

  /// Create a copy of ProductionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageYieldPercentage = null,
    Object? averageSurvivalRate = null,
    Object? totalGrossWeight = null,
    Object? totalNetSaleableWeight = null,
    Object? gradeDistribution = null,
  }) {
    return _then(_self.copyWith(
      averageYieldPercentage: null == averageYieldPercentage
          ? _self.averageYieldPercentage
          : averageYieldPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageSurvivalRate: null == averageSurvivalRate
          ? _self.averageSurvivalRate
          : averageSurvivalRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalGrossWeight: null == totalGrossWeight
          ? _self.totalGrossWeight
          : totalGrossWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalNetSaleableWeight: null == totalNetSaleableWeight
          ? _self.totalNetSaleableWeight
          : totalNetSaleableWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeDistribution: null == gradeDistribution
          ? _self.gradeDistribution
          : gradeDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductionReportModel].
extension ProductionReportModelPatterns on ProductionReportModel {
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
    TResult Function(_ProductionReportModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel() when $default != null:
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
    TResult Function(_ProductionReportModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel():
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
    TResult? Function(_ProductionReportModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel() when $default != null:
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
            double averageYieldPercentage,
            double averageSurvivalRate,
            double totalGrossWeight,
            double totalNetSaleableWeight,
            Map<String, double> gradeDistribution)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel() when $default != null:
        return $default(
            _that.averageYieldPercentage,
            _that.averageSurvivalRate,
            _that.totalGrossWeight,
            _that.totalNetSaleableWeight,
            _that.gradeDistribution);
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
            double averageYieldPercentage,
            double averageSurvivalRate,
            double totalGrossWeight,
            double totalNetSaleableWeight,
            Map<String, double> gradeDistribution)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel():
        return $default(
            _that.averageYieldPercentage,
            _that.averageSurvivalRate,
            _that.totalGrossWeight,
            _that.totalNetSaleableWeight,
            _that.gradeDistribution);
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
            double averageYieldPercentage,
            double averageSurvivalRate,
            double totalGrossWeight,
            double totalNetSaleableWeight,
            Map<String, double> gradeDistribution)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReportModel() when $default != null:
        return $default(
            _that.averageYieldPercentage,
            _that.averageSurvivalRate,
            _that.totalGrossWeight,
            _that.totalNetSaleableWeight,
            _that.gradeDistribution);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductionReportModel implements ProductionReportModel {
  const _ProductionReportModel(
      {required this.averageYieldPercentage,
      required this.averageSurvivalRate,
      required this.totalGrossWeight,
      required this.totalNetSaleableWeight,
      required final Map<String, double> gradeDistribution})
      : _gradeDistribution = gradeDistribution;
  factory _ProductionReportModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionReportModelFromJson(json);

  @override
  final double averageYieldPercentage;
  @override
  final double averageSurvivalRate;
  @override
  final double totalGrossWeight;
  @override
  final double totalNetSaleableWeight;
  final Map<String, double> _gradeDistribution;
  @override
  Map<String, double> get gradeDistribution {
    if (_gradeDistribution is EqualUnmodifiableMapView)
      return _gradeDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gradeDistribution);
  }

  /// Create a copy of ProductionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionReportModelCopyWith<_ProductionReportModel> get copyWith =>
      __$ProductionReportModelCopyWithImpl<_ProductionReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductionReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionReportModel &&
            (identical(other.averageYieldPercentage, averageYieldPercentage) ||
                other.averageYieldPercentage == averageYieldPercentage) &&
            (identical(other.averageSurvivalRate, averageSurvivalRate) ||
                other.averageSurvivalRate == averageSurvivalRate) &&
            (identical(other.totalGrossWeight, totalGrossWeight) ||
                other.totalGrossWeight == totalGrossWeight) &&
            (identical(other.totalNetSaleableWeight, totalNetSaleableWeight) ||
                other.totalNetSaleableWeight == totalNetSaleableWeight) &&
            const DeepCollectionEquality()
                .equals(other._gradeDistribution, _gradeDistribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      averageYieldPercentage,
      averageSurvivalRate,
      totalGrossWeight,
      totalNetSaleableWeight,
      const DeepCollectionEquality().hash(_gradeDistribution));

  @override
  String toString() {
    return 'ProductionReportModel(averageYieldPercentage: $averageYieldPercentage, averageSurvivalRate: $averageSurvivalRate, totalGrossWeight: $totalGrossWeight, totalNetSaleableWeight: $totalNetSaleableWeight, gradeDistribution: $gradeDistribution)';
  }
}

/// @nodoc
abstract mixin class _$ProductionReportModelCopyWith<$Res>
    implements $ProductionReportModelCopyWith<$Res> {
  factory _$ProductionReportModelCopyWith(_ProductionReportModel value,
          $Res Function(_ProductionReportModel) _then) =
      __$ProductionReportModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double averageYieldPercentage,
      double averageSurvivalRate,
      double totalGrossWeight,
      double totalNetSaleableWeight,
      Map<String, double> gradeDistribution});
}

/// @nodoc
class __$ProductionReportModelCopyWithImpl<$Res>
    implements _$ProductionReportModelCopyWith<$Res> {
  __$ProductionReportModelCopyWithImpl(this._self, this._then);

  final _ProductionReportModel _self;
  final $Res Function(_ProductionReportModel) _then;

  /// Create a copy of ProductionReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? averageYieldPercentage = null,
    Object? averageSurvivalRate = null,
    Object? totalGrossWeight = null,
    Object? totalNetSaleableWeight = null,
    Object? gradeDistribution = null,
  }) {
    return _then(_ProductionReportModel(
      averageYieldPercentage: null == averageYieldPercentage
          ? _self.averageYieldPercentage
          : averageYieldPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageSurvivalRate: null == averageSurvivalRate
          ? _self.averageSurvivalRate
          : averageSurvivalRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalGrossWeight: null == totalGrossWeight
          ? _self.totalGrossWeight
          : totalGrossWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalNetSaleableWeight: null == totalNetSaleableWeight
          ? _self.totalNetSaleableWeight
          : totalNetSaleableWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeDistribution: null == gradeDistribution
          ? _self._gradeDistribution
          : gradeDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

// dart format on
