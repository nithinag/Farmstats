// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labour_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabourState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LabourState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LabourState()';
  }
}

/// @nodoc
class $LabourStateCopyWith<$Res> {
  $LabourStateCopyWith(LabourState _, $Res Function(LabourState) __);
}

/// Adds pattern-matching-related methods to [LabourState].
extension LabourStatePatterns on LabourState {
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
    TResult Function(LabourStateInitial value)? initial,
    TResult Function(LabourStateLoading value)? loading,
    TResult Function(LabourStateData value)? data,
    TResult Function(LabourStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial() when initial != null:
        return initial(_that);
      case LabourStateLoading() when loading != null:
        return loading(_that);
      case LabourStateData() when data != null:
        return data(_that);
      case LabourStateError() when error != null:
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
    required TResult Function(LabourStateInitial value) initial,
    required TResult Function(LabourStateLoading value) loading,
    required TResult Function(LabourStateData value) data,
    required TResult Function(LabourStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial():
        return initial(_that);
      case LabourStateLoading():
        return loading(_that);
      case LabourStateData():
        return data(_that);
      case LabourStateError():
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
    TResult? Function(LabourStateInitial value)? initial,
    TResult? Function(LabourStateLoading value)? loading,
    TResult? Function(LabourStateData value)? data,
    TResult? Function(LabourStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial() when initial != null:
        return initial(_that);
      case LabourStateLoading() when loading != null:
        return loading(_that);
      case LabourStateData() when data != null:
        return data(_that);
      case LabourStateError() when error != null:
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
    TResult Function(List<LabourWorker> workers)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial() when initial != null:
        return initial();
      case LabourStateLoading() when loading != null:
        return loading();
      case LabourStateData() when data != null:
        return data(_that.workers);
      case LabourStateError() when error != null:
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
    required TResult Function(List<LabourWorker> workers) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial():
        return initial();
      case LabourStateLoading():
        return loading();
      case LabourStateData():
        return data(_that.workers);
      case LabourStateError():
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
    TResult? Function(List<LabourWorker> workers)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LabourStateInitial() when initial != null:
        return initial();
      case LabourStateLoading() when loading != null:
        return loading();
      case LabourStateData() when data != null:
        return data(_that.workers);
      case LabourStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LabourStateInitial implements LabourState {
  const LabourStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LabourStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LabourState.initial()';
  }
}

/// @nodoc

class LabourStateLoading implements LabourState {
  const LabourStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LabourStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LabourState.loading()';
  }
}

/// @nodoc

class LabourStateData implements LabourState {
  const LabourStateData(final List<LabourWorker> workers) : _workers = workers;

  final List<LabourWorker> _workers;
  List<LabourWorker> get workers {
    if (_workers is EqualUnmodifiableListView) return _workers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workers);
  }

  /// Create a copy of LabourState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabourStateDataCopyWith<LabourStateData> get copyWith =>
      _$LabourStateDataCopyWithImpl<LabourStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabourStateData &&
            const DeepCollectionEquality().equals(other._workers, _workers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_workers));

  @override
  String toString() {
    return 'LabourState.data(workers: $workers)';
  }
}

/// @nodoc
abstract mixin class $LabourStateDataCopyWith<$Res>
    implements $LabourStateCopyWith<$Res> {
  factory $LabourStateDataCopyWith(
          LabourStateData value, $Res Function(LabourStateData) _then) =
      _$LabourStateDataCopyWithImpl;
  @useResult
  $Res call({List<LabourWorker> workers});
}

/// @nodoc
class _$LabourStateDataCopyWithImpl<$Res>
    implements $LabourStateDataCopyWith<$Res> {
  _$LabourStateDataCopyWithImpl(this._self, this._then);

  final LabourStateData _self;
  final $Res Function(LabourStateData) _then;

  /// Create a copy of LabourState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workers = null,
  }) {
    return _then(LabourStateData(
      null == workers
          ? _self._workers
          : workers // ignore: cast_nullable_to_non_nullable
              as List<LabourWorker>,
    ));
  }
}

/// @nodoc

class LabourStateError implements LabourState {
  const LabourStateError(this.message);

  final String message;

  /// Create a copy of LabourState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabourStateErrorCopyWith<LabourStateError> get copyWith =>
      _$LabourStateErrorCopyWithImpl<LabourStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabourStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LabourState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LabourStateErrorCopyWith<$Res>
    implements $LabourStateCopyWith<$Res> {
  factory $LabourStateErrorCopyWith(
          LabourStateError value, $Res Function(LabourStateError) _then) =
      _$LabourStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LabourStateErrorCopyWithImpl<$Res>
    implements $LabourStateErrorCopyWith<$Res> {
  _$LabourStateErrorCopyWithImpl(this._self, this._then);

  final LabourStateError _self;
  final $Res Function(LabourStateError) _then;

  /// Create a copy of LabourState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LabourStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
