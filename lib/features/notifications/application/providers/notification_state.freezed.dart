// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationState()';
  }
}

/// @nodoc
class $NotificationStateCopyWith<$Res> {
  $NotificationStateCopyWith(
      NotificationState _, $Res Function(NotificationState) __);
}

/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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
    TResult Function(NotificationStateInitial value)? initial,
    TResult Function(NotificationStateLoading value)? loading,
    TResult Function(NotificationStateData value)? data,
    TResult Function(NotificationStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial() when initial != null:
        return initial(_that);
      case NotificationStateLoading() when loading != null:
        return loading(_that);
      case NotificationStateData() when data != null:
        return data(_that);
      case NotificationStateError() when error != null:
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
    required TResult Function(NotificationStateInitial value) initial,
    required TResult Function(NotificationStateLoading value) loading,
    required TResult Function(NotificationStateData value) data,
    required TResult Function(NotificationStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial():
        return initial(_that);
      case NotificationStateLoading():
        return loading(_that);
      case NotificationStateData():
        return data(_that);
      case NotificationStateError():
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
    TResult? Function(NotificationStateInitial value)? initial,
    TResult? Function(NotificationStateLoading value)? loading,
    TResult? Function(NotificationStateData value)? data,
    TResult? Function(NotificationStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial() when initial != null:
        return initial(_that);
      case NotificationStateLoading() when loading != null:
        return loading(_that);
      case NotificationStateData() when data != null:
        return data(_that);
      case NotificationStateError() when error != null:
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
    TResult Function(List<NotificationItem> notifications)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial() when initial != null:
        return initial();
      case NotificationStateLoading() when loading != null:
        return loading();
      case NotificationStateData() when data != null:
        return data(_that.notifications);
      case NotificationStateError() when error != null:
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
    required TResult Function(List<NotificationItem> notifications) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial():
        return initial();
      case NotificationStateLoading():
        return loading();
      case NotificationStateData():
        return data(_that.notifications);
      case NotificationStateError():
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
    TResult? Function(List<NotificationItem> notifications)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationStateInitial() when initial != null:
        return initial();
      case NotificationStateLoading() when loading != null:
        return loading();
      case NotificationStateData() when data != null:
        return data(_that.notifications);
      case NotificationStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationStateInitial implements NotificationState {
  const NotificationStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationState.initial()';
  }
}

/// @nodoc

class NotificationStateLoading implements NotificationState {
  const NotificationStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationState.loading()';
  }
}

/// @nodoc

class NotificationStateData implements NotificationState {
  const NotificationStateData(
      {required final List<NotificationItem> notifications})
      : _notifications = notifications;

  final List<NotificationItem> _notifications;
  List<NotificationItem> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationStateDataCopyWith<NotificationStateData> get copyWith =>
      _$NotificationStateDataCopyWithImpl<NotificationStateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationStateData &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @override
  String toString() {
    return 'NotificationState.data(notifications: $notifications)';
  }
}

/// @nodoc
abstract mixin class $NotificationStateDataCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory $NotificationStateDataCopyWith(NotificationStateData value,
          $Res Function(NotificationStateData) _then) =
      _$NotificationStateDataCopyWithImpl;
  @useResult
  $Res call({List<NotificationItem> notifications});
}

/// @nodoc
class _$NotificationStateDataCopyWithImpl<$Res>
    implements $NotificationStateDataCopyWith<$Res> {
  _$NotificationStateDataCopyWithImpl(this._self, this._then);

  final NotificationStateData _self;
  final $Res Function(NotificationStateData) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
  }) {
    return _then(NotificationStateData(
      notifications: null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationItem>,
    ));
  }
}

/// @nodoc

class NotificationStateError implements NotificationState {
  const NotificationStateError(this.message);

  final String message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationStateErrorCopyWith<NotificationStateError> get copyWith =>
      _$NotificationStateErrorCopyWithImpl<NotificationStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NotificationState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NotificationStateErrorCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory $NotificationStateErrorCopyWith(NotificationStateError value,
          $Res Function(NotificationStateError) _then) =
      _$NotificationStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NotificationStateErrorCopyWithImpl<$Res>
    implements $NotificationStateErrorCopyWith<$Res> {
  _$NotificationStateErrorCopyWithImpl(this._self, this._then);

  final NotificationStateError _self;
  final $Res Function(NotificationStateError) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NotificationStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
