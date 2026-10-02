// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchModel {
  String get id;
  String get batchName;
  String get startDate;
  String get expectedHarvestDate;
  String? get actualHarvestDate;
  String get silkwormVariety;
  String get eggSource;
  int get numberOfDfls;
  double? get dflPrice;
  String get mulberryVariety;
  String get rearingHouse;
  String get currentStage;
  int get currentAgeDays;
  String get status;
  String get healthStatus;
  double get temperature;
  double get humidity;
  String? get notes;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchModelCopyWith<BatchModel> get copyWith =>
      _$BatchModelCopyWithImpl<BatchModel>(this as BatchModel, _$identity);

  /// Serializes this BatchModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expectedHarvestDate, expectedHarvestDate) ||
                other.expectedHarvestDate == expectedHarvestDate) &&
            (identical(other.actualHarvestDate, actualHarvestDate) ||
                other.actualHarvestDate == actualHarvestDate) &&
            (identical(other.silkwormVariety, silkwormVariety) ||
                other.silkwormVariety == silkwormVariety) &&
            (identical(other.eggSource, eggSource) ||
                other.eggSource == eggSource) &&
            (identical(other.numberOfDfls, numberOfDfls) ||
                other.numberOfDfls == numberOfDfls) &&
            (identical(other.dflPrice, dflPrice) ||
                other.dflPrice == dflPrice) &&
            (identical(other.mulberryVariety, mulberryVariety) ||
                other.mulberryVariety == mulberryVariety) &&
            (identical(other.rearingHouse, rearingHouse) ||
                other.rearingHouse == rearingHouse) &&
            (identical(other.currentStage, currentStage) ||
                other.currentStage == currentStage) &&
            (identical(other.currentAgeDays, currentAgeDays) ||
                other.currentAgeDays == currentAgeDays) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchName,
      startDate,
      expectedHarvestDate,
      actualHarvestDate,
      silkwormVariety,
      eggSource,
      numberOfDfls,
      dflPrice,
      mulberryVariety,
      rearingHouse,
      currentStage,
      currentAgeDays,
      status,
      healthStatus,
      temperature,
      humidity,
      notes);

  @override
  String toString() {
    return 'BatchModel(id: $id, batchName: $batchName, startDate: $startDate, expectedHarvestDate: $expectedHarvestDate, actualHarvestDate: $actualHarvestDate, silkwormVariety: $silkwormVariety, eggSource: $eggSource, numberOfDfls: $numberOfDfls, dflPrice: $dflPrice, mulberryVariety: $mulberryVariety, rearingHouse: $rearingHouse, currentStage: $currentStage, currentAgeDays: $currentAgeDays, status: $status, healthStatus: $healthStatus, temperature: $temperature, humidity: $humidity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $BatchModelCopyWith<$Res> {
  factory $BatchModelCopyWith(
          BatchModel value, $Res Function(BatchModel) _then) =
      _$BatchModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchName,
      String startDate,
      String expectedHarvestDate,
      String? actualHarvestDate,
      String silkwormVariety,
      String eggSource,
      int numberOfDfls,
      double? dflPrice,
      String mulberryVariety,
      String rearingHouse,
      String currentStage,
      int currentAgeDays,
      String status,
      String healthStatus,
      double temperature,
      double humidity,
      String? notes});
}

/// @nodoc
class _$BatchModelCopyWithImpl<$Res> implements $BatchModelCopyWith<$Res> {
  _$BatchModelCopyWithImpl(this._self, this._then);

