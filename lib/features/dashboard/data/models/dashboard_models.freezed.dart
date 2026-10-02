// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardDataModel {
  @JsonKey(name: 'summary')
  DashboardSummaryModel get summary;
  @JsonKey(name: 'metrics')
  List<MetricCardModel> get metrics;
  @JsonKey(name: 'quick_actions')
  List<QuickActionModel> get quickActions;
  @JsonKey(name: 'recent_activities')
  List<RecentActivityModel> get recentActivities;
  @JsonKey(name: 'chart_summary')
  ChartSummaryModel get chartSummary;

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardDataModelCopyWith<DashboardDataModel> get copyWith =>
      _$DashboardDataModelCopyWithImpl<DashboardDataModel>(
          this as DashboardDataModel, _$identity);

  /// Serializes this DashboardDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardDataModel &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other.metrics, metrics) &&
            const DeepCollectionEquality()
                .equals(other.quickActions, quickActions) &&
            const DeepCollectionEquality()
                .equals(other.recentActivities, recentActivities) &&
            (identical(other.chartSummary, chartSummary) ||
                other.chartSummary == chartSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'DashboardDataModel(summary: $summary, metrics: $metrics, quickActions: $quickActions, recentActivities: $recentActivities, chartSummary: $chartSummary)';
  }
}

/// @nodoc
abstract mixin class $DashboardDataModelCopyWith<$Res> {
  factory $DashboardDataModelCopyWith(
          DashboardDataModel value, $Res Function(DashboardDataModel) _then) =
      _$DashboardDataModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') DashboardSummaryModel summary,
      @JsonKey(name: 'metrics') List<MetricCardModel> metrics,
      @JsonKey(name: 'quick_actions') List<QuickActionModel> quickActions,
      @JsonKey(name: 'recent_activities')
      List<RecentActivityModel> recentActivities,
      @JsonKey(name: 'chart_summary') ChartSummaryModel chartSummary});

  $DashboardSummaryModelCopyWith<$Res> get summary;
  $ChartSummaryModelCopyWith<$Res> get chartSummary;
}

