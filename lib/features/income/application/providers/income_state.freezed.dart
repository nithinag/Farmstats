// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IncomeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IncomeState()';
  }
}

/// @nodoc
class $IncomeStateCopyWith<$Res> {
  $IncomeStateCopyWith(IncomeState _, $Res Function(IncomeState) __);
}

/// Adds pattern-matching-related methods to [IncomeState].
extension IncomeStatePatterns on IncomeState {
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
    TResult Function(IncomeStateInitial value)? initial,
    TResult Function(IncomeStateLoading value)? loading,
    TResult Function(IncomeStateData value)? data,
    TResult Function(IncomeStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial() when initial != null:
        return initial(_that);
      case IncomeStateLoading() when loading != null:
        return loading(_that);
      case IncomeStateData() when data != null:
        return data(_that);
      case IncomeStateError() when error != null:
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
    required TResult Function(IncomeStateInitial value) initial,
    required TResult Function(IncomeStateLoading value) loading,
    required TResult Function(IncomeStateData value) data,
    required TResult Function(IncomeStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial():
        return initial(_that);
      case IncomeStateLoading():
        return loading(_that);
      case IncomeStateData():
        return data(_that);
      case IncomeStateError():
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
    TResult? Function(IncomeStateInitial value)? initial,
    TResult? Function(IncomeStateLoading value)? loading,
    TResult? Function(IncomeStateData value)? data,
    TResult? Function(IncomeStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial() when initial != null:
        return initial(_that);
      case IncomeStateLoading() when loading != null:
        return loading(_that);
      case IncomeStateData() when data != null:
        return data(_that);
      case IncomeStateError() when error != null:
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
    TResult Function(List<Income> incomes)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial() when initial != null:
        return initial();
      case IncomeStateLoading() when loading != null:
        return loading();
      case IncomeStateData() when data != null:
        return data(_that.incomes);
      case IncomeStateError() when error != null:
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
    required TResult Function(List<Income> incomes) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial():
        return initial();
      case IncomeStateLoading():
        return loading();
      case IncomeStateData():
        return data(_that.incomes);
      case IncomeStateError():
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
    TResult? Function(List<Income> incomes)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case IncomeStateInitial() when initial != null:
        return initial();
      case IncomeStateLoading() when loading != null:
        return loading();
      case IncomeStateData() when data != null:
        return data(_that.incomes);
      case IncomeStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class IncomeStateInitial implements IncomeState {
  const IncomeStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IncomeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IncomeState.initial()';
  }
}

/// @nodoc

class IncomeStateLoading implements IncomeState {
  const IncomeStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IncomeStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IncomeState.loading()';
  }
}

/// @nodoc

class IncomeStateData implements IncomeState {
  const IncomeStateData(final List<Income> incomes) : _incomes = incomes;

  final List<Income> _incomes;
  List<Income> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  /// Create a copy of IncomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeStateDataCopyWith<IncomeStateData> get copyWith =>
      _$IncomeStateDataCopyWithImpl<IncomeStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeStateData &&
            const DeepCollectionEquality().equals(other._incomes, _incomes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_incomes));

  @override
  String toString() {
    return 'IncomeState.data(incomes: $incomes)';
  }
}

/// @nodoc
abstract mixin class $IncomeStateDataCopyWith<$Res>
    implements $IncomeStateCopyWith<$Res> {
  factory $IncomeStateDataCopyWith(
          IncomeStateData value, $Res Function(IncomeStateData) _then) =
      _$IncomeStateDataCopyWithImpl;
  @useResult
  $Res call({List<Income> incomes});
}

/// @nodoc
class _$IncomeStateDataCopyWithImpl<$Res>
    implements $IncomeStateDataCopyWith<$Res> {
  _$IncomeStateDataCopyWithImpl(this._self, this._then);

  final IncomeStateData _self;
  final $Res Function(IncomeStateData) _then;

  /// Create a copy of IncomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incomes = null,
  }) {
    return _then(IncomeStateData(
      null == incomes
          ? _self._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Income>,
    ));
  }
}

/// @nodoc

class IncomeStateError implements IncomeState {
  const IncomeStateError(this.message);

  final String message;

  /// Create a copy of IncomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomeStateErrorCopyWith<IncomeStateError> get copyWith =>
      _$IncomeStateErrorCopyWithImpl<IncomeStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomeStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'IncomeState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $IncomeStateErrorCopyWith<$Res>
    implements $IncomeStateCopyWith<$Res> {
  factory $IncomeStateErrorCopyWith(
          IncomeStateError value, $Res Function(IncomeStateError) _then) =
      _$IncomeStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$IncomeStateErrorCopyWithImpl<$Res>
    implements $IncomeStateErrorCopyWith<$Res> {
  _$IncomeStateErrorCopyWithImpl(this._self, this._then);

  final IncomeStateError _self;
  final $Res Function(IncomeStateError) _then;

  /// Create a copy of IncomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(IncomeStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
