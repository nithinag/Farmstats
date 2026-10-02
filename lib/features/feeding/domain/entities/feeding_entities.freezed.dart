// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeding_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedingLog {
  String get id;
  String get batchId;
  DateTime get date;
  String get time;
  LeafType get leafType;
  String get leafAge;
  double get leafQuantity;
  int get feedingRound;
  String? get workerId;
  String? get remarks;

  /// Create a copy of FeedingLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedingLogCopyWith<FeedingLog> get copyWith =>
      _$FeedingLogCopyWithImpl<FeedingLog>(this as FeedingLog, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedingLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.leafType, leafType) ||
                other.leafType == leafType) &&
            (identical(other.leafAge, leafAge) || other.leafAge == leafAge) &&
            (identical(other.leafQuantity, leafQuantity) ||
                other.leafQuantity == leafQuantity) &&
            (identical(other.feedingRound, feedingRound) ||
                other.feedingRound == feedingRound) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, date, time,
      leafType, leafAge, leafQuantity, feedingRound, workerId, remarks);

  @override
  String toString() {
    return 'FeedingLog(id: $id, batchId: $batchId, date: $date, time: $time, leafType: $leafType, leafAge: $leafAge, leafQuantity: $leafQuantity, feedingRound: $feedingRound, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $FeedingLogCopyWith<$Res> {
  factory $FeedingLogCopyWith(
          FeedingLog value, $Res Function(FeedingLog) _then) =
      _$FeedingLogCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      String time,
      LeafType leafType,
      String leafAge,
      double leafQuantity,
      int feedingRound,
      String? workerId,
      String? remarks});
}

/// @nodoc
class _$FeedingLogCopyWithImpl<$Res> implements $FeedingLogCopyWith<$Res> {
  _$FeedingLogCopyWithImpl(this._self, this._then);

  final FeedingLog _self;
  final $Res Function(FeedingLog) _then;

  /// Create a copy of FeedingLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? time = null,
    Object? leafType = null,
    Object? leafAge = null,
    Object? leafQuantity = null,
    Object? feedingRound = null,
    Object? workerId = freezed,
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
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      leafType: null == leafType
          ? _self.leafType
          : leafType // ignore: cast_nullable_to_non_nullable
              as LeafType,
      leafAge: null == leafAge
          ? _self.leafAge
          : leafAge // ignore: cast_nullable_to_non_nullable
              as String,
      leafQuantity: null == leafQuantity
          ? _self.leafQuantity
          : leafQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      feedingRound: null == feedingRound
          ? _self.feedingRound
          : feedingRound // ignore: cast_nullable_to_non_nullable
              as int,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FeedingLog].
extension FeedingLogPatterns on FeedingLog {
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
    TResult Function(_FeedingLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedingLog() when $default != null:
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
    TResult Function(_FeedingLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLog():
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
    TResult? Function(_FeedingLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLog() when $default != null:
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
            DateTime date,
            String time,
            LeafType leafType,
            String leafAge,
            double leafQuantity,
            int feedingRound,
            String? workerId,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedingLog() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.date,
            _that.time,
            _that.leafType,
            _that.leafAge,
            _that.leafQuantity,
            _that.feedingRound,
            _that.workerId,
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
            DateTime date,
            String time,
            LeafType leafType,
            String leafAge,
            double leafQuantity,
            int feedingRound,
            String? workerId,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLog():
        return $default(
            _that.id,
            _that.batchId,
            _that.date,
            _that.time,
            _that.leafType,
            _that.leafAge,
            _that.leafQuantity,
            _that.feedingRound,
            _that.workerId,
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
            DateTime date,
            String time,
            LeafType leafType,
            String leafAge,
            double leafQuantity,
            int feedingRound,
            String? workerId,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLog() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.date,
            _that.time,
            _that.leafType,
            _that.leafAge,
            _that.leafQuantity,
            _that.feedingRound,
            _that.workerId,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FeedingLog implements FeedingLog {
  const _FeedingLog(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.time,
      required this.leafType,
      required this.leafAge,
      required this.leafQuantity,
      required this.feedingRound,
      this.workerId,
      this.remarks});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime date;
  @override
  final String time;
  @override
  final LeafType leafType;
  @override
  final String leafAge;
  @override
  final double leafQuantity;
  @override
  final int feedingRound;
  @override
  final String? workerId;
  @override
  final String? remarks;

  /// Create a copy of FeedingLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedingLogCopyWith<_FeedingLog> get copyWith =>
      __$FeedingLogCopyWithImpl<_FeedingLog>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedingLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.leafType, leafType) ||
                other.leafType == leafType) &&
            (identical(other.leafAge, leafAge) || other.leafAge == leafAge) &&
            (identical(other.leafQuantity, leafQuantity) ||
                other.leafQuantity == leafQuantity) &&
            (identical(other.feedingRound, feedingRound) ||
                other.feedingRound == feedingRound) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, date, time,
      leafType, leafAge, leafQuantity, feedingRound, workerId, remarks);

  @override
  String toString() {
    return 'FeedingLog(id: $id, batchId: $batchId, date: $date, time: $time, leafType: $leafType, leafAge: $leafAge, leafQuantity: $leafQuantity, feedingRound: $feedingRound, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$FeedingLogCopyWith<$Res>
    implements $FeedingLogCopyWith<$Res> {
  factory _$FeedingLogCopyWith(
          _FeedingLog value, $Res Function(_FeedingLog) _then) =
      __$FeedingLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      String time,
      LeafType leafType,
      String leafAge,
      double leafQuantity,
      int feedingRound,
      String? workerId,
      String? remarks});
}

/// @nodoc
class __$FeedingLogCopyWithImpl<$Res> implements _$FeedingLogCopyWith<$Res> {
  __$FeedingLogCopyWithImpl(this._self, this._then);