/// @nodoc
class _$DashboardDataModelCopyWithImpl<$Res>
    implements $DashboardDataModelCopyWith<$Res> {
  _$DashboardDataModelCopyWithImpl(this._self, this._then);

  final DashboardDataModel _self;
  final $Res Function(DashboardDataModel) _then;

  /// Create a copy of DashboardDataModel
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
              as DashboardSummaryModel,
      metrics: null == metrics
          ? _self.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricCardModel>,
      quickActions: null == quickActions
          ? _self.quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      recentActivities: null == recentActivities
          ? _self.recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivityModel>,
      chartSummary: null == chartSummary
          ? _self.chartSummary
          : chartSummary // ignore: cast_nullable_to_non_nullable
              as ChartSummaryModel,
    ));
  }

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardSummaryModelCopyWith<$Res> get summary {
    return $DashboardSummaryModelCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartSummaryModelCopyWith<$Res> get chartSummary {
    return $ChartSummaryModelCopyWith<$Res>(_self.chartSummary, (value) {
      return _then(_self.copyWith(chartSummary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DashboardDataModel].
extension DashboardDataModelPatterns on DashboardDataModel {
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
    TResult Function(_DashboardDataModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel() when $default != null:
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
    TResult Function(_DashboardDataModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel():
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
    TResult? Function(_DashboardDataModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel() when $default != null:
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
            @JsonKey(name: 'summary') DashboardSummaryModel summary,
            @JsonKey(name: 'metrics') List<MetricCardModel> metrics,
            @JsonKey(name: 'quick_actions') List<QuickActionModel> quickActions,
            @JsonKey(name: 'recent_activities')
            List<RecentActivityModel> recentActivities,
            @JsonKey(name: 'chart_summary') ChartSummaryModel chartSummary)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel() when $default != null:
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
            @JsonKey(name: 'summary') DashboardSummaryModel summary,
            @JsonKey(name: 'metrics') List<MetricCardModel> metrics,
            @JsonKey(name: 'quick_actions') List<QuickActionModel> quickActions,
            @JsonKey(name: 'recent_activities')
            List<RecentActivityModel> recentActivities,
            @JsonKey(name: 'chart_summary') ChartSummaryModel chartSummary)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel():
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
            @JsonKey(name: 'summary') DashboardSummaryModel summary,
            @JsonKey(name: 'metrics') List<MetricCardModel> metrics,
            @JsonKey(name: 'quick_actions') List<QuickActionModel> quickActions,
            @JsonKey(name: 'recent_activities')
            List<RecentActivityModel> recentActivities,
            @JsonKey(name: 'chart_summary') ChartSummaryModel chartSummary)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardDataModel() when $default != null:
        return $default(_that.summary, _that.metrics, _that.quickActions,
            _that.recentActivities, _that.chartSummary);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardDataModel implements DashboardDataModel {
  const _DashboardDataModel(
      {@JsonKey(name: 'summary') required this.summary,
      @JsonKey(name: 'metrics') required final List<MetricCardModel> metrics,
      @JsonKey(name: 'quick_actions')
      required final List<QuickActionModel> quickActions,
      @JsonKey(name: 'recent_activities')
      required final List<RecentActivityModel> recentActivities,
      @JsonKey(name: 'chart_summary') required this.chartSummary})
      : _metrics = metrics,
        _quickActions = quickActions,
        _recentActivities = recentActivities;
  factory _DashboardDataModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataModelFromJson(json);

  @override
  @JsonKey(name: 'summary')
  final DashboardSummaryModel summary;
  final List<MetricCardModel> _metrics;
  @override
  @JsonKey(name: 'metrics')
  List<MetricCardModel> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final List<QuickActionModel> _quickActions;
  @override
  @JsonKey(name: 'quick_actions')
  List<QuickActionModel> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  final List<RecentActivityModel> _recentActivities;
  @override
  @JsonKey(name: 'recent_activities')
  List<RecentActivityModel> get recentActivities {
    if (_recentActivities is EqualUnmodifiableListView)
      return _recentActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivities);
  }

  @override
  @JsonKey(name: 'chart_summary')
  final ChartSummaryModel chartSummary;

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardDataModelCopyWith<_DashboardDataModel> get copyWith =>
      __$DashboardDataModelCopyWithImpl<_DashboardDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardDataModel &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality()
                .equals(other._quickActions, _quickActions) &&
            const DeepCollectionEquality()
                .equals(other._recentActivities, _recentActivities) &&
            (identical(other.chartSummary, chartSummary) ||
                other.chartSummary == chartSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'DashboardDataModel(summary: $summary, metrics: $metrics, quickActions: $quickActions, recentActivities: $recentActivities, chartSummary: $chartSummary)';
  }
}

/// @nodoc
abstract mixin class _$DashboardDataModelCopyWith<$Res>
    implements $DashboardDataModelCopyWith<$Res> {
  factory _$DashboardDataModelCopyWith(
          _DashboardDataModel value, $Res Function(_DashboardDataModel) _then) =
      __$DashboardDataModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') DashboardSummaryModel summary,
      @JsonKey(name: 'metrics') List<MetricCardModel> metrics,
      @JsonKey(name: 'quick_actions') List<QuickActionModel> quickActions,
      @JsonKey(name: 'recent_activities')
      List<RecentActivityModel> recentActivities,
      @JsonKey(name: 'chart_summary') ChartSummaryModel chartSummary});

  @override
  $DashboardSummaryModelCopyWith<$Res> get summary;
  @override
  $ChartSummaryModelCopyWith<$Res> get chartSummary;
}

/// @nodoc
class __$DashboardDataModelCopyWithImpl<$Res>
    implements _$DashboardDataModelCopyWith<$Res> {
  __$DashboardDataModelCopyWithImpl(this._self, this._then);

  final _DashboardDataModel _self;
  final $Res Function(_DashboardDataModel) _then;

  /// Create a copy of DashboardDataModel
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
    return _then(_DashboardDataModel(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DashboardSummaryModel,
      metrics: null == metrics
          ? _self._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricCardModel>,
      quickActions: null == quickActions
          ? _self._quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      recentActivities: null == recentActivities
          ? _self._recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivityModel>,
      chartSummary: null == chartSummary
          ? _self.chartSummary
          : chartSummary // ignore: cast_nullable_to_non_nullable
              as ChartSummaryModel,
    ));
  }

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardSummaryModelCopyWith<$Res> get summary {
    return $DashboardSummaryModelCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of DashboardDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartSummaryModelCopyWith<$Res> get chartSummary {
    return $ChartSummaryModelCopyWith<$Res>(_self.chartSummary, (value) {
      return _then(_self.copyWith(chartSummary: value));
    });
  }
}

/// @nodoc
mixin _$DashboardSummaryModel {
  @JsonKey(name: 'active_batches')
  int get activeBatches;
  @JsonKey(name: 'todays_tasks')
  int get todaysTasks;
  @JsonKey(name: 'net_income')
  double get netIncome;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardSummaryModelCopyWith<DashboardSummaryModel> get copyWith =>
      _$DashboardSummaryModelCopyWithImpl<DashboardSummaryModel>(
          this as DashboardSummaryModel, _$identity);

  /// Serializes this DashboardSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardSummaryModel &&
            (identical(other.activeBatches, activeBatches) ||
                other.activeBatches == activeBatches) &&
            (identical(other.todaysTasks, todaysTasks) ||
                other.todaysTasks == todaysTasks) &&
            (identical(other.netIncome, netIncome) ||
                other.netIncome == netIncome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activeBatches, todaysTasks, netIncome);

  @override
  String toString() {
    return 'DashboardSummaryModel(activeBatches: $activeBatches, todaysTasks: $todaysTasks, netIncome: $netIncome)';
  }
}

/// @nodoc
abstract mixin class $DashboardSummaryModelCopyWith<$Res> {
  factory $DashboardSummaryModelCopyWith(DashboardSummaryModel value,
          $Res Function(DashboardSummaryModel) _then) =
      _$DashboardSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'active_batches') int activeBatches,
      @JsonKey(name: 'todays_tasks') int todaysTasks,
      @JsonKey(name: 'net_income') double netIncome});
}

