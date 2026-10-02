// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BatchState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BatchState()';
  }
}

/// @nodoc
class $BatchStateCopyWith<$Res> {
  $BatchStateCopyWith(BatchState _, $Res Function(BatchState) __);
}

/// Adds pattern-matching-related methods to [BatchState].
extension BatchStatePatterns on BatchState {
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
    TResult Function(BatchStateInitial value)? initial,
    TResult Function(BatchStateLoading value)? loading,
    TResult Function(BatchStateData value)? data,
    TResult Function(BatchStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial() when initial != null:
        return initial(_that);
      case BatchStateLoading() when loading != null:
        return loading(_that);
      case BatchStateData() when data != null:
        return data(_that);
      case BatchStateError() when error != null:
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
    required TResult Function(BatchStateInitial value) initial,
    required TResult Function(BatchStateLoading value) loading,
    required TResult Function(BatchStateData value) data,
    required TResult Function(BatchStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial():
        return initial(_that);
      case BatchStateLoading():
        return loading(_that);
      case BatchStateData():
        return data(_that);
      case BatchStateError():
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
    TResult? Function(BatchStateInitial value)? initial,
    TResult? Function(BatchStateLoading value)? loading,
    TResult? Function(BatchStateData value)? data,
    TResult? Function(BatchStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial() when initial != null:
        return initial(_that);
      case BatchStateLoading() when loading != null:
        return loading(_that);
      case BatchStateData() when data != null:
        return data(_that);
      case BatchStateError() when error != null:
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
    TResult Function(List<Batch> batches)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial() when initial != null:
        return initial();
      case BatchStateLoading() when loading != null:
        return loading();
      case BatchStateData() when data != null:
        return data(_that.batches);
      case BatchStateError() when error != null:
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
    required TResult Function(List<Batch> batches) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial():
        return initial();
      case BatchStateLoading():
        return loading();
      case BatchStateData():
        return data(_that.batches);
      case BatchStateError():
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
    TResult? Function(List<Batch> batches)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case BatchStateInitial() when initial != null:
        return initial();
      case BatchStateLoading() when loading != null:
        return loading();
      case BatchStateData() when data != null:
        return data(_that.batches);
      case BatchStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class BatchStateInitial implements BatchState {
  const BatchStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BatchStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BatchState.initial()';
  }
}

/// @nodoc

class BatchStateLoading implements BatchState {
  const BatchStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BatchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BatchState.loading()';
  }
}

/// @nodoc

class BatchStateData implements BatchState {
  const BatchStateData(final List<Batch> batches) : _batches = batches;

  final List<Batch> _batches;
  List<Batch> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  /// Create a copy of BatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchStateDataCopyWith<BatchStateData> get copyWith =>
      _$BatchStateDataCopyWithImpl<BatchStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchStateData &&
            const DeepCollectionEquality().equals(other._batches, _batches));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_batches));

  @override
  String toString() {
    return 'BatchState.data(batches: $batches)';
  }
}

/// @nodoc
abstract mixin class $BatchStateDataCopyWith<$Res>
    implements $BatchStateCopyWith<$Res> {
  factory $BatchStateDataCopyWith(
          BatchStateData value, $Res Function(BatchStateData) _then) =
      _$BatchStateDataCopyWithImpl;
  @useResult
  $Res call({List<Batch> batches});
}

/// @nodoc
class _$BatchStateDataCopyWithImpl<$Res>
    implements $BatchStateDataCopyWith<$Res> {
  _$BatchStateDataCopyWithImpl(this._self, this._then);

  final BatchStateData _self;
  final $Res Function(BatchStateData) _then;

  /// Create a copy of BatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? batches = null,
  }) {
    return _then(BatchStateData(
      null == batches
          ? _self._batches
          : batches // ignore: cast_nullable_to_non_nullable
              as List<Batch>,
    ));
  }
}

/// @nodoc

class BatchStateError implements BatchState {
  const BatchStateError(this.message);

  final String message;

  /// Create a copy of BatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BatchStateErrorCopyWith<BatchStateError> get copyWith =>
      _$BatchStateErrorCopyWithImpl<BatchStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BatchStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BatchState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $BatchStateErrorCopyWith<$Res>
    implements $BatchStateCopyWith<$Res> {
  factory $BatchStateErrorCopyWith(
          BatchStateError value, $Res Function(BatchStateError) _then) =
      _$BatchStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$BatchStateErrorCopyWithImpl<$Res>
    implements $BatchStateErrorCopyWith<$Res> {
  _$BatchStateErrorCopyWithImpl(this._self, this._then);

  final BatchStateError _self;
  final $Res Function(BatchStateError) _then;

  /// Create a copy of BatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(BatchStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
