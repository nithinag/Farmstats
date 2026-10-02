// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinancialReport {
  double get totalIncome;
  double get totalExpenses;
  double get netProfit;
  Map<String, double> get expensesByCategory;
  Map<String, double> get incomeByBuyer;

  /// Create a copy of FinancialReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FinancialReportCopyWith<FinancialReport> get copyWith =>
      _$FinancialReportCopyWithImpl<FinancialReport>(
          this as FinancialReport, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FinancialReport &&
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
    return 'FinancialReport(totalIncome: $totalIncome, totalExpenses: $totalExpenses, netProfit: $netProfit, expensesByCategory: $expensesByCategory, incomeByBuyer: $incomeByBuyer)';
  }
}

/// @nodoc
abstract mixin class $FinancialReportCopyWith<$Res> {
  factory $FinancialReportCopyWith(
          FinancialReport value, $Res Function(FinancialReport) _then) =
      _$FinancialReportCopyWithImpl;
  @useResult
  $Res call(
      {double totalIncome,
      double totalExpenses,
      double netProfit,
      Map<String, double> expensesByCategory,
      Map<String, double> incomeByBuyer});
}

/// @nodoc
class _$FinancialReportCopyWithImpl<$Res>
    implements $FinancialReportCopyWith<$Res> {
  _$FinancialReportCopyWithImpl(this._self, this._then);

  final FinancialReport _self;
  final $Res Function(FinancialReport) _then;

  /// Create a copy of FinancialReport
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

/// Adds pattern-matching-related methods to [FinancialReport].
extension FinancialReportPatterns on FinancialReport {
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
    TResult Function(_FinancialReport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FinancialReport() when $default != null:
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
    TResult Function(_FinancialReport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReport():
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
    TResult? Function(_FinancialReport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FinancialReport() when $default != null:
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
      case _FinancialReport() when $default != null:
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
      case _FinancialReport():
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
      case _FinancialReport() when $default != null:
        return $default(_that.totalIncome, _that.totalExpenses, _that.netProfit,
            _that.expensesByCategory, _that.incomeByBuyer);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FinancialReport implements FinancialReport {
  const _FinancialReport(
      {required this.totalIncome,
      required this.totalExpenses,
      required this.netProfit,
      required final Map<String, double> expensesByCategory,
      required final Map<String, double> incomeByBuyer})
      : _expensesByCategory = expensesByCategory,
        _incomeByBuyer = incomeByBuyer;

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

  /// Create a copy of FinancialReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FinancialReportCopyWith<_FinancialReport> get copyWith =>
      __$FinancialReportCopyWithImpl<_FinancialReport>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FinancialReport &&
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
    return 'FinancialReport(totalIncome: $totalIncome, totalExpenses: $totalExpenses, netProfit: $netProfit, expensesByCategory: $expensesByCategory, incomeByBuyer: $incomeByBuyer)';
  }
}

/// @nodoc
abstract mixin class _$FinancialReportCopyWith<$Res>
    implements $FinancialReportCopyWith<$Res> {
  factory _$FinancialReportCopyWith(
          _FinancialReport value, $Res Function(_FinancialReport) _then) =
      __$FinancialReportCopyWithImpl;
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
class __$FinancialReportCopyWithImpl<$Res>
    implements _$FinancialReportCopyWith<$Res> {
  __$FinancialReportCopyWithImpl(this._self, this._then);

  final _FinancialReport _self;
  final $Res Function(_FinancialReport) _then;

  /// Create a copy of FinancialReport
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
    return _then(_FinancialReport(
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
mixin _$ProductionReport {
  double get averageYieldPercentage;
  double get averageSurvivalRate;
  double get totalGrossWeight;
  double get totalNetSaleableWeight;
  Map<String, double> get gradeDistribution;

  /// Create a copy of ProductionReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionReportCopyWith<ProductionReport> get copyWith =>
      _$ProductionReportCopyWithImpl<ProductionReport>(
          this as ProductionReport, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionReport &&
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
    return 'ProductionReport(averageYieldPercentage: $averageYieldPercentage, averageSurvivalRate: $averageSurvivalRate, totalGrossWeight: $totalGrossWeight, totalNetSaleableWeight: $totalNetSaleableWeight, gradeDistribution: $gradeDistribution)';
  }
}

/// @nodoc
abstract mixin class $ProductionReportCopyWith<$Res> {
  factory $ProductionReportCopyWith(
          ProductionReport value, $Res Function(ProductionReport) _then) =
      _$ProductionReportCopyWithImpl;
  @useResult
  $Res call(
      {double averageYieldPercentage,
      double averageSurvivalRate,
      double totalGrossWeight,
      double totalNetSaleableWeight,
      Map<String, double> gradeDistribution});
}

/// @nodoc
class _$ProductionReportCopyWithImpl<$Res>
    implements $ProductionReportCopyWith<$Res> {
  _$ProductionReportCopyWithImpl(this._self, this._then);

  final ProductionReport _self;
  final $Res Function(ProductionReport) _then;

  /// Create a copy of ProductionReport
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

/// Adds pattern-matching-related methods to [ProductionReport].
extension ProductionReportPatterns on ProductionReport {
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
    TResult Function(_ProductionReport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionReport() when $default != null:
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
    TResult Function(_ProductionReport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReport():
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
    TResult? Function(_ProductionReport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionReport() when $default != null:
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
      case _ProductionReport() when $default != null:
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
      case _ProductionReport():
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
      case _ProductionReport() when $default != null:
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

class _ProductionReport implements ProductionReport {
  const _ProductionReport(
      {required this.averageYieldPercentage,
      required this.averageSurvivalRate,
      required this.totalGrossWeight,
      required this.totalNetSaleableWeight,
      required final Map<String, double> gradeDistribution})
      : _gradeDistribution = gradeDistribution;

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

  /// Create a copy of ProductionReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionReportCopyWith<_ProductionReport> get copyWith =>
      __$ProductionReportCopyWithImpl<_ProductionReport>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionReport &&
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
    return 'ProductionReport(averageYieldPercentage: $averageYieldPercentage, averageSurvivalRate: $averageSurvivalRate, totalGrossWeight: $totalGrossWeight, totalNetSaleableWeight: $totalNetSaleableWeight, gradeDistribution: $gradeDistribution)';
  }
}

/// @nodoc
abstract mixin class _$ProductionReportCopyWith<$Res>
    implements $ProductionReportCopyWith<$Res> {
  factory _$ProductionReportCopyWith(
          _ProductionReport value, $Res Function(_ProductionReport) _then) =
      __$ProductionReportCopyWithImpl;
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
class __$ProductionReportCopyWithImpl<$Res>
    implements _$ProductionReportCopyWith<$Res> {
  __$ProductionReportCopyWithImpl(this._self, this._then);

  final _ProductionReport _self;
  final $Res Function(_ProductionReport) _then;

  /// Create a copy of ProductionReport
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
    return _then(_ProductionReport(
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