/// @nodoc
class _$DashboardSummaryModelCopyWithImpl<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  _$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final DashboardSummaryModel _self;
  final $Res Function(DashboardSummaryModel) _then;

  /// Create a copy of DashboardSummaryModel
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

/// Adds pattern-matching-related methods to [DashboardSummaryModel].
extension DashboardSummaryModelPatterns on DashboardSummaryModel {
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
    TResult Function(_DashboardSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
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
    TResult Function(_DashboardSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel():
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
    TResult? Function(_DashboardSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
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
            @JsonKey(name: 'active_batches') int activeBatches,
            @JsonKey(name: 'todays_tasks') int todaysTasks,
            @JsonKey(name: 'net_income') double netIncome)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'active_batches') int activeBatches,
            @JsonKey(name: 'todays_tasks') int todaysTasks,
            @JsonKey(name: 'net_income') double netIncome)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel():
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
    TResult? Function(
            @JsonKey(name: 'active_batches') int activeBatches,
            @JsonKey(name: 'todays_tasks') int todaysTasks,
            @JsonKey(name: 'net_income') double netIncome)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummaryModel() when $default != null:
        return $default(
            _that.activeBatches, _that.todaysTasks, _that.netIncome);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardSummaryModel implements DashboardSummaryModel {
  const _DashboardSummaryModel(
      {@JsonKey(name: 'active_batches') required this.activeBatches,
      @JsonKey(name: 'todays_tasks') required this.todaysTasks,
      @JsonKey(name: 'net_income') required this.netIncome});
  factory _DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

  @override
  @JsonKey(name: 'active_batches')
  final int activeBatches;
  @override
  @JsonKey(name: 'todays_tasks')
  final int todaysTasks;
  @override
  @JsonKey(name: 'net_income')
  final double netIncome;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardSummaryModelCopyWith<_DashboardSummaryModel> get copyWith =>
      __$DashboardSummaryModelCopyWithImpl<_DashboardSummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardSummaryModel &&
            (identical(other.activeBatches, activeBatches) ||
                other.activeBatches == activeBatches) &&
            (identical(other.todaysTasks, todaysTasks) ||
                other.todaysTasks == todaysTasks) &&
            (identical(other.netIncome, netIncome) ||
                other.netIncome == netIncome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activeBatches, todaysTasks, netIncome);

  @override
  String toString() {
    return 'DashboardSummaryModel(activeBatches: $activeBatches, todaysTasks: $todaysTasks, netIncome: $netIncome)';
  }
}

/// @nodoc
abstract mixin class _$DashboardSummaryModelCopyWith<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  factory _$DashboardSummaryModelCopyWith(_DashboardSummaryModel value,
          $Res Function(_DashboardSummaryModel) _then) =
      __$DashboardSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active_batches') int activeBatches,
      @JsonKey(name: 'todays_tasks') int todaysTasks,
      @JsonKey(name: 'net_income') double netIncome});
}

