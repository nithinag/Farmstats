// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState()';
  }
}

/// @nodoc
class $SettingsStateCopyWith<$Res> {
  $SettingsStateCopyWith(SettingsState _, $Res Function(SettingsState) __);
}

/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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
    TResult Function(SettingsStateInitial value)? initial,
    TResult Function(SettingsStateLoading value)? loading,
    TResult Function(SettingsStateData value)? data,
    TResult Function(SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial() when initial != null:
        return initial(_that);
      case SettingsStateLoading() when loading != null:
        return loading(_that);
      case SettingsStateData() when data != null:
        return data(_that);
      case SettingsStateError() when error != null:
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
    required TResult Function(SettingsStateInitial value) initial,
    required TResult Function(SettingsStateLoading value) loading,
    required TResult Function(SettingsStateData value) data,
    required TResult Function(SettingsStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial():
        return initial(_that);
      case SettingsStateLoading():
        return loading(_that);
      case SettingsStateData():
        return data(_that);
      case SettingsStateError():
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
    TResult? Function(SettingsStateInitial value)? initial,
    TResult? Function(SettingsStateLoading value)? loading,
    TResult? Function(SettingsStateData value)? data,
    TResult? Function(SettingsStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial() when initial != null:
        return initial(_that);
      case SettingsStateLoading() when loading != null:
        return loading(_that);
      case SettingsStateData() when data != null:
        return data(_that);
      case SettingsStateError() when error != null:
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
    TResult Function(FarmProfile profile, AppPreferences preferences)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial() when initial != null:
        return initial();
      case SettingsStateLoading() when loading != null:
        return loading();
      case SettingsStateData() when data != null:
        return data(_that.profile, _that.preferences);
      case SettingsStateError() when error != null:
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
    required TResult Function(FarmProfile profile, AppPreferences preferences)
        data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial():
        return initial();
      case SettingsStateLoading():
        return loading();
      case SettingsStateData():
        return data(_that.profile, _that.preferences);
      case SettingsStateError():
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
    TResult? Function(FarmProfile profile, AppPreferences preferences)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SettingsStateInitial() when initial != null:
        return initial();
      case SettingsStateLoading() when loading != null:
        return loading();
      case SettingsStateData() when data != null:
        return data(_that.profile, _that.preferences);
      case SettingsStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SettingsStateInitial implements SettingsState {
  const SettingsStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState.initial()';
  }
}

/// @nodoc

class SettingsStateLoading implements SettingsState {
  const SettingsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingsState.loading()';
  }
}

/// @nodoc

class SettingsStateData implements SettingsState {
  const SettingsStateData({required this.profile, required this.preferences});

  final FarmProfile profile;
  final AppPreferences preferences;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateDataCopyWith<SettingsStateData> get copyWith =>
      _$SettingsStateDataCopyWithImpl<SettingsStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsStateData &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, preferences);

  @override
  String toString() {
    return 'SettingsState.data(profile: $profile, preferences: $preferences)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateDataCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateDataCopyWith(
          SettingsStateData value, $Res Function(SettingsStateData) _then) =
      _$SettingsStateDataCopyWithImpl;
  @useResult
  $Res call({FarmProfile profile, AppPreferences preferences});

  $FarmProfileCopyWith<$Res> get profile;
  $AppPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$SettingsStateDataCopyWithImpl<$Res>
    implements $SettingsStateDataCopyWith<$Res> {
  _$SettingsStateDataCopyWithImpl(this._self, this._then);

  final SettingsStateData _self;
  final $Res Function(SettingsStateData) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? preferences = null,
  }) {
    return _then(SettingsStateData(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as FarmProfile,
      preferences: null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as AppPreferences,
    ));
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FarmProfileCopyWith<$Res> get profile {
    return $FarmProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppPreferencesCopyWith<$Res> get preferences {
    return $AppPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class SettingsStateError implements SettingsState {
  const SettingsStateError(this.message);

  final String message;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateErrorCopyWith<SettingsStateError> get copyWith =>
      _$SettingsStateErrorCopyWithImpl<SettingsStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SettingsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateErrorCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory $SettingsStateErrorCopyWith(
          SettingsStateError value, $Res Function(SettingsStateError) _then) =
      _$SettingsStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SettingsStateErrorCopyWithImpl<$Res>
    implements $SettingsStateErrorCopyWith<$Res> {
  _$SettingsStateErrorCopyWithImpl(this._self, this._then);

  final SettingsStateError _self;
  final $Res Function(SettingsStateError) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SettingsStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
