// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'harvest_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CocoonGrade {
  double get gradeAWeight;
  double get gradeBWeight;
  double get gradeCWeight;
  double get rejectedWeight;

  /// Create a copy of CocoonGrade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CocoonGradeCopyWith<CocoonGrade> get copyWith =>
      _$CocoonGradeCopyWithImpl<CocoonGrade>(this as CocoonGrade, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CocoonGrade &&
            (identical(other.gradeAWeight, gradeAWeight) ||
                other.gradeAWeight == gradeAWeight) &&
            (identical(other.gradeBWeight, gradeBWeight) ||
                other.gradeBWeight == gradeBWeight) &&
            (identical(other.gradeCWeight, gradeCWeight) ||
                other.gradeCWeight == gradeCWeight) &&
            (identical(other.rejectedWeight, rejectedWeight) ||
                other.rejectedWeight == rejectedWeight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, gradeAWeight, gradeBWeight, gradeCWeight, rejectedWeight);

  @override
  String toString() {
    return 'CocoonGrade(gradeAWeight: $gradeAWeight, gradeBWeight: $gradeBWeight, gradeCWeight: $gradeCWeight, rejectedWeight: $rejectedWeight)';
  }
}

/// @nodoc
abstract mixin class $CocoonGradeCopyWith<$Res> {
  factory $CocoonGradeCopyWith(
          CocoonGrade value, $Res Function(CocoonGrade) _then) =
      _$CocoonGradeCopyWithImpl;
  @useResult
  $Res call(
      {double gradeAWeight,
      double gradeBWeight,
      double gradeCWeight,
      double rejectedWeight});
}

/// @nodoc
class _$CocoonGradeCopyWithImpl<$Res> implements $CocoonGradeCopyWith<$Res> {
  _$CocoonGradeCopyWithImpl(this._self, this._then);

  final CocoonGrade _self;
  final $Res Function(CocoonGrade) _then;