  final BatchModel _self;
  final $Res Function(BatchModel) _then;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchName = null,
    Object? startDate = null,
    Object? expectedHarvestDate = null,
    Object? actualHarvestDate = freezed,
    Object? silkwormVariety = null,
    Object? eggSource = null,
    Object? numberOfDfls = null,
    Object? dflPrice = freezed,
    Object? mulberryVariety = null,
    Object? rearingHouse = null,
    Object? currentStage = null,
    Object? currentAgeDays = null,
    Object? status = null,
    Object? healthStatus = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchName: null == batchName
          ? _self.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedHarvestDate: null == expectedHarvestDate
          ? _self.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as String,
      actualHarvestDate: freezed == actualHarvestDate
          ? _self.actualHarvestDate
          : actualHarvestDate // ignore: cast_nullable_to_non_nullable
              as String?,
      silkwormVariety: null == silkwormVariety
          ? _self.silkwormVariety
          : silkwormVariety // ignore: cast_nullable_to_non_nullable
              as String,
      eggSource: null == eggSource
          ? _self.eggSource
          : eggSource // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfDfls: null == numberOfDfls
          ? _self.numberOfDfls
          : numberOfDfls // ignore: cast_nullable_to_non_nullable
              as int,
      dflPrice: freezed == dflPrice
          ? _self.dflPrice
          : dflPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mulberryVariety: null == mulberryVariety
          ? _self.mulberryVariety
          : mulberryVariety // ignore: cast_nullable_to_non_nullable
              as String,
      rearingHouse: null == rearingHouse
          ? _self.rearingHouse
          : rearingHouse // ignore: cast_nullable_to_non_nullable
              as String,
      currentStage: null == currentStage
          ? _self.currentStage
          : currentStage // ignore: cast_nullable_to_non_nullable
              as String,
      currentAgeDays: null == currentAgeDays
          ? _self.currentAgeDays
          : currentAgeDays // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchModel].
extension BatchModelPatterns on BatchModel {
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
    TResult Function(_BatchModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchModel() when $default != null:
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
    TResult Function(_BatchModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchModel():
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
    TResult? Function(_BatchModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchModel() when $default != null:
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
            String batchName,
            String startDate,
            String expectedHarvestDate,
            String? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            String currentStage,
            int currentAgeDays,
            String status,
            String healthStatus,
            double temperature,
            double humidity,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchModel() when $default != null:
        return $default(
            _that.id,
            _that.batchName,
            _that.startDate,
            _that.expectedHarvestDate,
            _that.actualHarvestDate,
            _that.silkwormVariety,
            _that.eggSource,
            _that.numberOfDfls,
            _that.dflPrice,
            _that.mulberryVariety,
            _that.rearingHouse,
            _that.currentStage,
            _that.currentAgeDays,
            _that.status,
            _that.healthStatus,
            _that.temperature,
            _that.humidity,
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
            String batchName,
            String startDate,
            String expectedHarvestDate,
            String? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            String currentStage,
            int currentAgeDays,
            String status,
            String healthStatus,
            double temperature,
            double humidity,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchModel():
        return $default(
            _that.id,
            _that.batchName,
            _that.startDate,
            _that.expectedHarvestDate,
            _that.actualHarvestDate,
            _that.silkwormVariety,
            _that.eggSource,
            _that.numberOfDfls,
            _that.dflPrice,
            _that.mulberryVariety,
            _that.rearingHouse,
            _that.currentStage,
            _that.currentAgeDays,
            _that.status,
            _that.healthStatus,
            _that.temperature,
            _that.humidity,
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
            String batchName,
            String startDate,
            String expectedHarvestDate,
            String? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            String currentStage,
            int currentAgeDays,
            String status,
            String healthStatus,
            double temperature,
            double humidity,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchModel() when $default != null:
        return $default(
            _that.id,
            _that.batchName,
            _that.startDate,
            _that.expectedHarvestDate,
            _that.actualHarvestDate,
            _that.silkwormVariety,
            _that.eggSource,
            _that.numberOfDfls,
            _that.dflPrice,
            _that.mulberryVariety,
            _that.rearingHouse,
            _that.currentStage,
            _that.currentAgeDays,
            _that.status,
            _that.healthStatus,
            _that.temperature,
            _that.humidity,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BatchModel implements BatchModel {
  const _BatchModel(
      {required this.id,
      required this.batchName,
      required this.startDate,
      required this.expectedHarvestDate,
      this.actualHarvestDate,
      required this.silkwormVariety,
      required this.eggSource,
      required this.numberOfDfls,
      this.dflPrice,
      required this.mulberryVariety,
      required this.rearingHouse,
      required this.currentStage,
      required this.currentAgeDays,
      required this.status,
      required this.healthStatus,
      required this.temperature,
      required this.humidity,
      this.notes});
  factory _BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);

  @override
  final String id;
  @override
  final String batchName;
  @override
  final String startDate;
  @override
  final String expectedHarvestDate;
  @override
  final String? actualHarvestDate;
  @override
  final String silkwormVariety;
  @override
  final String eggSource;
  @override
  final int numberOfDfls;
  @override
  final double? dflPrice;
  @override
  final String mulberryVariety;
  @override
  final String rearingHouse;
  @override
  final String currentStage;
  @override
  final int currentAgeDays;
  @override
  final String status;
  @override
  final String healthStatus;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final String? notes;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchModelCopyWith<_BatchModel> get copyWith =>
      __$BatchModelCopyWithImpl<_BatchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BatchModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchName, batchName) ||
                other.batchName == batchName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expectedHarvestDate, expectedHarvestDate) ||
                other.expectedHarvestDate == expectedHarvestDate) &&
            (identical(other.actualHarvestDate, actualHarvestDate) ||
                other.actualHarvestDate == actualHarvestDate) &&
            (identical(other.silkwormVariety, silkwormVariety) ||
                other.silkwormVariety == silkwormVariety) &&
            (identical(other.eggSource, eggSource) ||
                other.eggSource == eggSource) &&
            (identical(other.numberOfDfls, numberOfDfls) ||
                other.numberOfDfls == numberOfDfls) &&
            (identical(other.dflPrice, dflPrice) ||
                other.dflPrice == dflPrice) &&
            (identical(other.mulberryVariety, mulberryVariety) ||
                other.mulberryVariety == mulberryVariety) &&
            (identical(other.rearingHouse, rearingHouse) ||
                other.rearingHouse == rearingHouse) &&
            (identical(other.currentStage, currentStage) ||
                other.currentStage == currentStage) &&
            (identical(other.currentAgeDays, currentAgeDays) ||
                other.currentAgeDays == currentAgeDays) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      batchName,
      startDate,
      expectedHarvestDate,
      actualHarvestDate,
      silkwormVariety,
      eggSource,
      numberOfDfls,
      dflPrice,
      mulberryVariety,
      rearingHouse,
      currentStage,
      currentAgeDays,
      status,
      healthStatus,
      temperature,
      humidity,
      notes);

  @override
  String toString() {
    return 'BatchModel(id: $id, batchName: $batchName, startDate: $startDate, expectedHarvestDate: $expectedHarvestDate, actualHarvestDate: $actualHarvestDate, silkwormVariety: $silkwormVariety, eggSource: $eggSource, numberOfDfls: $numberOfDfls, dflPrice: $dflPrice, mulberryVariety: $mulberryVariety, rearingHouse: $rearingHouse, currentStage: $currentStage, currentAgeDays: $currentAgeDays, status: $status, healthStatus: $healthStatus, temperature: $temperature, humidity: $humidity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$BatchModelCopyWith<$Res>
    implements $BatchModelCopyWith<$Res> {
  factory _$BatchModelCopyWith(
          _BatchModel value, $Res Function(_BatchModel) _then) =
      __$BatchModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchName,
      String startDate,
      String expectedHarvestDate,
      String? actualHarvestDate,
      String silkwormVariety,
      String eggSource,
      int numberOfDfls,
      double? dflPrice,
      String mulberryVariety,
      String rearingHouse,
      String currentStage,
      int currentAgeDays,
      String status,
      String healthStatus,
      double temperature,
      double humidity,
      String? notes});
}

/// @nodoc
class __$BatchModelCopyWithImpl<$Res> implements _$BatchModelCopyWith<$Res> {
  __$BatchModelCopyWithImpl(this._self, this._then);

  final _BatchModel _self;
  final $Res Function(_BatchModel) _then;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchName = null,
    Object? startDate = null,
    Object? expectedHarvestDate = null,
    Object? actualHarvestDate = freezed,
    Object? silkwormVariety = null,
    Object? eggSource = null,
    Object? numberOfDfls = null,
    Object? dflPrice = freezed,
    Object? mulberryVariety = null,
    Object? rearingHouse = null,
    Object? currentStage = null,
    Object? currentAgeDays = null,
    Object? status = null,
    Object? healthStatus = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? notes = freezed,
  }) {
    return _then(_BatchModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchName: null == batchName
          ? _self.batchName
          : batchName // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      expectedHarvestDate: null == expectedHarvestDate
          ? _self.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as String,
      actualHarvestDate: freezed == actualHarvestDate
          ? _self.actualHarvestDate
          : actualHarvestDate // ignore: cast_nullable_to_non_nullable
              as String?,
      silkwormVariety: null == silkwormVariety
          ? _self.silkwormVariety
          : silkwormVariety // ignore: cast_nullable_to_non_nullable
              as String,
      eggSource: null == eggSource
          ? _self.eggSource
          : eggSource // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfDfls: null == numberOfDfls
          ? _self.numberOfDfls
          : numberOfDfls // ignore: cast_nullable_to_non_nullable
              as int,
      dflPrice: freezed == dflPrice
          ? _self.dflPrice
          : dflPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      mulberryVariety: null == mulberryVariety
          ? _self.mulberryVariety
          : mulberryVariety // ignore: cast_nullable_to_non_nullable
              as String,
      rearingHouse: null == rearingHouse
          ? _self.rearingHouse
          : rearingHouse // ignore: cast_nullable_to_non_nullable
              as String,
      currentStage: null == currentStage
          ? _self.currentStage
          : currentStage // ignore: cast_nullable_to_non_nullable
              as String,
      currentAgeDays: null == currentAgeDays
          ? _self.currentAgeDays
          : currentAgeDays // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      healthStatus: null == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$BatchTimelineEventModel {
  String get id;
  String get batchId;
  String get timestamp;
  String get eventType;
  String get description;

  /// Create a copy of BatchTimelineEventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchTimelineEventModelCopyWith<BatchTimelineEventModel> get copyWith =>
      _$BatchTimelineEventModelCopyWithImpl<BatchTimelineEventModel>(
          this as BatchTimelineEventModel, _$identity);

  /// Serializes this BatchTimelineEventModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchTimelineEventModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, timestamp, eventType, description);

  @override
  String toString() {
    return 'BatchTimelineEventModel(id: $id, batchId: $batchId, timestamp: $timestamp, eventType: $eventType, description: $description)';
  }
}

/// @nodoc
abstract mixin class $BatchTimelineEventModelCopyWith<$Res> {
  factory $BatchTimelineEventModelCopyWith(BatchTimelineEventModel value,
          $Res Function(BatchTimelineEventModel) _then) =
      _$BatchTimelineEventModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String timestamp,
      String eventType,
      String description});
}

/// @nodoc
class _$BatchTimelineEventModelCopyWithImpl<$Res>
    implements $BatchTimelineEventModelCopyWith<$Res> {
  _$BatchTimelineEventModelCopyWithImpl(this._self, this._then);

  final BatchTimelineEventModel _self;
  final $Res Function(BatchTimelineEventModel) _then;

  /// Create a copy of BatchTimelineEventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? timestamp = null,
    Object? eventType = null,
    Object? description = null,
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
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchTimelineEventModel].
extension BatchTimelineEventModelPatterns on BatchTimelineEventModel {
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
    TResult Function(_BatchTimelineEventModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel() when $default != null:
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
    TResult Function(_BatchTimelineEventModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel():
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
    TResult? Function(_BatchTimelineEventModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel() when $default != null:
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
    TResult Function(String id, String batchId, String timestamp,
            String eventType, String description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel() when $default != null:
        return $default(_that.id, _that.batchId, _that.timestamp,
            _that.eventType, _that.description);
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
    TResult Function(String id, String batchId, String timestamp,
            String eventType, String description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel():
        return $default(_that.id, _that.batchId, _that.timestamp,
            _that.eventType, _that.description);
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
    TResult? Function(String id, String batchId, String timestamp,
            String eventType, String description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEventModel() when $default != null:
        return $default(_that.id, _that.batchId, _that.timestamp,
            _that.eventType, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BatchTimelineEventModel implements BatchTimelineEventModel {
  const _BatchTimelineEventModel(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.eventType,
      required this.description});
  factory _BatchTimelineEventModel.fromJson(Map<String, dynamic> json) =>
      _$BatchTimelineEventModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String timestamp;
  @override
  final String eventType;
  @override
  final String description;

  /// Create a copy of BatchTimelineEventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchTimelineEventModelCopyWith<_BatchTimelineEventModel> get copyWith =>
      __$BatchTimelineEventModelCopyWithImpl<_BatchTimelineEventModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BatchTimelineEventModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchTimelineEventModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, timestamp, eventType, description);

  @override
  String toString() {
    return 'BatchTimelineEventModel(id: $id, batchId: $batchId, timestamp: $timestamp, eventType: $eventType, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$BatchTimelineEventModelCopyWith<$Res>
    implements $BatchTimelineEventModelCopyWith<$Res> {
  factory _$BatchTimelineEventModelCopyWith(_BatchTimelineEventModel value,
          $Res Function(_BatchTimelineEventModel) _then) =
      __$BatchTimelineEventModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String timestamp,
      String eventType,
      String description});
}

/// @nodoc
class __$BatchTimelineEventModelCopyWithImpl<$Res>
    implements _$BatchTimelineEventModelCopyWith<$Res> {
  __$BatchTimelineEventModelCopyWithImpl(this._self, this._then);

  final _BatchTimelineEventModel _self;
  final $Res Function(_BatchTimelineEventModel) _then;

  /// Create a copy of BatchTimelineEventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? timestamp = null,
    Object? eventType = null,
    Object? description = null,
  }) {
    return _then(_BatchTimelineEventModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