  final _FeedingLog _self;
  final $Res Function(_FeedingLog) _then;

  /// Create a copy of FeedingLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? time = null,
    Object? leafType = null,
    Object? leafAge = null,
    Object? leafQuantity = null,
    Object? feedingRound = null,
    Object? workerId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_FeedingLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      leafType: null == leafType
          ? _self.leafType
          : leafType // ignore: cast_nullable_to_non_nullable
              as LeafType,
      leafAge: null == leafAge
          ? _self.leafAge
          : leafAge // ignore: cast_nullable_to_non_nullable
              as String,
      leafQuantity: null == leafQuantity
          ? _self.leafQuantity
          : leafQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      feedingRound: null == feedingRound
          ? _self.feedingRound
          : feedingRound // ignore: cast_nullable_to_non_nullable
              as int,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$EnvironmentalReading {
  String get id;
  String get batchId;
  DateTime get timestamp;
  double get temperature;
  double get humidity;
  bool get ventilationStatus;
  String? get weatherNotes;

  /// Create a copy of EnvironmentalReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnvironmentalReadingCopyWith<EnvironmentalReading> get copyWith =>
      _$EnvironmentalReadingCopyWithImpl<EnvironmentalReading>(
          this as EnvironmentalReading, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnvironmentalReading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.ventilationStatus, ventilationStatus) ||
                other.ventilationStatus == ventilationStatus) &&
            (identical(other.weatherNotes, weatherNotes) ||
                other.weatherNotes == weatherNotes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, timestamp,
      temperature, humidity, ventilationStatus, weatherNotes);

  @override
  String toString() {
    return 'EnvironmentalReading(id: $id, batchId: $batchId, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, ventilationStatus: $ventilationStatus, weatherNotes: $weatherNotes)';
  }
}

/// @nodoc
abstract mixin class $EnvironmentalReadingCopyWith<$Res> {
  factory $EnvironmentalReadingCopyWith(EnvironmentalReading value,
          $Res Function(EnvironmentalReading) _then) =
      _$EnvironmentalReadingCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime timestamp,
      double temperature,
      double humidity,
      bool ventilationStatus,
      String? weatherNotes});
}

