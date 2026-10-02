// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Batch {
  String get id;
  String get batchName;
  DateTime get startDate;
  DateTime get expectedHarvestDate;
  DateTime? get actualHarvestDate;
  String get silkwormVariety;
  String get eggSource;
  int get numberOfDfls;
  double? get dflPrice;
  String get mulberryVariety;
  String get rearingHouse;
  InstarStage get currentStage;
  int get currentAgeDays;
  BatchStatus get status;
  HealthStatus get healthStatus;
  double get temperature;
  double get humidity;
  String? get notes;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchCopyWith<Batch> get copyWith =>
      _$BatchCopyWithImpl<Batch>(this as Batch, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Batch &&
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
    return 'Batch(id: $id, batchName: $batchName, startDate: $startDate, expectedHarvestDate: $expectedHarvestDate, actualHarvestDate: $actualHarvestDate, silkwormVariety: $silkwormVariety, eggSource: $eggSource, numberOfDfls: $numberOfDfls, dflPrice: $dflPrice, mulberryVariety: $mulberryVariety, rearingHouse: $rearingHouse, currentStage: $currentStage, currentAgeDays: $currentAgeDays, status: $status, healthStatus: $healthStatus, temperature: $temperature, humidity: $humidity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) _then) =
      _$BatchCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchName,
      DateTime startDate,
      DateTime expectedHarvestDate,
      DateTime? actualHarvestDate,
      String silkwormVariety,
      String eggSource,
      int numberOfDfls,
      double? dflPrice,
      String mulberryVariety,
      String rearingHouse,
      InstarStage currentStage,
      int currentAgeDays,
      BatchStatus status,
      HealthStatus healthStatus,
      double temperature,
      double humidity,
      String? notes});
}

/// @nodoc
class _$BatchCopyWithImpl<$Res> implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._self, this._then);

  final Batch _self;
  final $Res Function(Batch) _then;

  /// Create a copy of Batch
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
              as DateTime,
      expectedHarvestDate: null == expectedHarvestDate
          ? _self.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualHarvestDate: freezed == actualHarvestDate
          ? _self.actualHarvestDate
          : actualHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as InstarStage,
      currentAgeDays: null == currentAgeDays
          ? _self.currentAgeDays
          : currentAgeDays // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      healthStatus: null == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as HealthStatus,
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

