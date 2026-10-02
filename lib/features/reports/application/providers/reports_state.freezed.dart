// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportsState()';
  }
}

/// @nodoc
class $ReportsStateCopyWith<$Res> {
  $ReportsStateCopyWith(ReportsState _, $Res Function(ReportsState) __);
}

/// Adds pattern-matching-related methods to [ReportsState].
extension ReportsStatePatterns on ReportsState {
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
    TResult Function(ReportsStateInitial value)? initial,
    TResult Function(ReportsStateLoading value)? loading,
    TResult Function(ReportsStateData value)? data,
    TResult Function(ReportsStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial() when initial != null:
        return initial(_that);
      case ReportsStateLoading() when loading != null:
        return loading(_that);
      case ReportsStateData() when data != null:
        return data(_that);
      case ReportsStateError() when error != null:
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
    required TResult Function(ReportsStateInitial value) initial,
    required TResult Function(ReportsStateLoading value) loading,
    required TResult Function(ReportsStateData value) data,
    required TResult Function(ReportsStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial():
        return initial(_that);
      case ReportsStateLoading():
        return loading(_that);
      case ReportsStateData():
        return data(_that);
      case ReportsStateError():
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
    TResult? Function(ReportsStateInitial value)? initial,
    TResult? Function(ReportsStateLoading value)? loading,
    TResult? Function(ReportsStateData value)? data,
    TResult? Function(ReportsStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial() when initial != null:
        return initial(_that);
      case ReportsStateLoading() when loading != null:
        return loading(_that);
      case ReportsStateData() when data != null:
        return data(_that);
      case ReportsStateError() when error != null:
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
    TResult Function(FinancialReport financial, ProductionReport production)?
        data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial() when initial != null:
        return initial();
      case ReportsStateLoading() when loading != null:
        return loading();
      case ReportsStateData() when data != null:
        return data(_that.financial, _that.production);
      case ReportsStateError() when error != null:
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
            FinancialReport financial, ProductionReport production)
        data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial():
        return initial();
      case ReportsStateLoading():
        return loading();
      case ReportsStateData():
        return data(_that.financial, _that.production);
      case ReportsStateError():
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
    TResult? Function(FinancialReport financial, ProductionReport production)?
        data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ReportsStateInitial() when initial != null:
        return initial();
      case ReportsStateLoading() when loading != null:
        return loading();
      case ReportsStateData() when data != null:
        return data(_that.financial, _that.production);
      case ReportsStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ReportsStateInitial implements ReportsState {
  const ReportsStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportsState.initial()';
  }
}

/// @nodoc

class ReportsStateLoading implements ReportsState {
  const ReportsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportsState.loading()';
  }
}

/// @nodoc

class ReportsStateData implements ReportsState {
  const ReportsStateData({required this.financial, required this.production});

  final FinancialReport financial;
  final ProductionReport production;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportsStateDataCopyWith<ReportsStateData> get copyWith =>
      _$ReportsStateDataCopyWithImpl<ReportsStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportsStateData &&
            (identical(other.financial, financial) ||
                other.financial == financial) &&
            (identical(other.production, production) ||
                other.production == production));
  }

  @override
  int get hashCode => Object.hash(runtimeType, financial, production);

  @override
  String toString() {
    return 'ReportsState.data(financial: $financial, production: $production)';
  }
}

/// @nodoc
abstract mixin class $ReportsStateDataCopyWith<$Res>
    implements $ReportsStateCopyWith<$Res> {
  factory $ReportsStateDataCopyWith(
          ReportsStateData value, $Res Function(ReportsStateData) _then) =
      _$ReportsStateDataCopyWithImpl;
  @useResult
  $Res call({FinancialReport financial, ProductionReport production});

  $FinancialReportCopyWith<$Res> get financial;
  $ProductionReportCopyWith<$Res> get production;
}

/// @nodoc
class _$ReportsStateDataCopyWithImpl<$Res>
    implements $ReportsStateDataCopyWith<$Res> {
  _$ReportsStateDataCopyWithImpl(this._self, this._then);

  final ReportsStateData _self;
  final $Res Function(ReportsStateData) _then;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? financial = null,
    Object? production = null,
  }) {
    return _then(ReportsStateData(
      financial: null == financial
          ? _self.financial
          : financial // ignore: cast_nullable_to_non_nullable
              as FinancialReport,
      production: null == production
          ? _self.production
          : production // ignore: cast_nullable_to_non_nullable
              as ProductionReport,
    ));
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinancialReportCopyWith<$Res> get financial {
    return $FinancialReportCopyWith<$Res>(_self.financial, (value) {
      return _then(_self.copyWith(financial: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionReportCopyWith<$Res> get production {
    return $ProductionReportCopyWith<$Res>(_self.production, (value) {
      return _then(_self.copyWith(production: value));
    });
  }
}

/// @nodoc

class ReportsStateError implements ReportsState {
  const ReportsStateError(this.message);

  final String message;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportsStateErrorCopyWith<ReportsStateError> get copyWith =>
      _$ReportsStateErrorCopyWithImpl<ReportsStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportsStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ReportsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ReportsStateErrorCopyWith<$Res>
    implements $ReportsStateCopyWith<$Res> {
  factory $ReportsStateErrorCopyWith(
          ReportsStateError value, $Res Function(ReportsStateError) _then) =
      _$ReportsStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ReportsStateErrorCopyWithImpl<$Res>
    implements $ReportsStateErrorCopyWith<$Res> {
  _$ReportsStateErrorCopyWithImpl(this._self, this._then);

  final ReportsStateError _self;
  final $Res Function(ReportsStateError) _then;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ReportsStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