/// @nodoc
class _$EnvironmentalReadingCopyWithImpl<$Res>
    implements $EnvironmentalReadingCopyWith<$Res> {
  _$EnvironmentalReadingCopyWithImpl(this._self, this._then);

  final EnvironmentalReading _self;
  final $Res Function(EnvironmentalReading) _then;

  /// Create a copy of EnvironmentalReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? timestamp = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? ventilationStatus = null,
    Object? weatherNotes = freezed,
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
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      ventilationStatus: null == ventilationStatus
          ? _self.ventilationStatus
          : ventilationStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherNotes: freezed == weatherNotes
          ? _self.weatherNotes
          : weatherNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [EnvironmentalReading].
extension EnvironmentalReadingPatterns on EnvironmentalReading {
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
    TResult Function(_EnvironmentalReading value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading() when $default != null:
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
    TResult Function(_EnvironmentalReading value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading():
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
    TResult? Function(_EnvironmentalReading value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading() when $default != null:
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
            DateTime timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.timestamp,
            _that.temperature,
            _that.humidity,
            _that.ventilationStatus,
            _that.weatherNotes);
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
            DateTime timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading():
        return $default(
            _that.id,
            _that.batchId,
            _that.timestamp,
            _that.temperature,
            _that.humidity,
            _that.ventilationStatus,
            _that.weatherNotes);
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
            DateTime timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReading() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.timestamp,
            _that.temperature,
            _that.humidity,
            _that.ventilationStatus,
            _that.weatherNotes);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EnvironmentalReading implements EnvironmentalReading {
  const _EnvironmentalReading(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.temperature,
      required this.humidity,
      required this.ventilationStatus,
      this.weatherNotes});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime timestamp;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final bool ventilationStatus;
  @override
  final String? weatherNotes;

  /// Create a copy of EnvironmentalReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnvironmentalReadingCopyWith<_EnvironmentalReading> get copyWith =>
      __$EnvironmentalReadingCopyWithImpl<_EnvironmentalReading>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnvironmentalReading &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.ventilationStatus, ventilationStatus) ||
                other.ventilationStatus == ventilationStatus) &&
            (identical(other.weatherNotes, weatherNotes) ||
                other.weatherNotes == weatherNotes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, timestamp,
      temperature, humidity, ventilationStatus, weatherNotes);

  @override
  String toString() {
    return 'EnvironmentalReading(id: $id, batchId: $batchId, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, ventilationStatus: $ventilationStatus, weatherNotes: $weatherNotes)';
  }
}

/// @nodoc
abstract mixin class _$EnvironmentalReadingCopyWith<$Res>
    implements $EnvironmentalReadingCopyWith<$Res> {
  factory _$EnvironmentalReadingCopyWith(_EnvironmentalReading value,
          $Res Function(_EnvironmentalReading) _then) =
      __$EnvironmentalReadingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime timestamp,
      double temperature,
      double humidity,
      bool ventilationStatus,
      String? weatherNotes});
}

