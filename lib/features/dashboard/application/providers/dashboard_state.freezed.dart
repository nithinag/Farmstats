// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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
    TResult Function(DashboardStateInitial value)? initial,
    TResult Function(DashboardStateLoading value)? loading,
    TResult Function(DashboardStateData value)? data,
    TResult Function(DashboardStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial() when initial != null:
        return initial(_that);
      case DashboardStateLoading() when loading != null:
        return loading(_that);
      case DashboardStateData() when data != null:
        return data(_that);
      case DashboardStateError() when error != null:
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
    required TResult Function(DashboardStateInitial value) initial,
    required TResult Function(DashboardStateLoading value) loading,
    required TResult Function(DashboardStateData value) data,
    required TResult Function(DashboardStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial():
        return initial(_that);
      case DashboardStateLoading():
        return loading(_that);
      case DashboardStateData():
        return data(_that);
      case DashboardStateError():
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
    TResult? Function(DashboardStateInitial value)? initial,
    TResult? Function(DashboardStateLoading value)? loading,
    TResult? Function(DashboardStateData value)? data,
    TResult? Function(DashboardStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial() when initial != null:
        return initial(_that);
      case DashboardStateLoading() when loading != null:
        return loading(_that);
      case DashboardStateData() when data != null:
        return data(_that);
      case DashboardStateError() when error != null:
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
    TResult Function(
            FinancialReport financial,
            ProductionReport production,
            int activeBatchesCount,
            int lowStockCount,
            int pendingFeedingsCount,
            List<String> recentActivities,
            List<String> alerts)?
        data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial() when initial != null:
        return initial();
      case DashboardStateLoading() when loading != null:
        return loading();
      case DashboardStateData() when data != null:
        return data(
            _that.financial,
            _that.production,
            _that.activeBatchesCount,
            _that.lowStockCount,
            _that.pendingFeedingsCount,
            _that.recentActivities,
            _that.alerts);
      case DashboardStateError() when error != null:
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
            FinancialReport financial,
            ProductionReport production,
            int activeBatchesCount,
            int lowStockCount,
            int pendingFeedingsCount,
            List<String> recentActivities,
            List<String> alerts)
        data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial():
        return initial();
      case DashboardStateLoading():
        return loading();
      case DashboardStateData():
        return data(
            _that.financial,
            _that.production,
            _that.activeBatchesCount,
            _that.lowStockCount,
            _that.pendingFeedingsCount,
            _that.recentActivities,
            _that.alerts);
      case DashboardStateError():
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
            FinancialReport financial,
            ProductionReport production,
            int activeBatchesCount,
            int lowStockCount,
            int pendingFeedingsCount,
            List<String> recentActivities,
            List<String> alerts)?
        data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DashboardStateInitial() when initial != null:
        return initial();
      case DashboardStateLoading() when loading != null:
        return loading();
      case DashboardStateData() when data != null:
        return data(
            _that.financial,
            _that.production,
            _that.activeBatchesCount,
            _that.lowStockCount,
            _that.pendingFeedingsCount,
            _that.recentActivities,
            _that.alerts);
      case DashboardStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DashboardStateInitial implements DashboardState {
  const DashboardStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.initial()';
  }
}

/// @nodoc

class DashboardStateLoading implements DashboardState {
  const DashboardStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState.loading()';
  }
}

/// @nodoc

class DashboardStateData implements DashboardState {
  const DashboardStateData(
      {required this.financial,
      required this.production,
      required this.activeBatchesCount,
      required this.lowStockCount,
      required this.pendingFeedingsCount,
      required final List<String> recentActivities,
      required final List<String> alerts})
      : _recentActivities = recentActivities,
        _alerts = alerts;

