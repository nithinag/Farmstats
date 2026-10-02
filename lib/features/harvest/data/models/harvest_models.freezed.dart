// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'harvest_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HarvestRecordModel {
  String get id;
  String get batchId;
  String get harvestDate;
  double get actualHarvestDuration;
  double get grossWeight;
  double get netSaleableWeight;
  double get rejectedWeight;
  double get moisturePercentage;
  double get wastePercentage;
  double get averageCocoonSize;
  double get gradeAWeight;
  double get gradeBWeight;
  double get gradeCWeight;
  double get yieldPercentage;
  double get survivalRate;
  double get feedConversionRatio;
  double get mortalityPercentage;
  double get harvestEfficiency;
  String? get harvestedBy;
  String? get remarks;

  /// Create a copy of HarvestRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HarvestRecordModelCopyWith<HarvestRecordModel> get copyWith =>
      _$HarvestRecordModelCopyWithImpl<HarvestRecordModel>(
          this as HarvestRecordModel, _$identity);

  /// Serializes this HarvestRecordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HarvestRecordModel &&
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
            (identical(other.gradeAWeight, gradeAWeight) ||
                other.gradeAWeight == gradeAWeight) &&
            (identical(other.gradeBWeight, gradeBWeight) ||
                other.gradeBWeight == gradeBWeight) &&
            (identical(other.gradeCWeight, gradeCWeight) ||
                other.gradeCWeight == gradeCWeight) &&
            (identical(other.yieldPercentage, yieldPercentage) ||
                other.yieldPercentage == yieldPercentage) &&
            (identical(other.survivalRate, survivalRate) ||
                other.survivalRate == survivalRate) &&
            (identical(other.feedConversionRatio, feedConversionRatio) ||
                other.feedConversionRatio == feedConversionRatio) &&
            (identical(other.mortalityPercentage, mortalityPercentage) ||
                other.mortalityPercentage == mortalityPercentage) &&
            (identical(other.harvestEfficiency, harvestEfficiency) ||
                other.harvestEfficiency == harvestEfficiency) &&
            (identical(other.harvestedBy, harvestedBy) ||
                other.harvestedBy == harvestedBy) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        gradeAWeight,
        gradeBWeight,
        gradeCWeight,
        yieldPercentage,
        survivalRate,
        feedConversionRatio,
        mortalityPercentage,
        harvestEfficiency,
        harvestedBy,
        remarks
      ]);

  @override
  String toString() {
    return 'HarvestRecordModel(id: $id, batchId: $batchId, harvestDate: $harvestDate, actualHarvestDuration: $actualHarvestDuration, grossWeight: $grossWeight, netSaleableWeight: $netSaleableWeight, rejectedWeight: $rejectedWeight, moisturePercentage: $moisturePercentage, wastePercentage: $wastePercentage, averageCocoonSize: $averageCocoonSize, gradeAWeight: $gradeAWeight, gradeBWeight: $gradeBWeight, gradeCWeight: $gradeCWeight, yieldPercentage: $yieldPercentage, survivalRate: $survivalRate, feedConversionRatio: $feedConversionRatio, mortalityPercentage: $mortalityPercentage, harvestEfficiency: $harvestEfficiency, harvestedBy: $harvestedBy, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $HarvestRecordModelCopyWith<$Res> {
  factory $HarvestRecordModelCopyWith(
          HarvestRecordModel value, $Res Function(HarvestRecordModel) _then) =
      _$HarvestRecordModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String harvestDate,
      double actualHarvestDuration,
      double grossWeight,
      double netSaleableWeight,
      double rejectedWeight,
      double moisturePercentage,
      double wastePercentage,
      double averageCocoonSize,
      double gradeAWeight,
      double gradeBWeight,
      double gradeCWeight,
      double yieldPercentage,
      double survivalRate,
      double feedConversionRatio,
      double mortalityPercentage,
      double harvestEfficiency,
      String? harvestedBy,
      String? remarks});
}

/// @nodoc
class _$HarvestRecordModelCopyWithImpl<$Res>
    implements $HarvestRecordModelCopyWith<$Res> {
  _$HarvestRecordModelCopyWithImpl(this._self, this._then);

  final HarvestRecordModel _self;
  final $Res Function(HarvestRecordModel) _then;

  /// Create a copy of HarvestRecordModel
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
    Object? gradeAWeight = null,
    Object? gradeBWeight = null,
    Object? gradeCWeight = null,
    Object? yieldPercentage = null,
    Object? survivalRate = null,
    Object? feedConversionRatio = null,
    Object? mortalityPercentage = null,
    Object? harvestEfficiency = null,
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
              as String,
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
}