/// @nodoc
class __$DashboardSummaryModelCopyWithImpl<$Res>
    implements _$DashboardSummaryModelCopyWith<$Res> {
  __$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final _DashboardSummaryModel _self;
  final $Res Function(_DashboardSummaryModel) _then;

  /// Create a copy of DashboardSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeBatches = null,
    Object? todaysTasks = null,
    Object? netIncome = null,
  }) {
    return _then(_DashboardSummaryModel(
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
mixin _$MetricCardModel {
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'value')
  String get value;
  @JsonKey(name: 'icon_type')
  String get iconType;

  /// Create a copy of MetricCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetricCardModelCopyWith<MetricCardModel> get copyWith =>
      _$MetricCardModelCopyWithImpl<MetricCardModel>(
          this as MetricCardModel, _$identity);

  /// Serializes this MetricCardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetricCardModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value, iconType);

  @override
  String toString() {
    return 'MetricCardModel(title: $title, value: $value, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class $MetricCardModelCopyWith<$Res> {
  factory $MetricCardModelCopyWith(
          MetricCardModel value, $Res Function(MetricCardModel) _then) =
      _$MetricCardModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'value') String value,
      @JsonKey(name: 'icon_type') String iconType});
}

/// @nodoc
class _$MetricCardModelCopyWithImpl<$Res>
    implements $MetricCardModelCopyWith<$Res> {
  _$MetricCardModelCopyWithImpl(this._self, this._then);

  final MetricCardModel _self;
  final $Res Function(MetricCardModel) _then;

  /// Create a copy of MetricCardModel
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

/// Adds pattern-matching-related methods to [MetricCardModel].
extension MetricCardModelPatterns on MetricCardModel {
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
    TResult Function(_MetricCardModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel() when $default != null:
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
    TResult Function(_MetricCardModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel():
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
    TResult? Function(_MetricCardModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel() when $default != null:
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
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'value') String value,
            @JsonKey(name: 'icon_type') String iconType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'value') String value,
            @JsonKey(name: 'icon_type') String iconType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel():
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
    TResult? Function(
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'value') String value,
            @JsonKey(name: 'icon_type') String iconType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MetricCardModel() when $default != null:
        return $default(_that.title, _that.value, _that.iconType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MetricCardModel implements MetricCardModel {
  const _MetricCardModel(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'value') required this.value,
      @JsonKey(name: 'icon_type') required this.iconType});
  factory _MetricCardModel.fromJson(Map<String, dynamic> json) =>
      _$MetricCardModelFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'value')
  final String value;
  @override
  @JsonKey(name: 'icon_type')
  final String iconType;

  /// Create a copy of MetricCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MetricCardModelCopyWith<_MetricCardModel> get copyWith =>
      __$MetricCardModelCopyWithImpl<_MetricCardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MetricCardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MetricCardModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value, iconType);

  @override
  String toString() {
    return 'MetricCardModel(title: $title, value: $value, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class _$MetricCardModelCopyWith<$Res>
    implements $MetricCardModelCopyWith<$Res> {
  factory _$MetricCardModelCopyWith(
          _MetricCardModel value, $Res Function(_MetricCardModel) _then) =
      __$MetricCardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'value') String value,
      @JsonKey(name: 'icon_type') String iconType});
}

/// @nodoc
class __$MetricCardModelCopyWithImpl<$Res>
    implements _$MetricCardModelCopyWith<$Res> {
  __$MetricCardModelCopyWithImpl(this._self, this._then);

  final _MetricCardModel _self;
  final $Res Function(_MetricCardModel) _then;

  /// Create a copy of MetricCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? iconType = null,
  }) {
    return _then(_MetricCardModel(
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
mixin _$QuickActionModel {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'label')
  String get label;
  @JsonKey(name: 'icon_type')
  String get iconType;

  /// Create a copy of QuickActionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuickActionModelCopyWith<QuickActionModel> get copyWith =>
      _$QuickActionModelCopyWithImpl<QuickActionModel>(
          this as QuickActionModel, _$identity);

  /// Serializes this QuickActionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuickActionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, iconType);

  @override
  String toString() {
    return 'QuickActionModel(id: $id, label: $label, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class $QuickActionModelCopyWith<$Res> {
  factory $QuickActionModelCopyWith(
          QuickActionModel value, $Res Function(QuickActionModel) _then) =
      _$QuickActionModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'icon_type') String iconType});
}

