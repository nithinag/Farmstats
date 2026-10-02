// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardData {
  DashboardSummary get summary;
  List<MetricCardData> get metrics;
  List<QuickActionData> get quickActions;
  List<RecentActivity> get recentActivities;
  ChartSummary get chartSummary;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      _$DashboardDataCopyWithImpl<DashboardData>(
          this as DashboardData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardData &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other.metrics, metrics) &&
            const DeepCollectionEquality()
                .equals(other.quickActions, quickActions) &&
            const DeepCollectionEquality()
                .equals(other.recentActivities, recentActivities) &&
            (identical(other.chartSummary, chartSummary) ||
                other.chartSummary == chartSummary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(metrics),
      const DeepCollectionEquality().hash(quickActions),
      const DeepCollectionEquality().hash(recentActivities),
      chartSummary);

  @override
  String toString() {
    return 'DashboardData(summary: $summary, metrics: $metrics, quickActions: $quickActions, recentActivities: $recentActivities, chartSummary: $chartSummary)';
  }
}

/// @nodoc
abstract mixin class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) _then) =
      _$DashboardDataCopyWithImpl;
  @useResult
  $Res call(
      {DashboardSummary summary,
      List<MetricCardData> metrics,
      List<QuickActionData> quickActions,
      List<RecentActivity> recentActivities,
      ChartSummary chartSummary});

  $DashboardSummaryCopyWith<$Res> get summary;
  $ChartSummaryCopyWith<$Res> get chartSummary;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._self, this._then);

  final DashboardData _self;
  final $Res Function(DashboardData) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? metrics = null,
    Object? quickActions = null,
    Object? recentActivities = null,
    Object? chartSummary = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DashboardSummary,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricCardData>,
      quickActions: null == quickActions
          ? _self.quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionData>,
      recentActivities: null == recentActivities
          ? _self.recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivity>,
      chartSummary: null == chartSummary
          ? _self.chartSummary
          : chartSummary // ignore: cast_nullable_to_non_nullable
              as ChartSummary,
    ));
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardSummaryCopyWith<$Res> get summary {
    return $DashboardSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartSummaryCopyWith<$Res> get chartSummary {
    return $ChartSummaryCopyWith<$Res>(_self.chartSummary, (value) {
      return _then(_self.copyWith(chartSummary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DashboardData].
extension DashboardDataPatterns on DashboardData {
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
    TResult Function(_DashboardData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardData() when $default != null:
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
    TResult Function(_DashboardData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardData():
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
    TResult? Function(_DashboardData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardData() when $default != null:
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
            DashboardSummary summary,
            List<MetricCardData> metrics,
            List<QuickActionData> quickActions,
            List<RecentActivity> recentActivities,
            ChartSummary chartSummary)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardData() when $default != null:
        return $default(_that.summary, _that.metrics, _that.quickActions,
            _that.recentActivities, _that.chartSummary);
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
            DashboardSummary summary,
            List<MetricCardData> metrics,
            List<QuickActionData> quickActions,
            List<RecentActivity> recentActivities,
            ChartSummary chartSummary)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardData():
        return $default(_that.summary, _that.metrics, _that.quickActions,
            _that.recentActivities, _that.chartSummary);
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
            DashboardSummary summary,
            List<MetricCardData> metrics,
            List<QuickActionData> quickActions,
            List<RecentActivity> recentActivities,
            ChartSummary chartSummary)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardData() when $default != null:
        return $default(_that.summary, _that.metrics, _that.quickActions,
            _that.recentActivities, _that.chartSummary);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardData implements DashboardData {
  const _DashboardData(
      {required this.summary,
      required final List<MetricCardData> metrics,
      required final List<QuickActionData> quickActions,
      required final List<RecentActivity> recentActivities,
      required this.chartSummary})
      : _metrics = metrics,
        _quickActions = quickActions,
        _recentActivities = recentActivities;

  @override
  final DashboardSummary summary;
  final List<MetricCardData> _metrics;
  @override
  List<MetricCardData> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final List<QuickActionData> _quickActions;
  @override
  List<QuickActionData> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  final List<RecentActivity> _recentActivities;
  @override
  List<RecentActivity> get recentActivities {
    if (_recentActivities is EqualUnmodifiableListView)
      return _recentActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivities);
  }

  @override
  final ChartSummary chartSummary;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardDataCopyWith<_DashboardData> get copyWith =>
      __$DashboardDataCopyWithImpl<_DashboardData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardData &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality()
                .equals(other._quickActions, _quickActions) &&
            const DeepCollectionEquality()
                .equals(other._recentActivities, _recentActivities) &&
            (identical(other.chartSummary, chartSummary) ||
                other.chartSummary == chartSummary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_quickActions),
      const DeepCollectionEquality().hash(_recentActivities),
      chartSummary);

  @override
  String toString() {
    return 'DashboardData(summary: $summary, metrics: $metrics, quickActions: $quickActions, recentActivities: $recentActivities, chartSummary: $chartSummary)';
  }
}

/// @nodoc
abstract mixin class _$DashboardDataCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$DashboardDataCopyWith(
          _DashboardData value, $Res Function(_DashboardData) _then) =
      __$DashboardDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DashboardSummary summary,
      List<MetricCardData> metrics,
      List<QuickActionData> quickActions,
      List<RecentActivity> recentActivities,
      ChartSummary chartSummary});

  @override
  $DashboardSummaryCopyWith<$Res> get summary;
  @override
  $ChartSummaryCopyWith<$Res> get chartSummary;
}

/// @nodoc
class __$DashboardDataCopyWithImpl<$Res>
    implements _$DashboardDataCopyWith<$Res> {
  __$DashboardDataCopyWithImpl(this._self, this._then);

  final _DashboardData _self;
  final $Res Function(_DashboardData) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? metrics = null,
    Object? quickActions = null,
    Object? recentActivities = null,
    Object? chartSummary = null,
  }) {
    return _then(_DashboardData(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DashboardSummary,
      metrics: null == metrics
          ? _self._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricCardData>,
      quickActions: null == quickActions
          ? _self._quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionData>,
      recentActivities: null == recentActivities
          ? _self._recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivity>,
      chartSummary: null == chartSummary
          ? _self.chartSummary
          : chartSummary // ignore: cast_nullable_to_non_nullable
              as ChartSummary,
    ));
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardSummaryCopyWith<$Res> get summary {
    return $DashboardSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartSummaryCopyWith<$Res> get chartSummary {
    return $ChartSummaryCopyWith<$Res>(_self.chartSummary, (value) {
      return _then(_self.copyWith(chartSummary: value));
    });
  }
}

/// @nodoc
mixin _$DashboardSummary {
  int get activeBatches;
  int get todaysTasks;
  double get netIncome;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardSummaryCopyWith<DashboardSummary> get copyWith =>
      _$DashboardSummaryCopyWithImpl<DashboardSummary>(
          this as DashboardSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardSummary &&
            (identical(other.activeBatches, activeBatches) ||
                other.activeBatches == activeBatches) &&
            (identical(other.todaysTasks, todaysTasks) ||
                other.todaysTasks == todaysTasks) &&
            (identical(other.netIncome, netIncome) ||
                other.netIncome == netIncome));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activeBatches, todaysTasks, netIncome);

  @override
  String toString() {
    return 'DashboardSummary(activeBatches: $activeBatches, todaysTasks: $todaysTasks, netIncome: $netIncome)';
  }
}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res> {
  factory $DashboardSummaryCopyWith(
          DashboardSummary value, $Res Function(DashboardSummary) _then) =
      _$DashboardSummaryCopyWithImpl;
  @useResult
  $Res call({int activeBatches, int todaysTasks, double netIncome});
}