  final FinancialReport financial;
  final ProductionReport production;
  final int activeBatchesCount;
  final int lowStockCount;
  final int pendingFeedingsCount;
  final List<String> _recentActivities;
  List<String> get recentActivities {
    if (_recentActivities is EqualUnmodifiableListView)
      return _recentActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivities);
  }

  final List<String> _alerts;
  List<String> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStateDataCopyWith<DashboardStateData> get copyWith =>
      _$DashboardStateDataCopyWithImpl<DashboardStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardStateData &&
            (identical(other.financial, financial) ||
                other.financial == financial) &&
            (identical(other.production, production) ||
                other.production == production) &&
            (identical(other.activeBatchesCount, activeBatchesCount) ||
                other.activeBatchesCount == activeBatchesCount) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount) &&
            (identical(other.pendingFeedingsCount, pendingFeedingsCount) ||
                other.pendingFeedingsCount == pendingFeedingsCount) &&
            const DeepCollectionEquality()
                .equals(other._recentActivities, _recentActivities) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      financial,
      production,
      activeBatchesCount,
      lowStockCount,
      pendingFeedingsCount,
      const DeepCollectionEquality().hash(_recentActivities),
      const DeepCollectionEquality().hash(_alerts));

  @override
  String toString() {
    return 'DashboardState.data(financial: $financial, production: $production, activeBatchesCount: $activeBatchesCount, lowStockCount: $lowStockCount, pendingFeedingsCount: $pendingFeedingsCount, recentActivities: $recentActivities, alerts: $alerts)';
  }
}

/// @nodoc
abstract mixin class $DashboardStateDataCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory $DashboardStateDataCopyWith(
          DashboardStateData value, $Res Function(DashboardStateData) _then) =
      _$DashboardStateDataCopyWithImpl;
  @useResult
  $Res call(
      {FinancialReport financial,
      ProductionReport production,
      int activeBatchesCount,
      int lowStockCount,
      int pendingFeedingsCount,
      List<String> recentActivities,
      List<String> alerts});

  $FinancialReportCopyWith<$Res> get financial;
  $ProductionReportCopyWith<$Res> get production;
}

/// @nodoc
class _$DashboardStateDataCopyWithImpl<$Res>
    implements $DashboardStateDataCopyWith<$Res> {
  _$DashboardStateDataCopyWithImpl(this._self, this._then);

  final DashboardStateData _self;
  final $Res Function(DashboardStateData) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? financial = null,
    Object? production = null,
    Object? activeBatchesCount = null,
    Object? lowStockCount = null,
    Object? pendingFeedingsCount = null,
    Object? recentActivities = null,
    Object? alerts = null,
  }) {
    return _then(DashboardStateData(
      financial: null == financial
          ? _self.financial
          : financial // ignore: cast_nullable_to_non_nullable
              as FinancialReport,
      production: null == production
          ? _self.production
          : production // ignore: cast_nullable_to_non_nullable
              as ProductionReport,
      activeBatchesCount: null == activeBatchesCount
          ? _self.activeBatchesCount
          : activeBatchesCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockCount: null == lowStockCount
          ? _self.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      pendingFeedingsCount: null == pendingFeedingsCount
          ? _self.pendingFeedingsCount
          : pendingFeedingsCount // ignore: cast_nullable_to_non_nullable
              as int,
      recentActivities: null == recentActivities
          ? _self._recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alerts: null == alerts
          ? _self._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinancialReportCopyWith<$Res> get financial {
    return $FinancialReportCopyWith<$Res>(_self.financial, (value) {
      return _then(_self.copyWith(financial: value));
    });
  }

  /// Create a copy of DashboardState
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

class DashboardStateError implements DashboardState {
  const DashboardStateError(this.message);

  final String message;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStateErrorCopyWith<DashboardStateError> get copyWith =>
      _$DashboardStateErrorCopyWithImpl<DashboardStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DashboardState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DashboardStateErrorCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory $DashboardStateErrorCopyWith(
          DashboardStateError value, $Res Function(DashboardStateError) _then) =
      _$DashboardStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DashboardStateErrorCopyWithImpl<$Res>
    implements $DashboardStateErrorCopyWith<$Res> {
  _$DashboardStateErrorCopyWithImpl(this._self, this._then);

  final DashboardStateError _self;
  final $Res Function(DashboardStateError) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DashboardStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