/// @nodoc
class _$QuickActionModelCopyWithImpl<$Res>
    implements $QuickActionModelCopyWith<$Res> {
  _$QuickActionModelCopyWithImpl(this._self, this._then);

  final QuickActionModel _self;
  final $Res Function(QuickActionModel) _then;

  /// Create a copy of QuickActionModel
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

/// Adds pattern-matching-related methods to [QuickActionModel].
extension QuickActionModelPatterns on QuickActionModel {
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
    TResult Function(_QuickActionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel() when $default != null:
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
    TResult Function(_QuickActionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel():
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
    TResult? Function(_QuickActionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'icon_type') String iconType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'icon_type') String iconType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel():
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
    TResult? Function(
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'icon_type') String iconType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuickActionModel() when $default != null:
        return $default(_that.id, _that.label, _that.iconType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuickActionModel implements QuickActionModel {
  const _QuickActionModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label,
      @JsonKey(name: 'icon_type') required this.iconType});
  factory _QuickActionModel.fromJson(Map<String, dynamic> json) =>
      _$QuickActionModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'icon_type')
  final String iconType;

  /// Create a copy of QuickActionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuickActionModelCopyWith<_QuickActionModel> get copyWith =>
      __$QuickActionModelCopyWithImpl<_QuickActionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuickActionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuickActionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.iconType, iconType) ||
                other.iconType == iconType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, iconType);

  @override
  String toString() {
    return 'QuickActionModel(id: $id, label: $label, iconType: $iconType)';
  }
}

/// @nodoc
abstract mixin class _$QuickActionModelCopyWith<$Res>
    implements $QuickActionModelCopyWith<$Res> {
  factory _$QuickActionModelCopyWith(
          _QuickActionModel value, $Res Function(_QuickActionModel) _then) =
      __$QuickActionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'icon_type') String iconType});
}

/// @nodoc
class __$QuickActionModelCopyWithImpl<$Res>
    implements _$QuickActionModelCopyWith<$Res> {
  __$QuickActionModelCopyWithImpl(this._self, this._then);

  final _QuickActionModel _self;
  final $Res Function(_QuickActionModel) _then;

  /// Create a copy of QuickActionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? iconType = null,
  }) {
    return _then(_QuickActionModel(
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
mixin _$RecentActivityModel {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'subtitle')
  String get subtitle;
  @JsonKey(name: 'timestamp')
  String get timestamp;
  @JsonKey(name: 'activity_type')
  String get activityType;

  /// Create a copy of RecentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentActivityModelCopyWith<RecentActivityModel> get copyWith =>
      _$RecentActivityModelCopyWithImpl<RecentActivityModel>(
          this as RecentActivityModel, _$identity);

  /// Serializes this RecentActivityModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentActivityModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, timestamp, activityType);

  @override
  String toString() {
    return 'RecentActivityModel(id: $id, title: $title, subtitle: $subtitle, timestamp: $timestamp, activityType: $activityType)';
  }
}

/// @nodoc
abstract mixin class $RecentActivityModelCopyWith<$Res> {
  factory $RecentActivityModelCopyWith(
          RecentActivityModel value, $Res Function(RecentActivityModel) _then) =
      _$RecentActivityModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'subtitle') String subtitle,
      @JsonKey(name: 'timestamp') String timestamp,
      @JsonKey(name: 'activity_type') String activityType});
}