  /// Create a copy of CocoonGrade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradeAWeight = null,
    Object? gradeBWeight = null,
    Object? gradeCWeight = null,
    Object? rejectedWeight = null,
  }) {
    return _then(_self.copyWith(
      gradeAWeight: null == gradeAWeight
          ? _self.gradeAWeight
          : gradeAWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeBWeight: null == gradeBWeight
          ? _self.gradeBWeight
          : gradeBWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeCWeight: null == gradeCWeight
          ? _self.gradeCWeight
          : gradeCWeight // ignore: cast_nullable_to_non_nullable
              as double,
      rejectedWeight: null == rejectedWeight
          ? _self.rejectedWeight
          : rejectedWeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CocoonGrade].
extension CocoonGradePatterns on CocoonGrade {
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
    TResult Function(_CocoonGrade value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade() when $default != null:
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
    TResult Function(_CocoonGrade value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade():
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
    TResult? Function(_CocoonGrade value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade() when $default != null:
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
    TResult Function(double gradeAWeight, double gradeBWeight,
            double gradeCWeight, double rejectedWeight)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade() when $default != null:
        return $default(_that.gradeAWeight, _that.gradeBWeight,
            _that.gradeCWeight, _that.rejectedWeight);
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
    TResult Function(double gradeAWeight, double gradeBWeight,
            double gradeCWeight, double rejectedWeight)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade():
        return $default(_that.gradeAWeight, _that.gradeBWeight,
            _that.gradeCWeight, _that.rejectedWeight);
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
    TResult? Function(double gradeAWeight, double gradeBWeight,
            double gradeCWeight, double rejectedWeight)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CocoonGrade() when $default != null:
        return $default(_that.gradeAWeight, _that.gradeBWeight,
            _that.gradeCWeight, _that.rejectedWeight);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CocoonGrade implements CocoonGrade {
  const _CocoonGrade(
      {required this.gradeAWeight,
      required this.gradeBWeight,
      required this.gradeCWeight,
      required this.rejectedWeight});

  @override
  final double gradeAWeight;
  @override
  final double gradeBWeight;
  @override
  final double gradeCWeight;
  @override
  final double rejectedWeight;

  /// Create a copy of CocoonGrade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CocoonGradeCopyWith<_CocoonGrade> get copyWith =>
      __$CocoonGradeCopyWithImpl<_CocoonGrade>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CocoonGrade &&
            (identical(other.gradeAWeight, gradeAWeight) ||
                other.gradeAWeight == gradeAWeight) &&
            (identical(other.gradeBWeight, gradeBWeight) ||
                other.gradeBWeight == gradeBWeight) &&
            (identical(other.gradeCWeight, gradeCWeight) ||
                other.gradeCWeight == gradeCWeight) &&
            (identical(other.rejectedWeight, rejectedWeight) ||
                other.rejectedWeight == rejectedWeight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, gradeAWeight, gradeBWeight, gradeCWeight, rejectedWeight);

  @override
  String toString() {
    return 'CocoonGrade(gradeAWeight: $gradeAWeight, gradeBWeight: $gradeBWeight, gradeCWeight: $gradeCWeight, rejectedWeight: $rejectedWeight)';
  }
}

/// @nodoc
abstract mixin class _$CocoonGradeCopyWith<$Res>
    implements $CocoonGradeCopyWith<$Res> {
  factory _$CocoonGradeCopyWith(
          _CocoonGrade value, $Res Function(_CocoonGrade) _then) =
      __$CocoonGradeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double gradeAWeight,
      double gradeBWeight,
      double gradeCWeight,
      double rejectedWeight});
}

/// @nodoc
class __$CocoonGradeCopyWithImpl<$Res> implements _$CocoonGradeCopyWith<$Res> {
  __$CocoonGradeCopyWithImpl(this._self, this._then);

  final _CocoonGrade _self;
  final $Res Function(_CocoonGrade) _then;

  /// Create a copy of CocoonGrade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gradeAWeight = null,
    Object? gradeBWeight = null,
    Object? gradeCWeight = null,
    Object? rejectedWeight = null,
  }) {
    return _then(_CocoonGrade(
      gradeAWeight: null == gradeAWeight
          ? _self.gradeAWeight
          : gradeAWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeBWeight: null == gradeBWeight
          ? _self.gradeBWeight
          : gradeBWeight // ignore: cast_nullable_to_non_nullable
              as double,
      gradeCWeight: null == gradeCWeight
          ? _self.gradeCWeight
          : gradeCWeight // ignore: cast_nullable_to_non_nullable
              as double,
      rejectedWeight: null == rejectedWeight
          ? _self.rejectedWeight
          : rejectedWeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$ProductionMetrics {
  double get yieldPercentage;
  double get survivalRate;
  double get feedConversionRatio;
  double get mortalityPercentage;
  double get harvestEfficiency;

  /// Create a copy of ProductionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionMetricsCopyWith<ProductionMetrics> get copyWith =>
      _$ProductionMetricsCopyWithImpl<ProductionMetrics>(
          this as ProductionMetrics, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionMetrics &&
            (identical(other.yieldPercentage, yieldPercentage) ||
                other.yieldPercentage == yieldPercentage) &&
            (identical(other.survivalRate, survivalRate) ||
                other.survivalRate == survivalRate) &&
            (identical(other.feedConversionRatio, feedConversionRatio) ||
                other.feedConversionRatio == feedConversionRatio) &&
            (identical(other.mortalityPercentage, mortalityPercentage) ||
                other.mortalityPercentage == mortalityPercentage) &&
            (identical(other.harvestEfficiency, harvestEfficiency) ||
                other.harvestEfficiency == harvestEfficiency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, yieldPercentage, survivalRate,
      feedConversionRatio, mortalityPercentage, harvestEfficiency);

  @override
  String toString() {
    return 'ProductionMetrics(yieldPercentage: $yieldPercentage, survivalRate: $survivalRate, feedConversionRatio: $feedConversionRatio, mortalityPercentage: $mortalityPercentage, harvestEfficiency: $harvestEfficiency)';
  }
}

/// @nodoc
abstract mixin class $ProductionMetricsCopyWith<$Res> {
  factory $ProductionMetricsCopyWith(
          ProductionMetrics value, $Res Function(ProductionMetrics) _then) =
      _$ProductionMetricsCopyWithImpl;
  @useResult
  $Res call(
      {double yieldPercentage,
      double survivalRate,
      double feedConversionRatio,
      double mortalityPercentage,
      double harvestEfficiency});
}

/// @nodoc
class _$ProductionMetricsCopyWithImpl<$Res>
    implements $ProductionMetricsCopyWith<$Res> {
  _$ProductionMetricsCopyWithImpl(this._self, this._then);

  final ProductionMetrics _self;
  final $Res Function(ProductionMetrics) _then;

  /// Create a copy of ProductionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yieldPercentage = null,
    Object? survivalRate = null,
    Object? feedConversionRatio = null,
    Object? mortalityPercentage = null,
    Object? harvestEfficiency = null,
  }) {
    return _then(_self.copyWith(
      yieldPercentage: null == yieldPercentage
          ? _self.yieldPercentage
          : yieldPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      survivalRate: null == survivalRate
          ? _self.survivalRate
          : survivalRate // ignore: cast_nullable_to_non_nullable
              as double,
      feedConversionRatio: null == feedConversionRatio
          ? _self.feedConversionRatio
          : feedConversionRatio // ignore: cast_nullable_to_non_nullable
              as double,
      mortalityPercentage: null == mortalityPercentage
          ? _self.mortalityPercentage
          : mortalityPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      harvestEfficiency: null == harvestEfficiency
          ? _self.harvestEfficiency
          : harvestEfficiency // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductionMetrics].
extension ProductionMetricsPatterns on ProductionMetrics {
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
    TResult Function(_ProductionMetrics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics() when $default != null:
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
    TResult Function(_ProductionMetrics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics():
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
    TResult? Function(_ProductionMetrics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics() when $default != null:
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
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics() when $default != null:
        return $default(
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency);
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
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics():
        return $default(
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency);
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
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionMetrics() when $default != null:
        return $default(
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductionMetrics implements ProductionMetrics {
  const _ProductionMetrics(
      {required this.yieldPercentage,
      required this.survivalRate,
      required this.feedConversionRatio,
      required this.mortalityPercentage,
      required this.harvestEfficiency});

  @override
  final double yieldPercentage;
  @override
  final double survivalRate;
  @override
  final double feedConversionRatio;
  @override
  final double mortalityPercentage;
  @override
  final double harvestEfficiency;

  /// Create a copy of ProductionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionMetricsCopyWith<_ProductionMetrics> get copyWith =>
      __$ProductionMetricsCopyWithImpl<_ProductionMetrics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionMetrics &&
            (identical(other.yieldPercentage, yieldPercentage) ||
                other.yieldPercentage == yieldPercentage) &&
            (identical(other.survivalRate, survivalRate) ||
                other.survivalRate == survivalRate) &&
            (identical(other.feedConversionRatio, feedConversionRatio) ||
                other.feedConversionRatio == feedConversionRatio) &&
            (identical(other.mortalityPercentage, mortalityPercentage) ||
                other.mortalityPercentage == mortalityPercentage) &&
            (identical(other.harvestEfficiency, harvestEfficiency) ||
                other.harvestEfficiency == harvestEfficiency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, yieldPercentage, survivalRate,
      feedConversionRatio, mortalityPercentage, harvestEfficiency);

  @override
  String toString() {
    return 'ProductionMetrics(yieldPercentage: $yieldPercentage, survivalRate: $survivalRate, feedConversionRatio: $feedConversionRatio, mortalityPercentage: $mortalityPercentage, harvestEfficiency: $harvestEfficiency)';
  }
}

/// @nodoc
abstract mixin class _$ProductionMetricsCopyWith<$Res>
    implements $ProductionMetricsCopyWith<$Res> {
  factory _$ProductionMetricsCopyWith(
          _ProductionMetrics value, $Res Function(_ProductionMetrics) _then) =
      __$ProductionMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double yieldPercentage,
      double survivalRate,
      double feedConversionRatio,
      double mortalityPercentage,
      double harvestEfficiency});
}

/// @nodoc
class __$ProductionMetricsCopyWithImpl<$Res>
    implements _$ProductionMetricsCopyWith<$Res> {
  __$ProductionMetricsCopyWithImpl(this._self, this._then);

  final _ProductionMetrics _self;
  final $Res Function(_ProductionMetrics) _then;

  /// Create a copy of ProductionMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? yieldPercentage = null,
    Object? survivalRate = null,
    Object? feedConversionRatio = null,
    Object? mortalityPercentage = null,
    Object? harvestEfficiency = null,
  }) {
    return _then(_ProductionMetrics(
      yieldPercentage: null == yieldPercentage
          ? _self.yieldPercentage
          : yieldPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      survivalRate: null == survivalRate
          ? _self.survivalRate
          : survivalRate // ignore: cast_nullable_to_non_nullable
              as double,
      feedConversionRatio: null == feedConversionRatio
          ? _self.feedConversionRatio
          : feedConversionRatio // ignore: cast_nullable_to_non_nullable
              as double,
      mortalityPercentage: null == mortalityPercentage
          ? _self.mortalityPercentage
          : mortalityPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      harvestEfficiency: null == harvestEfficiency
          ? _self.harvestEfficiency
          : harvestEfficiency // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$HarvestRecord {
  String get id;
  String get batchId;
  DateTime get harvestDate;
  double get actualHarvestDuration; // in hours
  double get grossWeight;
  double get netSaleableWeight;
  double get rejectedWeight;
  double get moisturePercentage;
  double get wastePercentage;
  double get averageCocoonSize;
  CocoonGrade get gradeDistribution;
  ProductionMetrics get metrics;
  String? get harvestedBy; // worker ID
  String? get remarks;

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HarvestRecordCopyWith<HarvestRecord> get copyWith =>
      _$HarvestRecordCopyWithImpl<HarvestRecord>(
          this as HarvestRecord, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HarvestRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.harvestDate, harvestDate) ||
                other.harvestDate == harvestDate) &&
            (identical(other.actualHarvestDuration, actualHarvestDuration) ||
                other.actualHarvestDuration == actualHarvestDuration) &&
            (identical(other.grossWeight, grossWeight) ||
                other.grossWeight == grossWeight) &&
            (identical(other.netSaleableWeight, netSaleableWeight) ||
                other.netSaleableWeight == netSaleableWeight) &&
            (identical(other.rejectedWeight, rejectedWeight) ||
                other.rejectedWeight == rejectedWeight) &&
            (identical(other.moisturePercentage, moisturePercentage) ||
                other.moisturePercentage == moisturePercentage) &&
            (identical(other.wastePercentage, wastePercentage) ||
                other.wastePercentage == wastePercentage) &&
            (identical(other.averageCocoonSize, averageCocoonSize) ||
                other.averageCocoonSize == averageCocoonSize) &&
            (identical(other.gradeDistribution, gradeDistribution) ||
                other.gradeDistribution == gradeDistribution) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            (identical(other.harvestedBy, harvestedBy) ||
                other.harvestedBy == harvestedBy) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      harvestDate,
      actualHarvestDuration,
      grossWeight,
      netSaleableWeight,
      rejectedWeight,
      moisturePercentage,
      wastePercentage,
      averageCocoonSize,
      gradeDistribution,
      metrics,
      harvestedBy,
      remarks);

  @override
  String toString() {
    return 'HarvestRecord(id: $id, batchId: $batchId, harvestDate: $harvestDate, actualHarvestDuration: $actualHarvestDuration, grossWeight: $grossWeight, netSaleableWeight: $netSaleableWeight, rejectedWeight: $rejectedWeight, moisturePercentage: $moisturePercentage, wastePercentage: $wastePercentage, averageCocoonSize: $averageCocoonSize, gradeDistribution: $gradeDistribution, metrics: $metrics, harvestedBy: $harvestedBy, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $HarvestRecordCopyWith<$Res> {
  factory $HarvestRecordCopyWith(
          HarvestRecord value, $Res Function(HarvestRecord) _then) =
      _$HarvestRecordCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime harvestDate,
      double actualHarvestDuration,
      double grossWeight,
      double netSaleableWeight,
      double rejectedWeight,
      double moisturePercentage,
      double wastePercentage,
      double averageCocoonSize,
      CocoonGrade gradeDistribution,
      ProductionMetrics metrics,
      String? harvestedBy,
      String? remarks});

  $CocoonGradeCopyWith<$Res> get gradeDistribution;
  $ProductionMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$HarvestRecordCopyWithImpl<$Res>
    implements $HarvestRecordCopyWith<$Res> {
  _$HarvestRecordCopyWithImpl(this._self, this._then);

  final HarvestRecord _self;
  final $Res Function(HarvestRecord) _then;

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? harvestDate = null,
    Object? actualHarvestDuration = null,
    Object? grossWeight = null,
    Object? netSaleableWeight = null,
    Object? rejectedWeight = null,
    Object? moisturePercentage = null,
    Object? wastePercentage = null,
    Object? averageCocoonSize = null,
    Object? gradeDistribution = null,
    Object? metrics = null,
    Object? harvestedBy = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      harvestDate: null == harvestDate
          ? _self.harvestDate
          : harvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualHarvestDuration: null == actualHarvestDuration
          ? _self.actualHarvestDuration
          : actualHarvestDuration // ignore: cast_nullable_to_non_nullable
              as double,
      grossWeight: null == grossWeight
          ? _self.grossWeight
          : grossWeight // ignore: cast_nullable_to_non_nullable
              as double,
      netSaleableWeight: null == netSaleableWeight
          ? _self.netSaleableWeight
          : netSaleableWeight // ignore: cast_nullable_to_non_nullable
              as double,
      rejectedWeight: null == rejectedWeight
          ? _self.rejectedWeight
          : rejectedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      moisturePercentage: null == moisturePercentage
          ? _self.moisturePercentage
          : moisturePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      wastePercentage: null == wastePercentage
          ? _self.wastePercentage
          : wastePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageCocoonSize: null == averageCocoonSize
          ? _self.averageCocoonSize
          : averageCocoonSize // ignore: cast_nullable_to_non_nullable
              as double,
      gradeDistribution: null == gradeDistribution
          ? _self.gradeDistribution
          : gradeDistribution // ignore: cast_nullable_to_non_nullable
              as CocoonGrade,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as ProductionMetrics,
      harvestedBy: freezed == harvestedBy
          ? _self.harvestedBy
          : harvestedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CocoonGradeCopyWith<$Res> get gradeDistribution {
    return $CocoonGradeCopyWith<$Res>(_self.gradeDistribution, (value) {
      return _then(_self.copyWith(gradeDistribution: value));
    });
  }

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionMetricsCopyWith<$Res> get metrics {
    return $ProductionMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HarvestRecord].
extension HarvestRecordPatterns on HarvestRecord {
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
    TResult Function(_HarvestRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord() when $default != null:
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
    TResult Function(_HarvestRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord():
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
    TResult? Function(_HarvestRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord() when $default != null:
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
            String batchId,
            DateTime harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            CocoonGrade gradeDistribution,
            ProductionMetrics metrics,
            String? harvestedBy,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.harvestDate,
            _that.actualHarvestDuration,
            _that.grossWeight,
            _that.netSaleableWeight,
            _that.rejectedWeight,
            _that.moisturePercentage,
            _that.wastePercentage,
            _that.averageCocoonSize,
            _that.gradeDistribution,
            _that.metrics,
            _that.harvestedBy,
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
            String batchId,
            DateTime harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            CocoonGrade gradeDistribution,
            ProductionMetrics metrics,
            String? harvestedBy,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord():
        return $default(
            _that.id,
            _that.batchId,
            _that.harvestDate,
            _that.actualHarvestDuration,
            _that.grossWeight,
            _that.netSaleableWeight,
            _that.rejectedWeight,
            _that.moisturePercentage,
            _that.wastePercentage,
            _that.averageCocoonSize,
            _that.gradeDistribution,
            _that.metrics,
            _that.harvestedBy,
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
            String batchId,
            DateTime harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            CocoonGrade gradeDistribution,
            ProductionMetrics metrics,
            String? harvestedBy,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecord() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.harvestDate,
            _that.actualHarvestDuration,
            _that.grossWeight,
            _that.netSaleableWeight,
            _that.rejectedWeight,
            _that.moisturePercentage,
            _that.wastePercentage,
            _that.averageCocoonSize,
            _that.gradeDistribution,
            _that.metrics,
            _that.harvestedBy,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HarvestRecord implements HarvestRecord {
  const _HarvestRecord(
      {required this.id,
      required this.batchId,
      required this.harvestDate,
      required this.actualHarvestDuration,
      required this.grossWeight,
      required this.netSaleableWeight,
      required this.rejectedWeight,
      required this.moisturePercentage,
      required this.wastePercentage,
      required this.averageCocoonSize,
      required this.gradeDistribution,
      required this.metrics,
      this.harvestedBy,
      this.remarks});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime harvestDate;
  @override
  final double actualHarvestDuration;
// in hours
  @override
  final double grossWeight;
  @override
  final double netSaleableWeight;
  @override
  final double rejectedWeight;
  @override
  final double moisturePercentage;
  @override
  final double wastePercentage;
  @override
  final double averageCocoonSize;
  @override
  final CocoonGrade gradeDistribution;
  @override
  final ProductionMetrics metrics;
  @override
  final String? harvestedBy;
// worker ID
  @override
  final String? remarks;

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HarvestRecordCopyWith<_HarvestRecord> get copyWith =>
      __$HarvestRecordCopyWithImpl<_HarvestRecord>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HarvestRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.harvestDate, harvestDate) ||
                other.harvestDate == harvestDate) &&
            (identical(other.actualHarvestDuration, actualHarvestDuration) ||
                other.actualHarvestDuration == actualHarvestDuration) &&
            (identical(other.grossWeight, grossWeight) ||
                other.grossWeight == grossWeight) &&
            (identical(other.netSaleableWeight, netSaleableWeight) ||
                other.netSaleableWeight == netSaleableWeight) &&
            (identical(other.rejectedWeight, rejectedWeight) ||
                other.rejectedWeight == rejectedWeight) &&
            (identical(other.moisturePercentage, moisturePercentage) ||
                other.moisturePercentage == moisturePercentage) &&
            (identical(other.wastePercentage, wastePercentage) ||
                other.wastePercentage == wastePercentage) &&
            (identical(other.averageCocoonSize, averageCocoonSize) ||
                other.averageCocoonSize == averageCocoonSize) &&
            (identical(other.gradeDistribution, gradeDistribution) ||
                other.gradeDistribution == gradeDistribution) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            (identical(other.harvestedBy, harvestedBy) ||
                other.harvestedBy == harvestedBy) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchId,
      harvestDate,
      actualHarvestDuration,
      grossWeight,
      netSaleableWeight,
      rejectedWeight,
      moisturePercentage,
      wastePercentage,
      averageCocoonSize,
      gradeDistribution,
      metrics,
      harvestedBy,
      remarks);

  @override
  String toString() {
    return 'HarvestRecord(id: $id, batchId: $batchId, harvestDate: $harvestDate, actualHarvestDuration: $actualHarvestDuration, grossWeight: $grossWeight, netSaleableWeight: $netSaleableWeight, rejectedWeight: $rejectedWeight, moisturePercentage: $moisturePercentage, wastePercentage: $wastePercentage, averageCocoonSize: $averageCocoonSize, gradeDistribution: $gradeDistribution, metrics: $metrics, harvestedBy: $harvestedBy, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$HarvestRecordCopyWith<$Res>
    implements $HarvestRecordCopyWith<$Res> {
  factory _$HarvestRecordCopyWith(
          _HarvestRecord value, $Res Function(_HarvestRecord) _then) =
      __$HarvestRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime harvestDate,
      double actualHarvestDuration,
      double grossWeight,
      double netSaleableWeight,
      double rejectedWeight,
      double moisturePercentage,
      double wastePercentage,
      double averageCocoonSize,
      CocoonGrade gradeDistribution,
      ProductionMetrics metrics,
      String? harvestedBy,
      String? remarks});

  @override
  $CocoonGradeCopyWith<$Res> get gradeDistribution;
  @override
  $ProductionMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$HarvestRecordCopyWithImpl<$Res>
    implements _$HarvestRecordCopyWith<$Res> {
  __$HarvestRecordCopyWithImpl(this._self, this._then);

  final _HarvestRecord _self;
  final $Res Function(_HarvestRecord) _then;

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? harvestDate = null,
    Object? actualHarvestDuration = null,
    Object? grossWeight = null,
    Object? netSaleableWeight = null,
    Object? rejectedWeight = null,
    Object? moisturePercentage = null,
    Object? wastePercentage = null,
    Object? averageCocoonSize = null,
    Object? gradeDistribution = null,
    Object? metrics = null,
    Object? harvestedBy = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_HarvestRecord(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      harvestDate: null == harvestDate
          ? _self.harvestDate
          : harvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualHarvestDuration: null == actualHarvestDuration
          ? _self.actualHarvestDuration
          : actualHarvestDuration // ignore: cast_nullable_to_non_nullable
              as double,
      grossWeight: null == grossWeight
          ? _self.grossWeight
          : grossWeight // ignore: cast_nullable_to_non_nullable
              as double,
      netSaleableWeight: null == netSaleableWeight
          ? _self.netSaleableWeight
          : netSaleableWeight // ignore: cast_nullable_to_non_nullable
              as double,
      rejectedWeight: null == rejectedWeight
          ? _self.rejectedWeight
          : rejectedWeight // ignore: cast_nullable_to_non_nullable
              as double,
      moisturePercentage: null == moisturePercentage
          ? _self.moisturePercentage
          : moisturePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      wastePercentage: null == wastePercentage
          ? _self.wastePercentage
          : wastePercentage // ignore: cast_nullable_to_non_nullable
              as double,
      averageCocoonSize: null == averageCocoonSize
          ? _self.averageCocoonSize
          : averageCocoonSize // ignore: cast_nullable_to_non_nullable
              as double,
      gradeDistribution: null == gradeDistribution
          ? _self.gradeDistribution
          : gradeDistribution // ignore: cast_nullable_to_non_nullable
              as CocoonGrade,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as ProductionMetrics,
      harvestedBy: freezed == harvestedBy
          ? _self.harvestedBy
          : harvestedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CocoonGradeCopyWith<$Res> get gradeDistribution {
    return $CocoonGradeCopyWith<$Res>(_self.gradeDistribution, (value) {
      return _then(_self.copyWith(gradeDistribution: value));
    });
  }

  /// Create a copy of HarvestRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionMetricsCopyWith<$Res> get metrics {
    return $ProductionMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }
}

// dart format on