/// @nodoc
class __$EnvironmentalReadingCopyWithImpl<$Res>
    implements _$EnvironmentalReadingCopyWith<$Res> {
  __$EnvironmentalReadingCopyWithImpl(this._self, this._then);

  final _EnvironmentalReading _self;
  final $Res Function(_EnvironmentalReading) _then;

  /// Create a copy of EnvironmentalReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? timestamp = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? ventilationStatus = null,
    Object? weatherNotes = freezed,
  }) {
    return _then(_EnvironmentalReading(
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
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      ventilationStatus: null == ventilationStatus
          ? _self.ventilationStatus
          : ventilationStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherNotes: freezed == weatherNotes
          ? _self.weatherNotes
          : weatherNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$HealthObservation {
  String get id;
  String get batchId;
  DateTime get date;
  String get disease;
  String get symptoms;
  String get severity;

  /// Create a copy of HealthObservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HealthObservationCopyWith<HealthObservation> get copyWith =>
      _$HealthObservationCopyWithImpl<HealthObservation>(
          this as HealthObservation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HealthObservation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, date, disease, symptoms, severity);

  @override
  String toString() {
    return 'HealthObservation(id: $id, batchId: $batchId, date: $date, disease: $disease, symptoms: $symptoms, severity: $severity)';
  }
}

/// @nodoc
abstract mixin class $HealthObservationCopyWith<$Res> {
  factory $HealthObservationCopyWith(
          HealthObservation value, $Res Function(HealthObservation) _then) =
      _$HealthObservationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      String disease,
      String symptoms,
      String severity});
}

/// @nodoc
class _$HealthObservationCopyWithImpl<$Res>
    implements $HealthObservationCopyWith<$Res> {
  _$HealthObservationCopyWithImpl(this._self, this._then);

  final HealthObservation _self;
  final $Res Function(HealthObservation) _then;

  /// Create a copy of HealthObservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? disease = null,
    Object? symptoms = null,
    Object? severity = null,
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
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      disease: null == disease
          ? _self.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _self.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [HealthObservation].
extension HealthObservationPatterns on HealthObservation {
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
    TResult Function(_HealthObservation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HealthObservation() when $default != null:
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
    TResult Function(_HealthObservation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservation():
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
    TResult? Function(_HealthObservation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservation() when $default != null:
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
    TResult Function(String id, String batchId, DateTime date, String disease,
            String symptoms, String severity)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HealthObservation() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.disease,
            _that.symptoms, _that.severity);
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
    TResult Function(String id, String batchId, DateTime date, String disease,
            String symptoms, String severity)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservation():
        return $default(_that.id, _that.batchId, _that.date, _that.disease,
            _that.symptoms, _that.severity);
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
    TResult? Function(String id, String batchId, DateTime date, String disease,
            String symptoms, String severity)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservation() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.disease,
            _that.symptoms, _that.severity);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HealthObservation implements HealthObservation {
  const _HealthObservation(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.disease,
      required this.symptoms,
      required this.severity});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime date;
  @override
  final String disease;
  @override
  final String symptoms;
  @override
  final String severity;

  /// Create a copy of HealthObservation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HealthObservationCopyWith<_HealthObservation> get copyWith =>
      __$HealthObservationCopyWithImpl<_HealthObservation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HealthObservation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, date, disease, symptoms, severity);

  @override
  String toString() {
    return 'HealthObservation(id: $id, batchId: $batchId, date: $date, disease: $disease, symptoms: $symptoms, severity: $severity)';
  }
}

/// @nodoc
abstract mixin class _$HealthObservationCopyWith<$Res>
    implements $HealthObservationCopyWith<$Res> {
  factory _$HealthObservationCopyWith(
          _HealthObservation value, $Res Function(_HealthObservation) _then) =
      __$HealthObservationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      String disease,
      String symptoms,
      String severity});
}

/// @nodoc
class __$HealthObservationCopyWithImpl<$Res>
    implements _$HealthObservationCopyWith<$Res> {
  __$HealthObservationCopyWithImpl(this._self, this._then);

  final _HealthObservation _self;
  final $Res Function(_HealthObservation) _then;

  /// Create a copy of HealthObservation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? disease = null,
    Object? symptoms = null,
    Object? severity = null,
  }) {
    return _then(_HealthObservation(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      disease: null == disease
          ? _self.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _self.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Treatment {
  String get id;
  String get batchId;
  String get observationId;
  DateTime get date;
  String get medicine;
  double get dosage;
  String get recoveryStatus;
  String? get workerId;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TreatmentCopyWith<Treatment> get copyWith =>
      _$TreatmentCopyWithImpl<Treatment>(this as Treatment, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Treatment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.observationId, observationId) ||
                other.observationId == observationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.recoveryStatus, recoveryStatus) ||
                other.recoveryStatus == recoveryStatus) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, observationId, date,
      medicine, dosage, recoveryStatus, workerId);

  @override
  String toString() {
    return 'Treatment(id: $id, batchId: $batchId, observationId: $observationId, date: $date, medicine: $medicine, dosage: $dosage, recoveryStatus: $recoveryStatus, workerId: $workerId)';
  }
}

/// @nodoc
abstract mixin class $TreatmentCopyWith<$Res> {
  factory $TreatmentCopyWith(Treatment value, $Res Function(Treatment) _then) =
      _$TreatmentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String observationId,
      DateTime date,
      String medicine,
      double dosage,
      String recoveryStatus,
      String? workerId});
}

/// @nodoc
class _$TreatmentCopyWithImpl<$Res> implements $TreatmentCopyWith<$Res> {
  _$TreatmentCopyWithImpl(this._self, this._then);

  final Treatment _self;
  final $Res Function(Treatment) _then;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? observationId = null,
    Object? date = null,
    Object? medicine = null,
    Object? dosage = null,
    Object? recoveryStatus = null,
    Object? workerId = freezed,
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
      observationId: null == observationId
          ? _self.observationId
          : observationId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      medicine: null == medicine
          ? _self.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _self.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      recoveryStatus: null == recoveryStatus
          ? _self.recoveryStatus
          : recoveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Treatment].