/// @nodoc
class _$RecentActivityModelCopyWithImpl<$Res>
    implements $RecentActivityModelCopyWith<$Res> {
  _$RecentActivityModelCopyWithImpl(this._self, this._then);

  final RecentActivityModel _self;
  final $Res Function(RecentActivityModel) _then;

  /// Create a copy of RecentActivityModel
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
              as String,
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RecentActivityModel].
extension RecentActivityModelPatterns on RecentActivityModel {
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
    TResult Function(_RecentActivityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel() when $default != null:
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
    TResult Function(_RecentActivityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel():
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
    TResult? Function(_RecentActivityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'subtitle') String subtitle,
            @JsonKey(name: 'timestamp') String timestamp,
            @JsonKey(name: 'activity_type') String activityType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'subtitle') String subtitle,
            @JsonKey(name: 'timestamp') String timestamp,
            @JsonKey(name: 'activity_type') String activityType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel():
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
    TResult? Function(
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'title') String title,
            @JsonKey(name: 'subtitle') String subtitle,
            @JsonKey(name: 'timestamp') String timestamp,
            @JsonKey(name: 'activity_type') String activityType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecentActivityModel() when $default != null:
        return $default(_that.id, _that.title, _that.subtitle, _that.timestamp,
            _that.activityType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RecentActivityModel implements RecentActivityModel {
  const _RecentActivityModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'subtitle') required this.subtitle,
      @JsonKey(name: 'timestamp') required this.timestamp,
      @JsonKey(name: 'activity_type') required this.activityType});
  factory _RecentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'subtitle')
  final String subtitle;
  @override
  @JsonKey(name: 'timestamp')
  final String timestamp;
  @override
  @JsonKey(name: 'activity_type')
  final String activityType;

  /// Create a copy of RecentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentActivityModelCopyWith<_RecentActivityModel> get copyWith =>
      __$RecentActivityModelCopyWithImpl<_RecentActivityModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecentActivityModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentActivityModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, subtitle, timestamp, activityType);

  @override
  String toString() {
    return 'RecentActivityModel(id: $id, title: $title, subtitle: $subtitle, timestamp: $timestamp, activityType: $activityType)';
  }
}

/// @nodoc
abstract mixin class _$RecentActivityModelCopyWith<$Res>
    implements $RecentActivityModelCopyWith<$Res> {
  factory _$RecentActivityModelCopyWith(_RecentActivityModel value,
          $Res Function(_RecentActivityModel) _then) =
      __$RecentActivityModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'subtitle') String subtitle,
      @JsonKey(name: 'timestamp') String timestamp,
      @JsonKey(name: 'activity_type') String activityType});
}

/// @nodoc
class __$RecentActivityModelCopyWithImpl<$Res>
    implements _$RecentActivityModelCopyWith<$Res> {
  __$RecentActivityModelCopyWithImpl(this._self, this._then);

  final _RecentActivityModel _self;
  final $Res Function(_RecentActivityModel) _then;

  /// Create a copy of RecentActivityModel
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
    return _then(_RecentActivityModel(
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
              as String,
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ChartSummaryModel {
  @JsonKey(name: 'income_data_points')
  List<double> get incomeDataPoints;
  @JsonKey(name: 'expense_data_points')
  List<double> get expenseDataPoints;
  @JsonKey(name: 'labels')
  List<String> get labels;

  /// Create a copy of ChartSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartSummaryModelCopyWith<ChartSummaryModel> get copyWith =>
      _$ChartSummaryModelCopyWithImpl<ChartSummaryModel>(
          this as ChartSummaryModel, _$identity);

  /// Serializes this ChartSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartSummaryModel &&
            const DeepCollectionEquality()
                .equals(other.incomeDataPoints, incomeDataPoints) &&
            const DeepCollectionEquality()
                .equals(other.expenseDataPoints, expenseDataPoints) &&
            const DeepCollectionEquality().equals(other.labels, labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(incomeDataPoints),
      const DeepCollectionEquality().hash(expenseDataPoints),
      const DeepCollectionEquality().hash(labels));

  @override
  String toString() {
    return 'ChartSummaryModel(incomeDataPoints: $incomeDataPoints, expenseDataPoints: $expenseDataPoints, labels: $labels)';
  }
}

/// @nodoc
abstract mixin class $ChartSummaryModelCopyWith<$Res> {
  factory $ChartSummaryModelCopyWith(
          ChartSummaryModel value, $Res Function(ChartSummaryModel) _then) =
      _$ChartSummaryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'income_data_points') List<double> incomeDataPoints,
      @JsonKey(name: 'expense_data_points') List<double> expenseDataPoints,
      @JsonKey(name: 'labels') List<String> labels});
}

