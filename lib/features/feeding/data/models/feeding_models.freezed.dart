// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedingLogModel {
  String get id;
  String get batchId;
  String get date;
  String get time;
  String get leafType;
  String get leafAge;
  double get leafQuantity;
  int get feedingRound;
  String? get workerId;
  String? get remarks;

  /// Create a copy of FeedingLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedingLogModelCopyWith<FeedingLogModel> get copyWith =>
      _$FeedingLogModelCopyWithImpl<FeedingLogModel>(
          this as FeedingLogModel, _$identity);

  /// Serializes this FeedingLogModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedingLogModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, date, time,
      leafType, leafAge, leafQuantity, feedingRound, workerId, remarks);

  @override
  String toString() {
    return 'FeedingLogModel(id: $id, batchId: $batchId, date: $date, time: $time, leafType: $leafType, leafAge: $leafAge, leafQuantity: $leafQuantity, feedingRound: $feedingRound, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $FeedingLogModelCopyWith<$Res> {
  factory $FeedingLogModelCopyWith(
          FeedingLogModel value, $Res Function(FeedingLogModel) _then) =
      _$FeedingLogModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      String time,
      String leafType,
      String leafAge,
      double leafQuantity,
      int feedingRound,
      String? workerId,
      String? remarks});
}