extension TreatmentPatterns on Treatment {
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
    TResult Function(_Treatment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Treatment() when $default != null:
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
    TResult Function(_Treatment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Treatment():
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
    TResult? Function(_Treatment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Treatment() when $default != null:
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
            String observationId,
            DateTime date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Treatment() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.observationId,
            _that.date,
            _that.medicine,
            _that.dosage,
            _that.recoveryStatus,
            _that.workerId);
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
            String observationId,
            DateTime date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Treatment():
        return $default(
            _that.id,
            _that.batchId,
            _that.observationId,
            _that.date,
            _that.medicine,
            _that.dosage,
            _that.recoveryStatus,
            _that.workerId);
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
            String observationId,
            DateTime date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Treatment() when $default != null:
        return $default(
            _that.id,
            _that.batchId,
            _that.observationId,
            _that.date,
            _that.medicine,
            _that.dosage,
            _that.recoveryStatus,
            _that.workerId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Treatment implements Treatment {
  const _Treatment(
      {required this.id,
      required this.batchId,
      required this.observationId,
      required this.date,
      required this.medicine,
      required this.dosage,
      required this.recoveryStatus,
      this.workerId});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String observationId;
  @override
  final DateTime date;
  @override
  final String medicine;
  @override
  final double dosage;
  @override
  final String recoveryStatus;
  @override
  final String? workerId;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TreatmentCopyWith<_Treatment> get copyWith =>
      __$TreatmentCopyWithImpl<_Treatment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Treatment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.observationId, observationId) ||
                other.observationId == observationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.medicine, medicine) ||
                other.medicine == medicine) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.recoveryStatus, recoveryStatus) ||
                other.recoveryStatus == recoveryStatus) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, observationId, date,
      medicine, dosage, recoveryStatus, workerId);

  @override
  String toString() {
    return 'Treatment(id: $id, batchId: $batchId, observationId: $observationId, date: $date, medicine: $medicine, dosage: $dosage, recoveryStatus: $recoveryStatus, workerId: $workerId)';
  }
}

/// @nodoc
abstract mixin class _$TreatmentCopyWith<$Res>
    implements $TreatmentCopyWith<$Res> {
  factory _$TreatmentCopyWith(
          _Treatment value, $Res Function(_Treatment) _then) =
      __$TreatmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String observationId,
      DateTime date,
      String medicine,
      double dosage,
      String recoveryStatus,
      String? workerId});
}

/// @nodoc
class __$TreatmentCopyWithImpl<$Res> implements _$TreatmentCopyWith<$Res> {
  __$TreatmentCopyWithImpl(this._self, this._then);

  final _Treatment _self;
  final $Res Function(_Treatment) _then;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? observationId = null,
    Object? date = null,
    Object? medicine = null,
    Object? dosage = null,
    Object? recoveryStatus = null,
    Object? workerId = freezed,
  }) {
    return _then(_Treatment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      observationId: null == observationId
          ? _self.observationId
          : observationId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      medicine: null == medicine
          ? _self.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _self.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as double,
      recoveryStatus: null == recoveryStatus
          ? _self.recoveryStatus
          : recoveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$MortalityRecord {
  String get id;
  String get batchId;
  DateTime get date;
  int get deadCount;
  String get reason;
  String? get workerId;
  String? get remarks;

  /// Create a copy of MortalityRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MortalityRecordCopyWith<MortalityRecord> get copyWith =>
      _$MortalityRecordCopyWithImpl<MortalityRecord>(
          this as MortalityRecord, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MortalityRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.deadCount, deadCount) ||
                other.deadCount == deadCount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, batchId, date, deadCount, reason, workerId, remarks);

  @override
  String toString() {
    return 'MortalityRecord(id: $id, batchId: $batchId, date: $date, deadCount: $deadCount, reason: $reason, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $MortalityRecordCopyWith<$Res> {
  factory $MortalityRecordCopyWith(
          MortalityRecord value, $Res Function(MortalityRecord) _then) =
      _$MortalityRecordCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      int deadCount,
      String reason,
      String? workerId,
      String? remarks});
}

