// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpenseState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpenseState()';
  }
}

/// @nodoc
class $ExpenseStateCopyWith<$Res> {
  $ExpenseStateCopyWith(ExpenseState _, $Res Function(ExpenseState) __);
}

/// Adds pattern-matching-related methods to [ExpenseState].
extension ExpenseStatePatterns on ExpenseState {
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
    TResult Function(ExpenseStateInitial value)? initial,
    TResult Function(ExpenseStateLoading value)? loading,
    TResult Function(ExpenseStateData value)? data,
    TResult Function(ExpenseStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial() when initial != null:
        return initial(_that);
      case ExpenseStateLoading() when loading != null:
        return loading(_that);
      case ExpenseStateData() when data != null:
        return data(_that);
      case ExpenseStateError() when error != null:
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
    required TResult Function(ExpenseStateInitial value) initial,
    required TResult Function(ExpenseStateLoading value) loading,
    required TResult Function(ExpenseStateData value) data,
    required TResult Function(ExpenseStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial():
        return initial(_that);
      case ExpenseStateLoading():
        return loading(_that);
      case ExpenseStateData():
        return data(_that);
      case ExpenseStateError():
        return error(_that);
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
    TResult? Function(ExpenseStateInitial value)? initial,
    TResult? Function(ExpenseStateLoading value)? loading,
    TResult? Function(ExpenseStateData value)? data,
    TResult? Function(ExpenseStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial() when initial != null:
        return initial(_that);
      case ExpenseStateLoading() when loading != null:
        return loading(_that);
      case ExpenseStateData() when data != null:
        return data(_that);
      case ExpenseStateError() when error != null:
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
    TResult Function(List<Expense> expenses)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial() when initial != null:
        return initial();
      case ExpenseStateLoading() when loading != null:
        return loading();
      case ExpenseStateData() when data != null:
        return data(_that.expenses);
      case ExpenseStateError() when error != null:
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
    required TResult Function(List<Expense> expenses) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial():
        return initial();
      case ExpenseStateLoading():
        return loading();
      case ExpenseStateData():
        return data(_that.expenses);
      case ExpenseStateError():
        return error(_that.message);
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
    TResult? Function(List<Expense> expenses)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ExpenseStateInitial() when initial != null:
        return initial();
      case ExpenseStateLoading() when loading != null:
        return loading();
      case ExpenseStateData() when data != null:
        return data(_that.expenses);
      case ExpenseStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ExpenseStateInitial implements ExpenseState {
  const ExpenseStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpenseStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpenseState.initial()';
  }
}

/// @nodoc

class ExpenseStateLoading implements ExpenseState {
  const ExpenseStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpenseStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpenseState.loading()';
  }
}

/// @nodoc

class ExpenseStateData implements ExpenseState {
  const ExpenseStateData(final List<Expense> expenses) : _expenses = expenses;

  final List<Expense> _expenses;
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseStateDataCopyWith<ExpenseStateData> get copyWith =>
      _$ExpenseStateDataCopyWithImpl<ExpenseStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseStateData &&
            const DeepCollectionEquality().equals(other._expenses, _expenses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_expenses));

  @override
  String toString() {
    return 'ExpenseState.data(expenses: $expenses)';
  }
}

/// @nodoc
abstract mixin class $ExpenseStateDataCopyWith<$Res>
    implements $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateDataCopyWith(
          ExpenseStateData value, $Res Function(ExpenseStateData) _then) =
      _$ExpenseStateDataCopyWithImpl;
  @useResult
  $Res call({List<Expense> expenses});
}

/// @nodoc
class _$ExpenseStateDataCopyWithImpl<$Res>
    implements $ExpenseStateDataCopyWith<$Res> {
  _$ExpenseStateDataCopyWithImpl(this._self, this._then);

  final ExpenseStateData _self;
  final $Res Function(ExpenseStateData) _then;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expenses = null,
  }) {
    return _then(ExpenseStateData(
      null == expenses
          ? _self._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
    ));
  }
}

/// @nodoc

class ExpenseStateError implements ExpenseState {
  const ExpenseStateError(this.message);

  final String message;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseStateErrorCopyWith<ExpenseStateError> get copyWith =>
      _$ExpenseStateErrorCopyWithImpl<ExpenseStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ExpenseState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ExpenseStateErrorCopyWith<$Res>
    implements $ExpenseStateCopyWith<$Res> {
  factory $ExpenseStateErrorCopyWith(
          ExpenseStateError value, $Res Function(ExpenseStateError) _then) =
      _$ExpenseStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ExpenseStateErrorCopyWithImpl<$Res>
    implements $ExpenseStateErrorCopyWith<$Res> {
  _$ExpenseStateErrorCopyWithImpl(this._self, this._then);

  final ExpenseStateError _self;
  final $Res Function(ExpenseStateError) _then;

  /// Create a copy of ExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ExpenseStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