/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeBatches = null,
    Object? todaysTasks = null,
    Object? netIncome = null,
  }) {
    return _then(_self.copyWith(
      activeBatches: null == activeBatches
          ? _self.activeBatches
          : activeBatches // ignore: cast_nullable_to_non_nullable
              as int,
      todaysTasks: null == todaysTasks
          ? _self.todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as int,
      netIncome: null == netIncome
          ? _self.netIncome
          : netIncome // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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
    TResult Function(_DashboardSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
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
    TResult Function(_DashboardSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary():
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
    TResult? Function(_DashboardSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
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
    TResult Function(int activeBatches, int todaysTasks, double netIncome)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
        return $default(
            _that.activeBatches, _that.todaysTasks, _that.netIncome);
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
    TResult Function(int activeBatches, int todaysTasks, double netIncome)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary():
        return $default(
            _that.activeBatches, _that.todaysTasks, _that.netIncome);
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
    TResult? Function(int activeBatches, int todaysTasks, double netIncome)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
        return $default(
            _that.activeBatches, _that.todaysTasks, _that.netIncome);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardSummary implements DashboardSummary {
  const _DashboardSummary(
      {required this.activeBatches,
      required this.todaysTasks,
      required this.netIncome});

  @override
  final int activeBatches;
  @override
  final int todaysTasks;
  @override
  final double netIncome;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardSummaryCopyWith<_DashboardSummary> get copyWith =>
      __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardSummary &&
            (identical(other.activeBatches, activeBatches) ||
                other.activeBatches == activeBatches) &&
            (identical(other.todaysTasks, todaysTasks) ||
                other.todaysTasks == todaysTasks) &&
            (identical(other.netIncome, netIncome) ||
                other.netIncome == netIncome));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activeBatches, todaysTasks, netIncome);

  @override
  String toString() {
    return 'DashboardSummary(activeBatches: $activeBatches, todaysTasks: $todaysTasks, netIncome: $netIncome)';
  }
}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(
          _DashboardSummary value, $Res Function(_DashboardSummary) _then) =
      __$DashboardSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({int activeBatches, int todaysTasks, double netIncome});
}

/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeBatches = null,
    Object? todaysTasks = null,
    Object? netIncome = null,
  }) {
    return _then(_DashboardSummary(
      activeBatches: null == activeBatches
          ? _self.activeBatches
          : activeBatches // ignore: cast_nullable_to_non_nullable
              as int,
      todaysTasks: null == todaysTasks
          ? _self.todaysTasks
          : todaysTasks // ignore: cast_nullable_to_non_nullable
              as int,
      netIncome: null == netIncome
          ? _self.netIncome
          : netIncome // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$MetricCardData {
  String get title;
  String get value;
  String get iconType;

  /// Create a copy of MetricCardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetricCardDataCopyWith<MetricCardData> get copyWith =>
      _$MetricCardDataCopyWithImpl<MetricCardData>(
          this as MetricCardData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetricCardData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, value, iconType);

  @override
  String toString() {
    return 'MetricCardData(title: $title, value: $value, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class $MetricCardDataCopyWith<$Res> {
  factory $MetricCardDataCopyWith(
          MetricCardData value, $Res Function(MetricCardData) _then) =
      _$MetricCardDataCopyWithImpl;
  @useResult
  $Res call({String title, String value, String iconType});
}

/// @nodoc
class _$MetricCardDataCopyWithImpl<$Res>
    implements $MetricCardDataCopyWith<$Res> {
  _$MetricCardDataCopyWithImpl(this._self, this._then);

  final MetricCardData _self;
  final $Res Function(MetricCardData) _then;

  /// Create a copy of MetricCardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? iconType = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      iconType: null == iconType
          ? _self.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MetricCardData].
extension MetricCardDataPatterns on MetricCardData {
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
    TResult Function(_MetricCardData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MetricCardData() when $default != null:
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
    TResult Function(_MetricCardData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardData():
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
    TResult? Function(_MetricCardData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardData() when $default != null:
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
    TResult Function(String title, String value, String iconType)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MetricCardData() when $default != null:
        return $default(_that.title, _that.value, _that.iconType);
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
    TResult Function(String title, String value, String iconType) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardData():
        return $default(_that.title, _that.value, _that.iconType);
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
    TResult? Function(String title, String value, String iconType)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardData() when $default != null:
        return $default(_that.title, _that.value, _that.iconType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MetricCardData implements MetricCardData {
  const _MetricCardData(
      {required this.title, required this.value, required this.iconType});

  @override
  final String title;
  @override
  final String value;
  @override
  final String iconType;

  /// Create a copy of MetricCardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MetricCardDataCopyWith<_MetricCardData> get copyWith =>
      __$MetricCardDataCopyWithImpl<_MetricCardData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MetricCardData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, value, iconType);

  @override
  String toString() {
    return 'MetricCardData(title: $title, value: $value, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class _$MetricCardDataCopyWith<$Res>
    implements $MetricCardDataCopyWith<$Res> {
  factory _$MetricCardDataCopyWith(
          _MetricCardData value, $Res Function(_MetricCardData) _then) =
      __$MetricCardDataCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String value, String iconType});
}

/// @nodoc
class __$MetricCardDataCopyWithImpl<$Res>
    implements _$MetricCardDataCopyWith<$Res> {
  __$MetricCardDataCopyWithImpl(this._self, this._then);

  final _MetricCardData _self;
  final $Res Function(_MetricCardData) _then;

  /// Create a copy of MetricCardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? iconType = null,
  }) {
    return _then(_MetricCardData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      iconType: null == iconType
          ? _self.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$QuickActionData {
  String get id;
  String get label;
  String get iconType;

  /// Create a copy of QuickActionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuickActionDataCopyWith<QuickActionData> get copyWith =>
      _$QuickActionDataCopyWithImpl<QuickActionData>(
          this as QuickActionData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuickActionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, iconType);

  @override
  String toString() {
    return 'QuickActionData(id: $id, label: $label, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class $QuickActionDataCopyWith<$Res> {
  factory $QuickActionDataCopyWith(
          QuickActionData value, $Res Function(QuickActionData) _then) =
      _$QuickActionDataCopyWithImpl;
  @useResult
  $Res call({String id, String label, String iconType});
}

/// @nodoc
class _$QuickActionDataCopyWithImpl<$Res>
    implements $QuickActionDataCopyWith<$Res> {
  _$QuickActionDataCopyWithImpl(this._self, this._then);

  final QuickActionData _self;
  final $Res Function(QuickActionData) _then;

  /// Create a copy of QuickActionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? iconType = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      iconType: null == iconType
          ? _self.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuickActionData].
extension QuickActionDataPatterns on QuickActionData {
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
    TResult Function(_QuickActionData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuickActionData() when $default != null:
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
    TResult Function(_QuickActionData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionData():
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
    TResult? Function(_QuickActionData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionData() when $default != null:
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
    TResult Function(String id, String label, String iconType)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuickActionData() when $default != null:
        return $default(_that.id, _that.label, _that.iconType);
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
    TResult Function(String id, String label, String iconType) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionData():
        return $default(_that.id, _that.label, _that.iconType);
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
    TResult? Function(String id, String label, String iconType)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionData() when $default != null:
        return $default(_that.id, _that.label, _that.iconType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuickActionData implements QuickActionData {
  const _QuickActionData(
      {required this.id, required this.label, required this.iconType});

  @override
  final String id;
  @override
  final String label;
  @override
  final String iconType;

  /// Create a copy of QuickActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuickActionDataCopyWith<_QuickActionData> get copyWith =>
      __$QuickActionDataCopyWithImpl<_QuickActionData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuickActionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, iconType);

  @override
  String toString() {
    return 'QuickActionData(id: $id, label: $label, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class _$QuickActionDataCopyWith<$Res>
    implements $QuickActionDataCopyWith<$Res> {
  factory _$QuickActionDataCopyWith(
          _QuickActionData value, $Res Function(_QuickActionData) _then) =
      __$QuickActionDataCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String label, String iconType});
}

/// @nodoc
class __$QuickActionDataCopyWithImpl<$Res>
    implements _$QuickActionDataCopyWith<$Res> {
  __$QuickActionDataCopyWithImpl(this._self, this._then);

  final _QuickActionData _self;
  final $Res Function(_QuickActionData) _then;

  /// Create a copy of QuickActionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? iconType = null,
  }) {
    return _then(_QuickActionData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      iconType: null == iconType
          ? _self.iconType
          : iconType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RecentActivity {
  String get id;
  String get title;
  String get subtitle;
  DateTime get timestamp;
  String get activityType;

  /// Create a copy of RecentActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentActivityCopyWith<RecentActivity> get copyWith =>
      _$RecentActivityCopyWithImpl<RecentActivity>(
          this as RecentActivity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, timestamp, activityType);

  @override
  String toString() {
    return 'RecentActivity(id: $id, title: $title, subtitle: $subtitle, timestamp: $timestamp, activityType: $activityType)';
  }
}

/// @nodoc
abstract mixin class $RecentActivityCopyWith<$Res> {
  factory $RecentActivityCopyWith(
          RecentActivity value, $Res Function(RecentActivity) _then) =
      _$RecentActivityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      DateTime timestamp,
      String activityType});
}

/// @nodoc
class _$RecentActivityCopyWithImpl<$Res>
    implements $RecentActivityCopyWith<$Res> {
  _$RecentActivityCopyWithImpl(this._self, this._then);

  final RecentActivity _self;
  final $Res Function(RecentActivity) _then;

  /// Create a copy of RecentActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? timestamp = null,
    Object? activityType = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecentActivity].
extension RecentActivityPatterns on RecentActivity {
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
    TResult Function(_RecentActivity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentActivity() when $default != null:
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
    TResult Function(_RecentActivity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivity():
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
    TResult? Function(_RecentActivity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivity() when $default != null:
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
    TResult Function(String id, String title, String subtitle,
            DateTime timestamp, String activityType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentActivity() when $default != null:
        return $default(_that.id, _that.title, _that.subtitle, _that.timestamp,
            _that.activityType);
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
    TResult Function(String id, String title, String subtitle,
            DateTime timestamp, String activityType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivity():
        return $default(_that.id, _that.title, _that.subtitle, _that.timestamp,
            _that.activityType);
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
    TResult? Function(String id, String title, String subtitle,
            DateTime timestamp, String activityType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivity() when $default != null:
        return $default(_that.id, _that.title, _that.subtitle, _that.timestamp,
            _that.activityType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecentActivity implements RecentActivity {
  const _RecentActivity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.timestamp,
      required this.activityType});

  @override
  final String id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final DateTime timestamp;
  @override
  final String activityType;

  /// Create a copy of RecentActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentActivityCopyWith<_RecentActivity> get copyWith =>
      __$RecentActivityCopyWithImpl<_RecentActivity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, timestamp, activityType);

  @override
  String toString() {
    return 'RecentActivity(id: $id, title: $title, subtitle: $subtitle, timestamp: $timestamp, activityType: $activityType)';
  }
}

/// @nodoc
abstract mixin class _$RecentActivityCopyWith<$Res>
    implements $RecentActivityCopyWith<$Res> {
  factory _$RecentActivityCopyWith(
          _RecentActivity value, $Res Function(_RecentActivity) _then) =
      __$RecentActivityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      DateTime timestamp,
      String activityType});
}

/// @nodoc
class __$RecentActivityCopyWithImpl<$Res>
    implements _$RecentActivityCopyWith<$Res> {
  __$RecentActivityCopyWithImpl(this._self, this._then);

  final _RecentActivity _self;
  final $Res Function(_RecentActivity) _then;

  /// Create a copy of RecentActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? timestamp = null,
    Object? activityType = null,
  }) {
    return _then(_RecentActivity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _self.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ChartSummary {
  List<double> get incomeDataPoints;
  List<double> get expenseDataPoints;
  List<String> get labels;

  /// Create a copy of ChartSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartSummaryCopyWith<ChartSummary> get copyWith =>
      _$ChartSummaryCopyWithImpl<ChartSummary>(
          this as ChartSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartSummary &&
            const DeepCollectionEquality()
                .equals(other.incomeDataPoints, incomeDataPoints) &&
            const DeepCollectionEquality()
                .equals(other.expenseDataPoints, expenseDataPoints) &&
            const DeepCollectionEquality().equals(other.labels, labels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(incomeDataPoints),
      const DeepCollectionEquality().hash(expenseDataPoints),
      const DeepCollectionEquality().hash(labels));

  @override
  String toString() {
    return 'ChartSummary(incomeDataPoints: $incomeDataPoints, expenseDataPoints: $expenseDataPoints, labels: $labels)';
  }
}

/// @nodoc
abstract mixin class $ChartSummaryCopyWith<$Res> {
  factory $ChartSummaryCopyWith(
          ChartSummary value, $Res Function(ChartSummary) _then) =
      _$ChartSummaryCopyWithImpl;
  @useResult
  $Res call(
      {List<double> incomeDataPoints,
      List<double> expenseDataPoints,
      List<String> labels});
}

/// @nodoc
class _$ChartSummaryCopyWithImpl<$Res> implements $ChartSummaryCopyWith<$Res> {
  _$ChartSummaryCopyWithImpl(this._self, this._then);

  final ChartSummary _self;
  final $Res Function(ChartSummary) _then;

  /// Create a copy of ChartSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeDataPoints = null,
    Object? expenseDataPoints = null,
    Object? labels = null,
  }) {
    return _then(_self.copyWith(
      incomeDataPoints: null == incomeDataPoints
          ? _self.incomeDataPoints
          : incomeDataPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expenseDataPoints: null == expenseDataPoints
          ? _self.expenseDataPoints
          : expenseDataPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      labels: null == labels
          ? _self.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChartSummary].
extension ChartSummaryPatterns on ChartSummary {
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
    TResult Function(_ChartSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartSummary() when $default != null:
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
    TResult Function(_ChartSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummary():
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
    TResult? Function(_ChartSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummary() when $default != null:
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
    TResult Function(List<double> incomeDataPoints,
            List<double> expenseDataPoints, List<String> labels)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartSummary() when $default != null:
        return $default(
            _that.incomeDataPoints, _that.expenseDataPoints, _that.labels);
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
    TResult Function(List<double> incomeDataPoints,
            List<double> expenseDataPoints, List<String> labels)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummary():
        return $default(
            _that.incomeDataPoints, _that.expenseDataPoints, _that.labels);
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
    TResult? Function(List<double> incomeDataPoints,
            List<double> expenseDataPoints, List<String> labels)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummary() when $default != null:
        return $default(
            _that.incomeDataPoints, _that.expenseDataPoints, _that.labels);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChartSummary implements ChartSummary {
  const _ChartSummary(
      {required final List<double> incomeDataPoints,
      required final List<double> expenseDataPoints,
      required final List<String> labels})
      : _incomeDataPoints = incomeDataPoints,
        _expenseDataPoints = expenseDataPoints,
        _labels = labels;

  final List<double> _incomeDataPoints;
  @override
  List<double> get incomeDataPoints {
    if (_incomeDataPoints is EqualUnmodifiableListView)
      return _incomeDataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeDataPoints);
  }

  final List<double> _expenseDataPoints;
  @override
  List<double> get expenseDataPoints {
    if (_expenseDataPoints is EqualUnmodifiableListView)
      return _expenseDataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseDataPoints);
  }

  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  /// Create a copy of ChartSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChartSummaryCopyWith<_ChartSummary> get copyWith =>
      __$ChartSummaryCopyWithImpl<_ChartSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartSummary &&
            const DeepCollectionEquality()
                .equals(other._incomeDataPoints, _incomeDataPoints) &&
            const DeepCollectionEquality()
                .equals(other._expenseDataPoints, _expenseDataPoints) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_incomeDataPoints),
      const DeepCollectionEquality().hash(_expenseDataPoints),
      const DeepCollectionEquality().hash(_labels));

  @override
  String toString() {
    return 'ChartSummary(incomeDataPoints: $incomeDataPoints, expenseDataPoints: $expenseDataPoints, labels: $labels)';
  }
}

/// @nodoc
abstract mixin class _$ChartSummaryCopyWith<$Res>
    implements $ChartSummaryCopyWith<$Res> {
  factory _$ChartSummaryCopyWith(
          _ChartSummary value, $Res Function(_ChartSummary) _then) =
      __$ChartSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<double> incomeDataPoints,
      List<double> expenseDataPoints,
      List<String> labels});
}

/// @nodoc
class __$ChartSummaryCopyWithImpl<$Res>
    implements _$ChartSummaryCopyWith<$Res> {
  __$ChartSummaryCopyWithImpl(this._self, this._then);

  final _ChartSummary _self;
  final $Res Function(_ChartSummary) _then;

  /// Create a copy of ChartSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incomeDataPoints = null,
    Object? expenseDataPoints = null,
    Object? labels = null,
  }) {
    return _then(_ChartSummary(
      incomeDataPoints: null == incomeDataPoints
          ? _self._incomeDataPoints
          : incomeDataPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expenseDataPoints: null == expenseDataPoints
          ? _self._expenseDataPoints
          : expenseDataPoints // ignore: cast_nullable_to_non_nullable
              as List<double>,
      labels: null == labels
          ? _self._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