/// Adds pattern-matching-related methods to [HarvestRecordModel].
extension HarvestRecordModelPatterns on HarvestRecordModel {
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
    TResult Function(_HarvestRecordModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel() when $default != null:
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
    TResult Function(_HarvestRecordModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel():
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
    TResult? Function(_HarvestRecordModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel() when $default != null:
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
            String harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            double gradeAWeight,
            double gradeBWeight,
            double gradeCWeight,
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency,
            String? harvestedBy,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel() when $default != null:
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
            _that.gradeAWeight,
            _that.gradeBWeight,
            _that.gradeCWeight,
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency,
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
            String harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            double gradeAWeight,
            double gradeBWeight,
            double gradeCWeight,
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency,
            String? harvestedBy,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel():
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
            _that.gradeAWeight,
            _that.gradeBWeight,
            _that.gradeCWeight,
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency,
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
            String harvestDate,
            double actualHarvestDuration,
            double grossWeight,
            double netSaleableWeight,
            double rejectedWeight,
            double moisturePercentage,
            double wastePercentage,
            double averageCocoonSize,
            double gradeAWeight,
            double gradeBWeight,
            double gradeCWeight,
            double yieldPercentage,
            double survivalRate,
            double feedConversionRatio,
            double mortalityPercentage,
            double harvestEfficiency,
            String? harvestedBy,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HarvestRecordModel() when $default != null:
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
            _that.gradeAWeight,
            _that.gradeBWeight,
            _that.gradeCWeight,
            _that.yieldPercentage,
            _that.survivalRate,
            _that.feedConversionRatio,
            _that.mortalityPercentage,
            _that.harvestEfficiency,
            _that.harvestedBy,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HarvestRecordModel implements HarvestRecordModel {
  const _HarvestRecordModel(
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
      required this.gradeAWeight,
      required this.gradeBWeight,
      required this.gradeCWeight,
      required this.yieldPercentage,
      required this.survivalRate,
      required this.feedConversionRatio,
      required this.mortalityPercentage,
      required this.harvestEfficiency,
      this.harvestedBy,
      this.remarks});
  factory _HarvestRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HarvestRecordModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String harvestDate;
  @override
  final double actualHarvestDuration;
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
  final double gradeAWeight;
  @override
  final double gradeBWeight;
  @override
  final double gradeCWeight;
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
  @override
  final String? harvestedBy;
  @override
  final String? remarks;

  /// Create a copy of HarvestRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HarvestRecordModelCopyWith<_HarvestRecordModel> get copyWith =>
      __$HarvestRecordModelCopyWithImpl<_HarvestRecordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HarvestRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HarvestRecordModel &&
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
            (identical(other.gradeAWeight, gradeAWeight) ||
                other.gradeAWeight == gradeAWeight) &&
            (identical(other.gradeBWeight, gradeBWeight) ||
                other.gradeBWeight == gradeBWeight) &&
            (identical(other.gradeCWeight, gradeCWeight) ||
                other.gradeCWeight == gradeCWeight) &&
            (identical(other.yieldPercentage, yieldPercentage) ||
                other.yieldPercentage == yieldPercentage) &&
            (identical(other.survivalRate, survivalRate) ||
                other.survivalRate == survivalRate) &&
            (identical(other.feedConversionRatio, feedConversionRatio) ||
                other.feedConversionRatio == feedConversionRatio) &&
            (identical(other.mortalityPercentage, mortalityPercentage) ||
                other.mortalityPercentage == mortalityPercentage) &&
            (identical(other.harvestEfficiency, harvestEfficiency) ||
                other.harvestEfficiency == harvestEfficiency) &&
            (identical(other.harvestedBy, harvestedBy) ||
                other.harvestedBy == harvestedBy) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        gradeAWeight,
        gradeBWeight,
        gradeCWeight,
        yieldPercentage,
        survivalRate,
        feedConversionRatio,
        mortalityPercentage,
        harvestEfficiency,
        harvestedBy,
        remarks
      ]);

  @override
  String toString() {
    return 'HarvestRecordModel(id: $id, batchId: $batchId, harvestDate: $harvestDate, actualHarvestDuration: $actualHarvestDuration, grossWeight: $grossWeight, netSaleableWeight: $netSaleableWeight, rejectedWeight: $rejectedWeight, moisturePercentage: $moisturePercentage, wastePercentage: $wastePercentage, averageCocoonSize: $averageCocoonSize, gradeAWeight: $gradeAWeight, gradeBWeight: $gradeBWeight, gradeCWeight: $gradeCWeight, yieldPercentage: $yieldPercentage, survivalRate: $survivalRate, feedConversionRatio: $feedConversionRatio, mortalityPercentage: $mortalityPercentage, harvestEfficiency: $harvestEfficiency, harvestedBy: $harvestedBy, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$HarvestRecordModelCopyWith<$Res>
    implements $HarvestRecordModelCopyWith<$Res> {
  factory _$HarvestRecordModelCopyWith(
          _HarvestRecordModel value, $Res Function(_HarvestRecordModel) _then) =
      __$HarvestRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String harvestDate,
      double actualHarvestDuration,
      double grossWeight,
      double netSaleableWeight,
      double rejectedWeight,
      double moisturePercentage,
      double wastePercentage,
      double averageCocoonSize,
      double gradeAWeight,
      double gradeBWeight,
      double gradeCWeight,
      double yieldPercentage,
      double survivalRate,
      double feedConversionRatio,
      double mortalityPercentage,
      double harvestEfficiency,
      String? harvestedBy,
      String? remarks});
}

/// @nodoc
class __$HarvestRecordModelCopyWithImpl<$Res>
    implements _$HarvestRecordModelCopyWith<$Res> {
  __$HarvestRecordModelCopyWithImpl(this._self, this._then);

  final _HarvestRecordModel _self;
  final $Res Function(_HarvestRecordModel) _then;

  /// Create a copy of HarvestRecordModel
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
    Object? gradeAWeight = null,
    Object? gradeBWeight = null,
    Object? gradeCWeight = null,
    Object? yieldPercentage = null,
    Object? survivalRate = null,
    Object? feedConversionRatio = null,
    Object? mortalityPercentage = null,
    Object? harvestEfficiency = null,
    Object? harvestedBy = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_HarvestRecordModel(
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
              as String,
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
}

// dart format on