/// @nodoc
class _$FeedingLogModelCopyWithImpl<$Res>
    implements $FeedingLogModelCopyWith<$Res> {
  _$FeedingLogModelCopyWithImpl(this._self, this._then);

  final FeedingLogModel _self;
  final $Res Function(FeedingLogModel) _then;

  /// Create a copy of FeedingLogModel
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
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      leafType: null == leafType
          ? _self.leafType
          : leafType // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [FeedingLogModel].
extension FeedingLogModelPatterns on FeedingLogModel {
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
    TResult Function(_FeedingLogModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedingLogModel() when $default != null:
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
    TResult Function(_FeedingLogModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLogModel():
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
    TResult? Function(_FeedingLogModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLogModel() when $default != null:
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
            String date,
            String time,
            String leafType,
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
      case _FeedingLogModel() when $default != null:
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
            String date,
            String time,
            String leafType,
            String leafAge,
            double leafQuantity,
            int feedingRound,
            String? workerId,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLogModel():
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
            String date,
            String time,
            String leafType,
            String leafAge,
            double leafQuantity,
            int feedingRound,
            String? workerId,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedingLogModel() when $default != null:
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
@JsonSerializable()
class _FeedingLogModel implements FeedingLogModel {
  const _FeedingLogModel(
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
  factory _FeedingLogModel.fromJson(Map<String, dynamic> json) =>
      _$FeedingLogModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String date;
  @override
  final String time;
  @override
  final String leafType;
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

  /// Create a copy of FeedingLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedingLogModelCopyWith<_FeedingLogModel> get copyWith =>
      __$FeedingLogModelCopyWithImpl<_FeedingLogModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeedingLogModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedingLogModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, date, time,
      leafType, leafAge, leafQuantity, feedingRound, workerId, remarks);

  @override
  String toString() {
    return 'FeedingLogModel(id: $id, batchId: $batchId, date: $date, time: $time, leafType: $leafType, leafAge: $leafAge, leafQuantity: $leafQuantity, feedingRound: $feedingRound, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$FeedingLogModelCopyWith<$Res>
    implements $FeedingLogModelCopyWith<$Res> {
  factory _$FeedingLogModelCopyWith(
          _FeedingLogModel value, $Res Function(_FeedingLogModel) _then) =
      __$FeedingLogModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      String time,
      String leafType,
      String leafAge,
      double leafQuantity,
      int feedingRound,
      String? workerId,
      String? remarks});
}

/// @nodoc
class __$FeedingLogModelCopyWithImpl<$Res>
    implements _$FeedingLogModelCopyWith<$Res> {
  __$FeedingLogModelCopyWithImpl(this._self, this._then);

  final _FeedingLogModel _self;
  final $Res Function(_FeedingLogModel) _then;

  /// Create a copy of FeedingLogModel
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
    return _then(_FeedingLogModel(
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
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      leafType: null == leafType
          ? _self.leafType
          : leafType // ignore: cast_nullable_to_non_nullable
              as String,
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
mixin _$EnvironmentalReadingModel {
  String get id;
  String get batchId;
  String get timestamp;
  double get temperature;
  double get humidity;
  bool get ventilationStatus;
  String? get weatherNotes;

  /// Create a copy of EnvironmentalReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnvironmentalReadingModelCopyWith<EnvironmentalReadingModel> get copyWith =>
      _$EnvironmentalReadingModelCopyWithImpl<EnvironmentalReadingModel>(
          this as EnvironmentalReadingModel, _$identity);

  /// Serializes this EnvironmentalReadingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnvironmentalReadingModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, timestamp,
      temperature, humidity, ventilationStatus, weatherNotes);

  @override
  String toString() {
    return 'EnvironmentalReadingModel(id: $id, batchId: $batchId, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, ventilationStatus: $ventilationStatus, weatherNotes: $weatherNotes)';
  }
}

/// @nodoc
abstract mixin class $EnvironmentalReadingModelCopyWith<$Res> {
  factory $EnvironmentalReadingModelCopyWith(EnvironmentalReadingModel value,
          $Res Function(EnvironmentalReadingModel) _then) =
      _$EnvironmentalReadingModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String timestamp,
      double temperature,
      double humidity,
      bool ventilationStatus,
      String? weatherNotes});
}

/// @nodoc
class _$EnvironmentalReadingModelCopyWithImpl<$Res>
    implements $EnvironmentalReadingModelCopyWith<$Res> {
  _$EnvironmentalReadingModelCopyWithImpl(this._self, this._then);

  final EnvironmentalReadingModel _self;
  final $Res Function(EnvironmentalReadingModel) _then;

  /// Create a copy of EnvironmentalReadingModel
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
              as String,
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

/// Adds pattern-matching-related methods to [EnvironmentalReadingModel].
extension EnvironmentalReadingModelPatterns on EnvironmentalReadingModel {
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
    TResult Function(_EnvironmentalReadingModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel() when $default != null:
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
    TResult Function(_EnvironmentalReadingModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel():
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
    TResult? Function(_EnvironmentalReadingModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel() when $default != null:
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
            String timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel() when $default != null:
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
            String timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel():
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
            String timestamp,
            double temperature,
            double humidity,
            bool ventilationStatus,
            String? weatherNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnvironmentalReadingModel() when $default != null:
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
@JsonSerializable()
class _EnvironmentalReadingModel implements EnvironmentalReadingModel {
  const _EnvironmentalReadingModel(
      {required this.id,
      required this.batchId,
      required this.timestamp,
      required this.temperature,
      required this.humidity,
      required this.ventilationStatus,
      this.weatherNotes});
  factory _EnvironmentalReadingModel.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentalReadingModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String timestamp;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final bool ventilationStatus;
  @override
  final String? weatherNotes;

  /// Create a copy of EnvironmentalReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnvironmentalReadingModelCopyWith<_EnvironmentalReadingModel>
      get copyWith =>
          __$EnvironmentalReadingModelCopyWithImpl<_EnvironmentalReadingModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnvironmentalReadingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnvironmentalReadingModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, timestamp,
      temperature, humidity, ventilationStatus, weatherNotes);

  @override
  String toString() {
    return 'EnvironmentalReadingModel(id: $id, batchId: $batchId, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, ventilationStatus: $ventilationStatus, weatherNotes: $weatherNotes)';
  }
}

/// @nodoc
abstract mixin class _$EnvironmentalReadingModelCopyWith<$Res>
    implements $EnvironmentalReadingModelCopyWith<$Res> {
  factory _$EnvironmentalReadingModelCopyWith(_EnvironmentalReadingModel value,
          $Res Function(_EnvironmentalReadingModel) _then) =
      __$EnvironmentalReadingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String timestamp,
      double temperature,
      double humidity,
      bool ventilationStatus,
      String? weatherNotes});
}

/// @nodoc
class __$EnvironmentalReadingModelCopyWithImpl<$Res>
    implements _$EnvironmentalReadingModelCopyWith<$Res> {
  __$EnvironmentalReadingModelCopyWithImpl(this._self, this._then);

  final _EnvironmentalReadingModel _self;
  final $Res Function(_EnvironmentalReadingModel) _then;

  /// Create a copy of EnvironmentalReadingModel
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
    return _then(_EnvironmentalReadingModel(
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
mixin _$HealthObservationModel {
  String get id;
  String get batchId;
  String get date;
  String get disease;
  String get symptoms;
  String get severity;

  /// Create a copy of HealthObservationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HealthObservationModelCopyWith<HealthObservationModel> get copyWith =>
      _$HealthObservationModelCopyWithImpl<HealthObservationModel>(
          this as HealthObservationModel, _$identity);

  /// Serializes this HealthObservationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HealthObservationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, date, disease, symptoms, severity);

  @override
  String toString() {
    return 'HealthObservationModel(id: $id, batchId: $batchId, date: $date, disease: $disease, symptoms: $symptoms, severity: $severity)';
  }
}

/// @nodoc
abstract mixin class $HealthObservationModelCopyWith<$Res> {
  factory $HealthObservationModelCopyWith(HealthObservationModel value,
          $Res Function(HealthObservationModel) _then) =
      _$HealthObservationModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      String disease,
      String symptoms,
      String severity});
}

/// @nodoc
class _$HealthObservationModelCopyWithImpl<$Res>
    implements $HealthObservationModelCopyWith<$Res> {
  _$HealthObservationModelCopyWithImpl(this._self, this._then);

  final HealthObservationModel _self;
  final $Res Function(HealthObservationModel) _then;

  /// Create a copy of HealthObservationModel
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
              as String,
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

/// Adds pattern-matching-related methods to [HealthObservationModel].
extension HealthObservationModelPatterns on HealthObservationModel {
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
    TResult Function(_HealthObservationModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel() when $default != null:
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
    TResult Function(_HealthObservationModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel():
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
    TResult? Function(_HealthObservationModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel() when $default != null:
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
    TResult Function(String id, String batchId, String date, String disease,
            String symptoms, String severity)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel() when $default != null:
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
    TResult Function(String id, String batchId, String date, String disease,
            String symptoms, String severity)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel():
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
    TResult? Function(String id, String batchId, String date, String disease,
            String symptoms, String severity)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HealthObservationModel() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.disease,
            _that.symptoms, _that.severity);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HealthObservationModel implements HealthObservationModel {
  const _HealthObservationModel(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.disease,
      required this.symptoms,
      required this.severity});
  factory _HealthObservationModel.fromJson(Map<String, dynamic> json) =>
      _$HealthObservationModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String date;
  @override
  final String disease;
  @override
  final String symptoms;
  @override
  final String severity;

  /// Create a copy of HealthObservationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HealthObservationModelCopyWith<_HealthObservationModel> get copyWith =>
      __$HealthObservationModelCopyWithImpl<_HealthObservationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HealthObservationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HealthObservationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, batchId, date, disease, symptoms, severity);

  @override
  String toString() {
    return 'HealthObservationModel(id: $id, batchId: $batchId, date: $date, disease: $disease, symptoms: $symptoms, severity: $severity)';
  }
}

/// @nodoc
abstract mixin class _$HealthObservationModelCopyWith<$Res>
    implements $HealthObservationModelCopyWith<$Res> {
  factory _$HealthObservationModelCopyWith(_HealthObservationModel value,
          $Res Function(_HealthObservationModel) _then) =
      __$HealthObservationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      String disease,
      String symptoms,
      String severity});
}

/// @nodoc
class __$HealthObservationModelCopyWithImpl<$Res>
    implements _$HealthObservationModelCopyWith<$Res> {
  __$HealthObservationModelCopyWithImpl(this._self, this._then);

  final _HealthObservationModel _self;
  final $Res Function(_HealthObservationModel) _then;

  /// Create a copy of HealthObservationModel
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
    return _then(_HealthObservationModel(
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
              as String,
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
mixin _$TreatmentModel {
  String get id;
  String get batchId;
  String get observationId;
  String get date;
  String get medicine;
  double get dosage;
  String get recoveryStatus;
  String? get workerId;

  /// Create a copy of TreatmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TreatmentModelCopyWith<TreatmentModel> get copyWith =>
      _$TreatmentModelCopyWithImpl<TreatmentModel>(
          this as TreatmentModel, _$identity);

  /// Serializes this TreatmentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TreatmentModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, observationId, date,
      medicine, dosage, recoveryStatus, workerId);

  @override
  String toString() {
    return 'TreatmentModel(id: $id, batchId: $batchId, observationId: $observationId, date: $date, medicine: $medicine, dosage: $dosage, recoveryStatus: $recoveryStatus, workerId: $workerId)';
  }
}

/// @nodoc
abstract mixin class $TreatmentModelCopyWith<$Res> {
  factory $TreatmentModelCopyWith(
          TreatmentModel value, $Res Function(TreatmentModel) _then) =
      _$TreatmentModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String observationId,
      String date,
      String medicine,
      double dosage,
      String recoveryStatus,
      String? workerId});
}

/// @nodoc
class _$TreatmentModelCopyWithImpl<$Res>
    implements $TreatmentModelCopyWith<$Res> {
  _$TreatmentModelCopyWithImpl(this._self, this._then);

  final TreatmentModel _self;
  final $Res Function(TreatmentModel) _then;

  /// Create a copy of TreatmentModel
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
              as String,
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

/// Adds pattern-matching-related methods to [TreatmentModel].
extension TreatmentModelPatterns on TreatmentModel {
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
    TResult Function(_TreatmentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel() when $default != null:
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
    TResult Function(_TreatmentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel():
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
    TResult? Function(_TreatmentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel() when $default != null:
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
            String date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel() when $default != null:
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
            String date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel():
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
            String date,
            String medicine,
            double dosage,
            String recoveryStatus,
            String? workerId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TreatmentModel() when $default != null:
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
@JsonSerializable()
class _TreatmentModel implements TreatmentModel {
  const _TreatmentModel(
      {required this.id,
      required this.batchId,
      required this.observationId,
      required this.date,
      required this.medicine,
      required this.dosage,
      required this.recoveryStatus,
      this.workerId});
  factory _TreatmentModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String observationId;
  @override
  final String date;
  @override
  final String medicine;
  @override
  final double dosage;
  @override
  final String recoveryStatus;
  @override
  final String? workerId;

  /// Create a copy of TreatmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TreatmentModelCopyWith<_TreatmentModel> get copyWith =>
      __$TreatmentModelCopyWithImpl<_TreatmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TreatmentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TreatmentModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, observationId, date,
      medicine, dosage, recoveryStatus, workerId);

  @override
  String toString() {
    return 'TreatmentModel(id: $id, batchId: $batchId, observationId: $observationId, date: $date, medicine: $medicine, dosage: $dosage, recoveryStatus: $recoveryStatus, workerId: $workerId)';
  }
}

/// @nodoc
abstract mixin class _$TreatmentModelCopyWith<$Res>
    implements $TreatmentModelCopyWith<$Res> {
  factory _$TreatmentModelCopyWith(
          _TreatmentModel value, $Res Function(_TreatmentModel) _then) =
      __$TreatmentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String observationId,
      String date,
      String medicine,
      double dosage,
      String recoveryStatus,
      String? workerId});
}

/// @nodoc
class __$TreatmentModelCopyWithImpl<$Res>
    implements _$TreatmentModelCopyWith<$Res> {
  __$TreatmentModelCopyWithImpl(this._self, this._then);

  final _TreatmentModel _self;
  final $Res Function(_TreatmentModel) _then;

  /// Create a copy of TreatmentModel
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
    return _then(_TreatmentModel(
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
              as String,
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
mixin _$MortalityRecordModel {
  String get id;
  String get batchId;
  String get date;
  int get deadCount;
  String get reason;
  String? get workerId;
  String? get remarks;

  /// Create a copy of MortalityRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MortalityRecordModelCopyWith<MortalityRecordModel> get copyWith =>
      _$MortalityRecordModelCopyWithImpl<MortalityRecordModel>(
          this as MortalityRecordModel, _$identity);

  /// Serializes this MortalityRecordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MortalityRecordModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, batchId, date, deadCount, reason, workerId, remarks);

  @override
  String toString() {
    return 'MortalityRecordModel(id: $id, batchId: $batchId, date: $date, deadCount: $deadCount, reason: $reason, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $MortalityRecordModelCopyWith<$Res> {
  factory $MortalityRecordModelCopyWith(MortalityRecordModel value,
          $Res Function(MortalityRecordModel) _then) =
      _$MortalityRecordModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      int deadCount,
      String reason,
      String? workerId,
      String? remarks});
}

/// @nodoc
class _$MortalityRecordModelCopyWithImpl<$Res>
    implements $MortalityRecordModelCopyWith<$Res> {
  _$MortalityRecordModelCopyWithImpl(this._self, this._then);

  final MortalityRecordModel _self;
  final $Res Function(MortalityRecordModel) _then;

  /// Create a copy of MortalityRecordModel
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
              as String,
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

/// Adds pattern-matching-related methods to [MortalityRecordModel].
extension MortalityRecordModelPatterns on MortalityRecordModel {
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
    TResult Function(_MortalityRecordModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel() when $default != null:
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
    TResult Function(_MortalityRecordModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel():
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
    TResult? Function(_MortalityRecordModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel() when $default != null:
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
    TResult Function(String id, String batchId, String date, int deadCount,
            String reason, String? workerId, String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel() when $default != null:
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
    TResult Function(String id, String batchId, String date, int deadCount,
            String reason, String? workerId, String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel():
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
    TResult? Function(String id, String batchId, String date, int deadCount,
            String reason, String? workerId, String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MortalityRecordModel() when $default != null:
        return $default(_that.id, _that.batchId, _that.date, _that.deadCount,
            _that.reason, _that.workerId, _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MortalityRecordModel implements MortalityRecordModel {
  const _MortalityRecordModel(
      {required this.id,
      required this.batchId,
      required this.date,
      required this.deadCount,
      required this.reason,
      this.workerId,
      this.remarks});
  factory _MortalityRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MortalityRecordModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String date;
  @override
  final int deadCount;
  @override
  final String reason;
  @override
  final String? workerId;
  @override
  final String? remarks;

  /// Create a copy of MortalityRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MortalityRecordModelCopyWith<_MortalityRecordModel> get copyWith =>
      __$MortalityRecordModelCopyWithImpl<_MortalityRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MortalityRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MortalityRecordModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, batchId, date, deadCount, reason, workerId, remarks);

  @override
  String toString() {
    return 'MortalityRecordModel(id: $id, batchId: $batchId, date: $date, deadCount: $deadCount, reason: $reason, workerId: $workerId, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$MortalityRecordModelCopyWith<$Res>
    implements $MortalityRecordModelCopyWith<$Res> {
  factory _$MortalityRecordModelCopyWith(_MortalityRecordModel value,
          $Res Function(_MortalityRecordModel) _then) =
      __$MortalityRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String date,
      int deadCount,
      String reason,
      String? workerId,
      String? remarks});
}

/// @nodoc
class __$MortalityRecordModelCopyWithImpl<$Res>
    implements _$MortalityRecordModelCopyWith<$Res> {
  __$MortalityRecordModelCopyWithImpl(this._self, this._then);

  final _MortalityRecordModel _self;
  final $Res Function(_MortalityRecordModel) _then;

  /// Create a copy of MortalityRecordModel
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
    return _then(_MortalityRecordModel(
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
              as String,
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
mixin _$StageProgressModel {
  String get id;
  String get batchId;
  String get instar;
  String get dateStarted;
  String? get dateCompleted;
  String? get expectedNextStage;

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StageProgressModelCopyWith<StageProgressModel> get copyWith =>
      _$StageProgressModelCopyWithImpl<StageProgressModel>(
          this as StageProgressModel, _$identity);

  /// Serializes this StageProgressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StageProgressModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, instar, dateStarted,
      dateCompleted, expectedNextStage);

  @override
  String toString() {
    return 'StageProgressModel(id: $id, batchId: $batchId, instar: $instar, dateStarted: $dateStarted, dateCompleted: $dateCompleted, expectedNextStage: $expectedNextStage)';
  }
}

/// @nodoc
abstract mixin class $StageProgressModelCopyWith<$Res> {
  factory $StageProgressModelCopyWith(
          StageProgressModel value, $Res Function(StageProgressModel) _then) =
      _$StageProgressModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String batchId,
      String instar,
      String dateStarted,
      String? dateCompleted,
      String? expectedNextStage});
}

/// @nodoc
class _$StageProgressModelCopyWithImpl<$Res>
    implements $StageProgressModelCopyWith<$Res> {
  _$StageProgressModelCopyWithImpl(this._self, this._then);

  final StageProgressModel _self;
  final $Res Function(StageProgressModel) _then;

  /// Create a copy of StageProgressModel
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
              as String,
      dateStarted: null == dateStarted
          ? _self.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      dateCompleted: freezed == dateCompleted
          ? _self.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedNextStage: freezed == expectedNextStage
          ? _self.expectedNextStage
          : expectedNextStage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StageProgressModel].
extension StageProgressModelPatterns on StageProgressModel {
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
    TResult Function(_StageProgressModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel() when $default != null:
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
    TResult Function(_StageProgressModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel():
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
    TResult? Function(_StageProgressModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel() when $default != null:
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
            String instar,
            String dateStarted,
            String? dateCompleted,
            String? expectedNextStage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel() when $default != null:
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
            String instar,
            String dateStarted,
            String? dateCompleted,
            String? expectedNextStage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel():
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
            String instar,
            String dateStarted,
            String? dateCompleted,
            String? expectedNextStage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StageProgressModel() when $default != null:
        return $default(_that.id, _that.batchId, _that.instar,
            _that.dateStarted, _that.dateCompleted, _that.expectedNextStage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StageProgressModel implements StageProgressModel {
  const _StageProgressModel(
      {required this.id,
      required this.batchId,
      required this.instar,
      required this.dateStarted,
      this.dateCompleted,
      this.expectedNextStage});
  factory _StageProgressModel.fromJson(Map<String, dynamic> json) =>
      _$StageProgressModelFromJson(json);

  @override
  final String id;
  @override
  final String batchId;
  @override
  final String instar;
  @override
  final String dateStarted;
  @override
  final String? dateCompleted;
  @override
  final String? expectedNextStage;

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StageProgressModelCopyWith<_StageProgressModel> get copyWith =>
      __$StageProgressModelCopyWithImpl<_StageProgressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StageProgressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StageProgressModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, batchId, instar, dateStarted,
      dateCompleted, expectedNextStage);

  @override
  String toString() {
    return 'StageProgressModel(id: $id, batchId: $batchId, instar: $instar, dateStarted: $dateStarted, dateCompleted: $dateCompleted, expectedNextStage: $expectedNextStage)';
  }
}

/// @nodoc
abstract mixin class _$StageProgressModelCopyWith<$Res>
    implements $StageProgressModelCopyWith<$Res> {
  factory _$StageProgressModelCopyWith(
          _StageProgressModel value, $Res Function(_StageProgressModel) _then) =
      __$StageProgressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String batchId,
      String instar,
      String dateStarted,
      String? dateCompleted,
      String? expectedNextStage});
}

/// @nodoc
class __$StageProgressModelCopyWithImpl<$Res>
    implements _$StageProgressModelCopyWith<$Res> {
  __$StageProgressModelCopyWithImpl(this._self, this._then);

  final _StageProgressModel _self;
  final $Res Function(_StageProgressModel) _then;

  /// Create a copy of StageProgressModel
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
    return _then(_StageProgressModel(
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
              as String,
      dateStarted: null == dateStarted
          ? _self.dateStarted
          : dateStarted // ignore: cast_nullable_to_non_nullable
              as String,
      dateCompleted: freezed == dateCompleted
          ? _self.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedNextStage: freezed == expectedNextStage
          ? _self.expectedNextStage
          : expectedNextStage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
