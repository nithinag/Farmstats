// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feeding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedingState()';
  }
}

/// @nodoc
class $FeedingStateCopyWith<$Res> {
  $FeedingStateCopyWith(FeedingState _, $Res Function(FeedingState) __);
}

/// Adds pattern-matching-related methods to [FeedingState].
extension FeedingStatePatterns on FeedingState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedingStateInitial value)? initial,
    TResult Function(FeedingStateLoading value)? loading,
    TResult Function(FeedingStateData value)? data,
    TResult Function(FeedingStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial() when initial != null:
        return initial(_that);
      case FeedingStateLoading() when loading != null:
        return loading(_that);
      case FeedingStateData() when data != null:
        return data(_that);
      case FeedingStateError() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(FeedingStateInitial value) initial,
    required TResult Function(FeedingStateLoading value) loading,
    required TResult Function(FeedingStateData value) data,
    required TResult Function(FeedingStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial():
        return initial(_that);
      case FeedingStateLoading():
        return loading(_that);
      case FeedingStateData():
        return data(_that);
      case FeedingStateError():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedingStateInitial value)? initial,
    TResult? Function(FeedingStateLoading value)? loading,
    TResult? Function(FeedingStateData value)? data,
    TResult? Function(FeedingStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial() when initial != null:
        return initial(_that);
      case FeedingStateLoading() when loading != null:
        return loading(_that);
      case FeedingStateData() when data != null:
        return data(_that);
      case FeedingStateError() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedingLog> feedings, List<MortalityRecord> mortality,
            List<EnvironmentalReading> environments)?
        data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial() when initial != null:
        return initial();
      case FeedingStateLoading() when loading != null:
        return loading();
      case FeedingStateData() when data != null:
        return data(_that.feedings, _that.mortality, _that.environments);
      case FeedingStateError() when error != null:
        return error(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<FeedingLog> feedings,
            List<MortalityRecord> mortality,
            List<EnvironmentalReading> environments)
        data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial():
        return initial();
      case FeedingStateLoading():
        return loading();
      case FeedingStateData():
        return data(_that.feedings, _that.mortality, _that.environments);
      case FeedingStateError():
        return error(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FeedingLog> feedings,
            List<MortalityRecord> mortality,
            List<EnvironmentalReading> environments)?
        data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case FeedingStateInitial() when initial != null:
        return initial();
      case FeedingStateLoading() when loading != null:
        return loading();
      case FeedingStateData() when data != null:
        return data(_that.feedings, _that.mortality, _that.environments);
      case FeedingStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FeedingStateInitial implements FeedingState {
  const FeedingStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedingStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedingState.initial()';
  }
}

/// @nodoc

class FeedingStateLoading implements FeedingState {
  const FeedingStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FeedingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FeedingState.loading()';
  }
}

/// @nodoc

class FeedingStateData implements FeedingState {
  const FeedingStateData(
      {required final List<FeedingLog> feedings,
      required final List<MortalityRecord> mortality,
      required final List<EnvironmentalReading> environments})
      : _feedings = feedings,
        _mortality = mortality,
        _environments = environments;

  final List<FeedingLog> _feedings;
  List<FeedingLog> get feedings {
    if (_feedings is EqualUnmodifiableListView) return _feedings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedings);
  }

  final List<MortalityRecord> _mortality;
  List<MortalityRecord> get mortality {
    if (_mortality is EqualUnmodifiableListView) return _mortality;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mortality);
  }

  final List<EnvironmentalReading> _environments;
  List<EnvironmentalReading> get environments {
    if (_environments is EqualUnmodifiableListView) return _environments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_environments);
  }

  /// Create a copy of FeedingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedingStateDataCopyWith<FeedingStateData> get copyWith =>
      _$FeedingStateDataCopyWithImpl<FeedingStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedingStateData &&
            const DeepCollectionEquality().equals(other._feedings, _feedings) &&
            const DeepCollectionEquality()
                .equals(other._mortality, _mortality) &&
            const DeepCollectionEquality()
                .equals(other._environments, _environments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_feedings),
      const DeepCollectionEquality().hash(_mortality),
      const DeepCollectionEquality().hash(_environments));

  @override
  String toString() {
    return 'FeedingState.data(feedings: $feedings, mortality: $mortality, environments: $environments)';
  }
}

/// @nodoc
abstract mixin class $FeedingStateDataCopyWith<$Res>
    implements $FeedingStateCopyWith<$Res> {
  factory $FeedingStateDataCopyWith(
          FeedingStateData value, $Res Function(FeedingStateData) _then) =
      _$FeedingStateDataCopyWithImpl;
  @useResult
  $Res call(
      {List<FeedingLog> feedings,
      List<MortalityRecord> mortality,
      List<EnvironmentalReading> environments});
}

/// @nodoc
class _$FeedingStateDataCopyWithImpl<$Res>
    implements $FeedingStateDataCopyWith<$Res> {
  _$FeedingStateDataCopyWithImpl(this._self, this._then);

  final FeedingStateData _self;
  final $Res Function(FeedingStateData) _then;

  /// Create a copy of FeedingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? feedings = null,
    Object? mortality = null,
    Object? environments = null,
  }) {
    return _then(FeedingStateData(
      feedings: null == feedings
          ? _self._feedings
          : feedings // ignore: cast_nullable_to_non_nullable
              as List<FeedingLog>,
      mortality: null == mortality
          ? _self._mortality
          : mortality // ignore: cast_nullable_to_non_nullable
              as List<MortalityRecord>,
      environments: null == environments
          ? _self._environments
          : environments // ignore: cast_nullable_to_non_nullable
              as List<EnvironmentalReading>,
    ));
  }
}

/// @nodoc

class FeedingStateError implements FeedingState {
  const FeedingStateError(this.message);

  final String message;

  /// Create a copy of FeedingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedingStateErrorCopyWith<FeedingStateError> get copyWith =>
      _$FeedingStateErrorCopyWithImpl<FeedingStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedingStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FeedingState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FeedingStateErrorCopyWith<$Res>
    implements $FeedingStateCopyWith<$Res> {
  factory $FeedingStateErrorCopyWith(
          FeedingStateError value, $Res Function(FeedingStateError) _then) =
      _$FeedingStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FeedingStateErrorCopyWithImpl<$Res>
    implements $FeedingStateErrorCopyWith<$Res> {
  _$FeedingStateErrorCopyWithImpl(this._self, this._then);

  final FeedingStateError _self;
  final $Res Function(FeedingStateError) _then;

  /// Create a copy of FeedingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FeedingStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