/// Adds pattern-matching-related methods to [Batch].
extension BatchPatterns on Batch {
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
    TResult Function(_Batch value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Batch() when $default != null:
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
    TResult Function(_Batch value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Batch():
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
    TResult? Function(_Batch value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Batch() when $default != null:
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
            DateTime startDate,
            DateTime expectedHarvestDate,
            DateTime? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            InstarStage currentStage,
            int currentAgeDays,
            BatchStatus status,
            HealthStatus healthStatus,
            double temperature,
            double humidity,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Batch() when $default != null:
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
            DateTime startDate,
            DateTime expectedHarvestDate,
            DateTime? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            InstarStage currentStage,
            int currentAgeDays,
            BatchStatus status,
            HealthStatus healthStatus,
            double temperature,
            double humidity,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Batch():
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
            DateTime startDate,
            DateTime expectedHarvestDate,
            DateTime? actualHarvestDate,
            String silkwormVariety,
            String eggSource,
            int numberOfDfls,
            double? dflPrice,
            String mulberryVariety,
            String rearingHouse,
            InstarStage currentStage,
            int currentAgeDays,
            BatchStatus status,
            HealthStatus healthStatus,
            double temperature,
            double humidity,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Batch() when $default != null:
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

class _Batch implements Batch {
  const _Batch(
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

  @override
  final String id;
  @override
  final String batchName;
  @override
  final DateTime startDate;
  @override
  final DateTime expectedHarvestDate;
  @override
  final DateTime? actualHarvestDate;
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
  final InstarStage currentStage;
  @override
  final int currentAgeDays;
  @override
  final BatchStatus status;
  @override
  final HealthStatus healthStatus;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final String? notes;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchCopyWith<_Batch> get copyWith =>
      __$BatchCopyWithImpl<_Batch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Batch &&
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
    return 'Batch(id: $id, batchName: $batchName, startDate: $startDate, expectedHarvestDate: $expectedHarvestDate, actualHarvestDate: $actualHarvestDate, silkwormVariety: $silkwormVariety, eggSource: $eggSource, numberOfDfls: $numberOfDfls, dflPrice: $dflPrice, mulberryVariety: $mulberryVariety, rearingHouse: $rearingHouse, currentStage: $currentStage, currentAgeDays: $currentAgeDays, status: $status, healthStatus: $healthStatus, temperature: $temperature, humidity: $humidity, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$BatchCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$BatchCopyWith(_Batch value, $Res Function(_Batch) _then) =
      __$BatchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchName,
      DateTime startDate,
      DateTime expectedHarvestDate,
      DateTime? actualHarvestDate,
      String silkwormVariety,
      String eggSource,
      int numberOfDfls,
      double? dflPrice,
      String mulberryVariety,
      String rearingHouse,
      InstarStage currentStage,
      int currentAgeDays,
      BatchStatus status,
      HealthStatus healthStatus,
      double temperature,
      double humidity,
      String? notes});
}

/// @nodoc
class __$BatchCopyWithImpl<$Res> implements _$BatchCopyWith<$Res> {
  __$BatchCopyWithImpl(this._self, this._then);

  final _Batch _self;
  final $Res Function(_Batch) _then;

  /// Create a copy of Batch
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
    return _then(_Batch(
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
              as DateTime,
      expectedHarvestDate: null == expectedHarvestDate
          ? _self.expectedHarvestDate
          : expectedHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualHarvestDate: freezed == actualHarvestDate
          ? _self.actualHarvestDate
          : actualHarvestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as InstarStage,
      currentAgeDays: null == currentAgeDays
          ? _self.currentAgeDays
          : currentAgeDays // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      healthStatus: null == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as HealthStatus,
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
mixin _$BatchTimelineEvent {
  String get id;
  String get batchId;
  DateTime get timestamp;
  String get eventType;
  String get description;

  /// Create a copy of BatchTimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchTimelineEventCopyWith<BatchTimelineEvent> get copyWith =>
      _$BatchTimelineEventCopyWithImpl<BatchTimelineEvent>(
          this as BatchTimelineEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchTimelineEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, timestamp, eventType, description);

  @override
  String toString() {
    return 'BatchTimelineEvent(id: $id, batchId: $batchId, timestamp: $timestamp, eventType: $eventType, description: $description)';
  }
}

/// @nodoc
abstract mixin class $BatchTimelineEventCopyWith<$Res> {
  factory $BatchTimelineEventCopyWith(
          BatchTimelineEvent value, $Res Function(BatchTimelineEvent) _then) =
      _$BatchTimelineEventCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime timestamp,
      String eventType,
      String description});
}

/// @nodoc
class _$BatchTimelineEventCopyWithImpl<$Res>
    implements $BatchTimelineEventCopyWith<$Res> {
  _$BatchTimelineEventCopyWithImpl(this._self, this._then);

  final BatchTimelineEvent _self;
  final $Res Function(BatchTimelineEvent) _then;

  /// Create a copy of BatchTimelineEvent
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
              as DateTime,
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

/// Adds pattern-matching-related methods to [BatchTimelineEvent].
extension BatchTimelineEventPatterns on BatchTimelineEvent {
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
    TResult Function(_BatchTimelineEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent() when $default != null:
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
    TResult Function(_BatchTimelineEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent():
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
    TResult? Function(_BatchTimelineEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent() when $default != null:
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
    TResult Function(String id, String batchId, DateTime timestamp,
            String eventType, String description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent() when $default != null:
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
    TResult Function(String id, String batchId, DateTime timestamp,
            String eventType, String description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent():
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
    TResult? Function(String id, String batchId, DateTime timestamp,
            String eventType, String description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchTimelineEvent() when $default != null:
        return $default(_that.id, _that.batchId, _that.timestamp,
            _that.eventType, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BatchTimelineEvent implements BatchTimelineEvent {
  const _BatchTimelineEvent(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.eventType,
      required this.description});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime timestamp;
  @override
  final String eventType;
  @override
  final String description;

  /// Create a copy of BatchTimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchTimelineEventCopyWith<_BatchTimelineEvent> get copyWith =>
      __$BatchTimelineEventCopyWithImpl<_BatchTimelineEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchTimelineEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, timestamp, eventType, description);

  @override
  String toString() {
    return 'BatchTimelineEvent(id: $id, batchId: $batchId, timestamp: $timestamp, eventType: $eventType, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$BatchTimelineEventCopyWith<$Res>
    implements $BatchTimelineEventCopyWith<$Res> {
  factory _$BatchTimelineEventCopyWith(
          _BatchTimelineEvent value, $Res Function(_BatchTimelineEvent) _then) =
      __$BatchTimelineEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime timestamp,
      String eventType,
      String description});
}

/// @nodoc
class __$BatchTimelineEventCopyWithImpl<$Res>
    implements _$BatchTimelineEventCopyWith<$Res> {
  __$BatchTimelineEventCopyWithImpl(this._self, this._then);

  final _BatchTimelineEvent _self;
  final $Res Function(_BatchTimelineEvent) _then;

  /// Create a copy of BatchTimelineEvent
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
    return _then(_BatchTimelineEvent(
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
              as DateTime,
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

/// @nodoc
mixin _$BatchFilter {
  List<BatchStatus>? get statuses;
  String? get rearingHouse;
  String? get silkwormVariety;
  DateTime? get startDateAfter;
  DateTime? get startDateBefore;

  /// Create a copy of BatchFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchFilterCopyWith<BatchFilter> get copyWith =>
      _$BatchFilterCopyWithImpl<BatchFilter>(this as BatchFilter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchFilter &&
            const DeepCollectionEquality().equals(other.statuses, statuses) &&
            (identical(other.rearingHouse, rearingHouse) ||
                other.rearingHouse == rearingHouse) &&
            (identical(other.silkwormVariety, silkwormVariety) ||
                other.silkwormVariety == silkwormVariety) &&
            (identical(other.startDateAfter, startDateAfter) ||
                other.startDateAfter == startDateAfter) &&
            (identical(other.startDateBefore, startDateBefore) ||
                other.startDateBefore == startDateBefore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statuses),
      rearingHouse,
      silkwormVariety,
      startDateAfter,
      startDateBefore);

  @override
  String toString() {
    return 'BatchFilter(statuses: $statuses, rearingHouse: $rearingHouse, silkwormVariety: $silkwormVariety, startDateAfter: $startDateAfter, startDateBefore: $startDateBefore)';
  }
}

/// @nodoc
abstract mixin class $BatchFilterCopyWith<$Res> {
  factory $BatchFilterCopyWith(
          BatchFilter value, $Res Function(BatchFilter) _then) =
      _$BatchFilterCopyWithImpl;
  @useResult
  $Res call(
      {List<BatchStatus>? statuses,
      String? rearingHouse,
      String? silkwormVariety,
      DateTime? startDateAfter,
      DateTime? startDateBefore});
}

/// @nodoc
class _$BatchFilterCopyWithImpl<$Res> implements $BatchFilterCopyWith<$Res> {
  _$BatchFilterCopyWithImpl(this._self, this._then);

  final BatchFilter _self;
  final $Res Function(BatchFilter) _then;

  /// Create a copy of BatchFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statuses = freezed,
    Object? rearingHouse = freezed,
    Object? silkwormVariety = freezed,
    Object? startDateAfter = freezed,
    Object? startDateBefore = freezed,
  }) {
    return _then(_self.copyWith(
      statuses: freezed == statuses
          ? _self.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<BatchStatus>?,
      rearingHouse: freezed == rearingHouse
          ? _self.rearingHouse
          : rearingHouse // ignore: cast_nullable_to_non_nullable
              as String?,
      silkwormVariety: freezed == silkwormVariety
          ? _self.silkwormVariety
          : silkwormVariety // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateAfter: freezed == startDateAfter
          ? _self.startDateAfter
          : startDateAfter // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDateBefore: freezed == startDateBefore
          ? _self.startDateBefore
          : startDateBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BatchFilter].
extension BatchFilterPatterns on BatchFilter {
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
    TResult Function(_BatchFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchFilter() when $default != null:
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
    TResult Function(_BatchFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchFilter():
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
    TResult? Function(_BatchFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchFilter() when $default != null:
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
            List<BatchStatus>? statuses,
            String? rearingHouse,
            String? silkwormVariety,
            DateTime? startDateAfter,
            DateTime? startDateBefore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BatchFilter() when $default != null:
        return $default(_that.statuses, _that.rearingHouse,
            _that.silkwormVariety, _that.startDateAfter, _that.startDateBefore);
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
            List<BatchStatus>? statuses,
            String? rearingHouse,
            String? silkwormVariety,
            DateTime? startDateAfter,
            DateTime? startDateBefore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchFilter():
        return $default(_that.statuses, _that.rearingHouse,
            _that.silkwormVariety, _that.startDateAfter, _that.startDateBefore);
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
            List<BatchStatus>? statuses,
            String? rearingHouse,
            String? silkwormVariety,
            DateTime? startDateAfter,
            DateTime? startDateBefore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BatchFilter() when $default != null:
        return $default(_that.statuses, _that.rearingHouse,
            _that.silkwormVariety, _that.startDateAfter, _that.startDateBefore);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BatchFilter implements BatchFilter {
  const _BatchFilter(
      {final List<BatchStatus>? statuses,
      this.rearingHouse,
      this.silkwormVariety,
      this.startDateAfter,
      this.startDateBefore})
      : _statuses = statuses;

  final List<BatchStatus>? _statuses;
  @override
  List<BatchStatus>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? rearingHouse;
  @override
  final String? silkwormVariety;
  @override
  final DateTime? startDateAfter;
  @override
  final DateTime? startDateBefore;

  /// Create a copy of BatchFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BatchFilterCopyWith<_BatchFilter> get copyWith =>
      __$BatchFilterCopyWithImpl<_BatchFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BatchFilter &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.rearingHouse, rearingHouse) ||
                other.rearingHouse == rearingHouse) &&
            (identical(other.silkwormVariety, silkwormVariety) ||
                other.silkwormVariety == silkwormVariety) &&
            (identical(other.startDateAfter, startDateAfter) ||
                other.startDateAfter == startDateAfter) &&
            (identical(other.startDateBefore, startDateBefore) ||
                other.startDateBefore == startDateBefore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_statuses),
      rearingHouse,
      silkwormVariety,
      startDateAfter,
      startDateBefore);

  @override
  String toString() {
    return 'BatchFilter(statuses: $statuses, rearingHouse: $rearingHouse, silkwormVariety: $silkwormVariety, startDateAfter: $startDateAfter, startDateBefore: $startDateBefore)';
  }
}

/// @nodoc
abstract mixin class _$BatchFilterCopyWith<$Res>
    implements $BatchFilterCopyWith<$Res> {
  factory _$BatchFilterCopyWith(
          _BatchFilter value, $Res Function(_BatchFilter) _then) =
      __$BatchFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<BatchStatus>? statuses,
      String? rearingHouse,
      String? silkwormVariety,
      DateTime? startDateAfter,
      DateTime? startDateBefore});
}

/// @nodoc
class __$BatchFilterCopyWithImpl<$Res> implements _$BatchFilterCopyWith<$Res> {
  __$BatchFilterCopyWithImpl(this._self, this._then);

  final _BatchFilter _self;
  final $Res Function(_BatchFilter) _then;

  /// Create a copy of BatchFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statuses = freezed,
    Object? rearingHouse = freezed,
    Object? silkwormVariety = freezed,
    Object? startDateAfter = freezed,
    Object? startDateBefore = freezed,
  }) {
    return _then(_BatchFilter(
      statuses: freezed == statuses
          ? _self._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<BatchStatus>?,
      rearingHouse: freezed == rearingHouse
          ? _self.rearingHouse
          : rearingHouse // ignore: cast_nullable_to_non_nullable
              as String?,
      silkwormVariety: freezed == silkwormVariety
          ? _self.silkwormVariety
          : silkwormVariety // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateAfter: freezed == startDateAfter
          ? _self.startDateAfter
          : startDateAfter // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDateBefore: freezed == startDateBefore
          ? _self.startDateBefore
          : startDateBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