/// @nodoc
class _$ChartSummaryModelCopyWithImpl<$Res>
    implements $ChartSummaryModelCopyWith<$Res> {
  _$ChartSummaryModelCopyWithImpl(this._self, this._then);

  final ChartSummaryModel _self;
  final $Res Function(ChartSummaryModel) _then;

  /// Create a copy of ChartSummaryModel
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

/// Adds pattern-matching-related methods to [ChartSummaryModel].
extension ChartSummaryModelPatterns on ChartSummaryModel {
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
    TResult Function(_ChartSummaryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel() when $default != null:
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
    TResult Function(_ChartSummaryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel():
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
    TResult? Function(_ChartSummaryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel() when $default != null:
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
            @JsonKey(name: 'income_data_points') List<double> incomeDataPoints,
            @JsonKey(name: 'expense_data_points')
            List<double> expenseDataPoints,
            @JsonKey(name: 'labels') List<String> labels)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'income_data_points') List<double> incomeDataPoints,
            @JsonKey(name: 'expense_data_points')
            List<double> expenseDataPoints,
            @JsonKey(name: 'labels') List<String> labels)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel():
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
    TResult? Function(
            @JsonKey(name: 'income_data_points') List<double> incomeDataPoints,
            @JsonKey(name: 'expense_data_points')
            List<double> expenseDataPoints,
            @JsonKey(name: 'labels') List<String> labels)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartSummaryModel() when $default != null:
        return $default(
            _that.incomeDataPoints, _that.expenseDataPoints, _that.labels);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChartSummaryModel implements ChartSummaryModel {
  const _ChartSummaryModel(
      {@JsonKey(name: 'income_data_points')
      required final List<double> incomeDataPoints,
      @JsonKey(name: 'expense_data_points')
      required final List<double> expenseDataPoints,
      @JsonKey(name: 'labels') required final List<String> labels})
      : _incomeDataPoints = incomeDataPoints,
        _expenseDataPoints = expenseDataPoints,
        _labels = labels;
  factory _ChartSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ChartSummaryModelFromJson(json);

  final List<double> _incomeDataPoints;
  @override
  @JsonKey(name: 'income_data_points')
  List<double> get incomeDataPoints {
    if (_incomeDataPoints is EqualUnmodifiableListView)
      return _incomeDataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeDataPoints);
  }

  final List<double> _expenseDataPoints;
  @override
  @JsonKey(name: 'expense_data_points')
  List<double> get expenseDataPoints {
    if (_expenseDataPoints is EqualUnmodifiableListView)
      return _expenseDataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseDataPoints);
  }

  final List<String> _labels;
  @override
  @JsonKey(name: 'labels')
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  /// Create a copy of ChartSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChartSummaryModelCopyWith<_ChartSummaryModel> get copyWith =>
      __$ChartSummaryModelCopyWithImpl<_ChartSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChartSummaryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartSummaryModel &&
            const DeepCollectionEquality()
                .equals(other._incomeDataPoints, _incomeDataPoints) &&
            const DeepCollectionEquality()
                .equals(other._expenseDataPoints, _expenseDataPoints) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_incomeDataPoints),
      const DeepCollectionEquality().hash(_expenseDataPoints),
      const DeepCollectionEquality().hash(_labels));

  @override
  String toString() {
    return 'ChartSummaryModel(incomeDataPoints: $incomeDataPoints, expenseDataPoints: $expenseDataPoints, labels: $labels)';
  }
}

/// @nodoc
abstract mixin class _$ChartSummaryModelCopyWith<$Res>
    implements $ChartSummaryModelCopyWith<$Res> {
  factory _$ChartSummaryModelCopyWith(
          _ChartSummaryModel value, $Res Function(_ChartSummaryModel) _then) =
      __$ChartSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'income_data_points') List<double> incomeDataPoints,
      @JsonKey(name: 'expense_data_points') List<double> expenseDataPoints,
      @JsonKey(name: 'labels') List<String> labels});
}

/// @nodoc
class __$ChartSummaryModelCopyWithImpl<$Res>
    implements _$ChartSummaryModelCopyWith<$Res> {
  __$ChartSummaryModelCopyWithImpl(this._self, this._then);

  final _ChartSummaryModel _self;
  final $Res Function(_ChartSummaryModel) _then;

  /// Create a copy of ChartSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incomeDataPoints = null,
    Object? expenseDataPoints = null,
    Object? labels = null,
  }) {
    return _then(_ChartSummaryModel(
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
