// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'harvest_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HarvestState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HarvestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HarvestState()';
  }
}

/// @nodoc
class $HarvestStateCopyWith<$Res> {
  $HarvestStateCopyWith(HarvestState _, $Res Function(HarvestState) __);
}

/// Adds pattern-matching-related methods to [HarvestState].
extension HarvestStatePatterns on HarvestState {
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
    TResult Function(HarvestStateInitial value)? initial,
    TResult Function(HarvestStateLoading value)? loading,
    TResult Function(HarvestStateData value)? data,
    TResult Function(HarvestStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial() when initial != null:
        return initial(_that);
      case HarvestStateLoading() when loading != null:
        return loading(_that);
      case HarvestStateData() when data != null:
        return data(_that);
      case HarvestStateError() when error != null:
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
    required TResult Function(HarvestStateInitial value) initial,
    required TResult Function(HarvestStateLoading value) loading,
    required TResult Function(HarvestStateData value) data,
    required TResult Function(HarvestStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial():
        return initial(_that);
      case HarvestStateLoading():
        return loading(_that);
      case HarvestStateData():
        return data(_that);
      case HarvestStateError():
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
    TResult? Function(HarvestStateInitial value)? initial,
    TResult? Function(HarvestStateLoading value)? loading,
    TResult? Function(HarvestStateData value)? data,
    TResult? Function(HarvestStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial() when initial != null:
        return initial(_that);
      case HarvestStateLoading() when loading != null:
        return loading(_that);
      case HarvestStateData() when data != null:
        return data(_that);
      case HarvestStateError() when error != null:
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
    TResult Function(List<HarvestRecord> harvests)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial() when initial != null:
        return initial();
      case HarvestStateLoading() when loading != null:
        return loading();
      case HarvestStateData() when data != null:
        return data(_that.harvests);
      case HarvestStateError() when error != null:
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
    required TResult Function(List<HarvestRecord> harvests) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial():
        return initial();
      case HarvestStateLoading():
        return loading();
      case HarvestStateData():
        return data(_that.harvests);
      case HarvestStateError():
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
    TResult? Function(List<HarvestRecord> harvests)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case HarvestStateInitial() when initial != null:
        return initial();
      case HarvestStateLoading() when loading != null:
        return loading();
      case HarvestStateData() when data != null:
        return data(_that.harvests);
      case HarvestStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class HarvestStateInitial implements HarvestState {
  const HarvestStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HarvestStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HarvestState.initial()';
  }
}

/// @nodoc

class HarvestStateLoading implements HarvestState {
  const HarvestStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HarvestStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HarvestState.loading()';
  }
}

/// @nodoc

class HarvestStateData implements HarvestState {
  const HarvestStateData(final List<HarvestRecord> harvests)
      : _harvests = harvests;

  final List<HarvestRecord> _harvests;
  List<HarvestRecord> get harvests {
    if (_harvests is EqualUnmodifiableListView) return _harvests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_harvests);
  }

  /// Create a copy of HarvestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HarvestStateDataCopyWith<HarvestStateData> get copyWith =>
      _$HarvestStateDataCopyWithImpl<HarvestStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HarvestStateData &&
            const DeepCollectionEquality().equals(other._harvests, _harvests));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_harvests));

  @override
  String toString() {
    return 'HarvestState.data(harvests: $harvests)';
  }
}

/// @nodoc
abstract mixin class $HarvestStateDataCopyWith<$Res>
    implements $HarvestStateCopyWith<$Res> {
  factory $HarvestStateDataCopyWith(
          HarvestStateData value, $Res Function(HarvestStateData) _then) =
      _$HarvestStateDataCopyWithImpl;
  @useResult
  $Res call({List<HarvestRecord> harvests});
}

/// @nodoc
class _$HarvestStateDataCopyWithImpl<$Res>
    implements $HarvestStateDataCopyWith<$Res> {
  _$HarvestStateDataCopyWithImpl(this._self, this._then);

  final HarvestStateData _self;
  final $Res Function(HarvestStateData) _then;

  /// Create a copy of HarvestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? harvests = null,
  }) {
    return _then(HarvestStateData(
      null == harvests
          ? _self._harvests
          : harvests // ignore: cast_nullable_to_non_nullable
              as List<HarvestRecord>,
    ));
  }
}

/// @nodoc

class HarvestStateError implements HarvestState {
  const HarvestStateError(this.message);

  final String message;

  /// Create a copy of HarvestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HarvestStateErrorCopyWith<HarvestStateError> get copyWith =>
      _$HarvestStateErrorCopyWithImpl<HarvestStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HarvestStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HarvestState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HarvestStateErrorCopyWith<$Res>
    implements $HarvestStateCopyWith<$Res> {
  factory $HarvestStateErrorCopyWith(
          HarvestStateError value, $Res Function(HarvestStateError) _then) =
      _$HarvestStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HarvestStateErrorCopyWithImpl<$Res>
    implements $HarvestStateErrorCopyWith<$Res> {
  _$HarvestStateErrorCopyWithImpl(this._self, this._then);

  final HarvestStateError _self;
  final $Res Function(HarvestStateError) _then;

  /// Create a copy of HarvestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(HarvestStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