/// @nodoc
class _$MortalityRecordCopyWithImpl<$Res>
    implements $MortalityRecordCopyWith<$Res> {
  _$MortalityRecordCopyWithImpl(this._self, this._then);

  final MortalityRecord _self;
  final $Res Function(MortalityRecord) _then;

  /// Create a copy of MortalityRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? deadCount = null,
    Object? reason = null,
    Object? workerId = freezed,
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
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadCount: null == deadCount
          ? _self.deadCount
          : deadCount // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MortalityRecord].
extension MortalityRecordPatterns on MortalityRecord {
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
    TResult Function(_MortalityRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord() when $default != null:
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
    TResult Function(_MortalityRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord():
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
    TResult? Function(_MortalityRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord() when $default != null:
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
    TResult Function(String id, String batchId, DateTime date, int deadCount,
            String reason, String? workerId, String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.deadCount,
            _that.reason, _that.workerId, _that.remarks);
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
    TResult Function(String id, String batchId, DateTime date, int deadCount,
            String reason, String? workerId, String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord():
        return $default(_that.id, _that.batchId, _that.date, _that.deadCount,
            _that.reason, _that.workerId, _that.remarks);
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
    TResult? Function(String id, String batchId, DateTime date, int deadCount,
            String reason, String? workerId, String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecord() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.deadCount,
            _that.reason, _that.workerId, _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MortalityRecord implements MortalityRecord {
  const _MortalityRecord(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.deadCount,
      required this.reason,
      this.workerId,
      this.remarks});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final DateTime date;
  @override
  final int deadCount;
  @override
  final String reason;
  @override
  final String? workerId;
  @override
  final String? remarks;

  /// Create a copy of MortalityRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MortalityRecordCopyWith<_MortalityRecord> get copyWith =>
      __$MortalityRecordCopyWithImpl<_MortalityRecord>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MortalityRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.deadCount, deadCount) ||
                other.deadCount == deadCount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, batchId, date, deadCount, reason, workerId, remarks);

  @override
  String toString() {
    return 'MortalityRecord(id: $id, batchId: $batchId, date: $date, deadCount: $deadCount, reason: $reason, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$MortalityRecordCopyWith<$Res>
    implements $MortalityRecordCopyWith<$Res> {
  factory _$MortalityRecordCopyWith(
          _MortalityRecord value, $Res Function(_MortalityRecord) _then) =
      __$MortalityRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      DateTime date,
      int deadCount,
      String reason,
      String? workerId,
      String? remarks});
}

/// @nodoc
class __$MortalityRecordCopyWithImpl<$Res>
    implements _$MortalityRecordCopyWith<$Res> {
  __$MortalityRecordCopyWithImpl(this._self, this._then);

  final _MortalityRecord _self;
  final $Res Function(_MortalityRecord) _then;

  /// Create a copy of MortalityRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? date = null,
    Object? deadCount = null,
    Object? reason = null,
    Object? workerId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_MortalityRecord(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deadCount: null == deadCount
          ? _self.deadCount
          : deadCount // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: freezed == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$StageProgress {
  String get id;
  String get batchId;
  InstarStage get instar;
  DateTime get dateStarted;
  DateTime? get dateCompleted;
  DateTime? get expectedNextStage;

  /// Create a copy of StageProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StageProgressCopyWith<StageProgress> get copyWith =>
      _$StageProgressCopyWithImpl<StageProgress>(
          this as StageProgress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StageProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.instar, instar) || other.instar == instar) &&
            (identical(other.dateStarted, dateStarted) ||
                other.dateStarted == dateStarted) &&
            (identical(other.dateCompleted, dateCompleted) ||
                other.dateCompleted == dateCompleted) &&
            (identical(other.expectedNextStage, expectedNextStage) ||
                other.expectedNextStage == expectedNextStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, instar, dateStarted,
      dateCompleted, expectedNextStage);

  @override
  String toString() {
    return 'StageProgress(id: $id, batchId: $batchId, instar: $instar, dateStarted: $dateStarted, dateCompleted: $dateCompleted, expectedNextStage: $expectedNextStage)';
  }
}

/// @nodoc
abstract mixin class $StageProgressCopyWith<$Res> {
  factory $StageProgressCopyWith(
          StageProgress value, $Res Function(StageProgress) _then) =
      _$StageProgressCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      InstarStage instar,
      DateTime dateStarted,
      DateTime? dateCompleted,
      DateTime? expectedNextStage});
}

/// @nodoc
class _$StageProgressCopyWithImpl<$Res>
    implements $StageProgressCopyWith<$Res> {
  _$StageProgressCopyWithImpl(this._self, this._then);

  final StageProgress _self;
  final $Res Function(StageProgress) _then;

  /// Create a copy of StageProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? instar = null,
    Object? dateStarted = null,
    Object? dateCompleted = freezed,
    Object? expectedNextStage = freezed,
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
      instar: null == instar
          ? _self.instar
          : instar // ignore: cast_nullable_to_non_nullable
              as InstarStage,
      dateStarted: null == dateStarted
          ? _self.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCompleted: freezed == dateCompleted
          ? _self.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedNextStage: freezed == expectedNextStage
          ? _self.expectedNextStage
          : expectedNextStage // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StageProgress].
extension StageProgressPatterns on StageProgress {
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
    TResult Function(_StageProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StageProgress() when $default != null:
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
    TResult Function(_StageProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgress():
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
    TResult? Function(_StageProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgress() when $default != null:
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
            InstarStage instar,
            DateTime dateStarted,
            DateTime? dateCompleted,
            DateTime? expectedNextStage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StageProgress() when $default != null:
        return $default(_that.id, _that.batchId, _that.instar,
            _that.dateStarted, _that.dateCompleted, _that.expectedNextStage);
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
            InstarStage instar,
            DateTime dateStarted,
            DateTime? dateCompleted,
            DateTime? expectedNextStage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgress():
        return $default(_that.id, _that.batchId, _that.instar,
            _that.dateStarted, _that.dateCompleted, _that.expectedNextStage);
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
            InstarStage instar,
            DateTime dateStarted,
            DateTime? dateCompleted,
            DateTime? expectedNextStage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgress() when $default != null:
        return $default(_that.id, _that.batchId, _that.instar,
            _that.dateStarted, _that.dateCompleted, _that.expectedNextStage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StageProgress implements StageProgress {
  const _StageProgress(
      {required this.id,
      required this.batchId,
      required this.instar,
      required this.dateStarted,
      this.dateCompleted,
      this.expectedNextStage});

  @override
  final String id;
  @override
  final String batchId;
  @override
  final InstarStage instar;
  @override
  final DateTime dateStarted;
  @override
  final DateTime? dateCompleted;
  @override
  final DateTime? expectedNextStage;

  /// Create a copy of StageProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StageProgressCopyWith<_StageProgress> get copyWith =>
      __$StageProgressCopyWithImpl<_StageProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StageProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.instar, instar) || other.instar == instar) &&
            (identical(other.dateStarted, dateStarted) ||
                other.dateStarted == dateStarted) &&
            (identical(other.dateCompleted, dateCompleted) ||
                other.dateCompleted == dateCompleted) &&
            (identical(other.expectedNextStage, expectedNextStage) ||
                other.expectedNextStage == expectedNextStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, instar, dateStarted,
      dateCompleted, expectedNextStage);

  @override
  String toString() {
    return 'StageProgress(id: $id, batchId: $batchId, instar: $instar, dateStarted: $dateStarted, dateCompleted: $dateCompleted, expectedNextStage: $expectedNextStage)';
  }
}

/// @nodoc
abstract mixin class _$StageProgressCopyWith<$Res>
    implements $StageProgressCopyWith<$Res> {
  factory _$StageProgressCopyWith(
          _StageProgress value, $Res Function(_StageProgress) _then) =
      __$StageProgressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      InstarStage instar,
      DateTime dateStarted,
      DateTime? dateCompleted,
      DateTime? expectedNextStage});
}

/// @nodoc
class __$StageProgressCopyWithImpl<$Res>
    implements _$StageProgressCopyWith<$Res> {
  __$StageProgressCopyWithImpl(this._self, this._then);

  final _StageProgress _self;
  final $Res Function(_StageProgress) _then;

  /// Create a copy of StageProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? instar = null,
    Object? dateStarted = null,
    Object? dateCompleted = freezed,
    Object? expectedNextStage = freezed,
  }) {
    return _then(_StageProgress(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      instar: null == instar
          ? _self.instar
          : instar // ignore: cast_nullable_to_non_nullable
              as InstarStage,
      dateStarted: null == dateStarted
          ? _self.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCompleted: freezed == dateCompleted
          ? _self.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expectedNextStage: freezed == expectedNextStage
          ? _self.expectedNextStage
          : expectedNextStage // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
