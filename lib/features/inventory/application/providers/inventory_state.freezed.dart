// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryState()';
  }
}

/// @nodoc
class $InventoryStateCopyWith<$Res> {
  $InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}

/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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
    TResult Function(InventoryStateInitial value)? initial,
    TResult Function(InventoryStateLoading value)? loading,
    TResult Function(InventoryStateData value)? data,
    TResult Function(InventoryStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial() when initial != null:
        return initial(_that);
      case InventoryStateLoading() when loading != null:
        return loading(_that);
      case InventoryStateData() when data != null:
        return data(_that);
      case InventoryStateError() when error != null:
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
    required TResult Function(InventoryStateInitial value) initial,
    required TResult Function(InventoryStateLoading value) loading,
    required TResult Function(InventoryStateData value) data,
    required TResult Function(InventoryStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial():
        return initial(_that);
      case InventoryStateLoading():
        return loading(_that);
      case InventoryStateData():
        return data(_that);
      case InventoryStateError():
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
    TResult? Function(InventoryStateInitial value)? initial,
    TResult? Function(InventoryStateLoading value)? loading,
    TResult? Function(InventoryStateData value)? data,
    TResult? Function(InventoryStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial() when initial != null:
        return initial(_that);
      case InventoryStateLoading() when loading != null:
        return loading(_that);
      case InventoryStateData() when data != null:
        return data(_that);
      case InventoryStateError() when error != null:
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
    TResult Function(List<InventoryItem> items)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial() when initial != null:
        return initial();
      case InventoryStateLoading() when loading != null:
        return loading();
      case InventoryStateData() when data != null:
        return data(_that.items);
      case InventoryStateError() when error != null:
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
    required TResult Function(List<InventoryItem> items) data,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial():
        return initial();
      case InventoryStateLoading():
        return loading();
      case InventoryStateData():
        return data(_that.items);
      case InventoryStateError():
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
    TResult? Function(List<InventoryItem> items)? data,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case InventoryStateInitial() when initial != null:
        return initial();
      case InventoryStateLoading() when loading != null:
        return loading();
      case InventoryStateData() when data != null:
        return data(_that.items);
      case InventoryStateError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class InventoryStateInitial implements InventoryState {
  const InventoryStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryState.initial()';
  }
}

/// @nodoc

class InventoryStateLoading implements InventoryState {
  const InventoryStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryState.loading()';
  }
}

/// @nodoc

class InventoryStateData implements InventoryState {
  const InventoryStateData(final List<InventoryItem> items) : _items = items;

  final List<InventoryItem> _items;
  List<InventoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryStateDataCopyWith<InventoryStateData> get copyWith =>
      _$InventoryStateDataCopyWithImpl<InventoryStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryStateData &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'InventoryState.data(items: $items)';
  }
}

/// @nodoc
abstract mixin class $InventoryStateDataCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory $InventoryStateDataCopyWith(
          InventoryStateData value, $Res Function(InventoryStateData) _then) =
      _$InventoryStateDataCopyWithImpl;
  @useResult
  $Res call({List<InventoryItem> items});
}

/// @nodoc
class _$InventoryStateDataCopyWithImpl<$Res>
    implements $InventoryStateDataCopyWith<$Res> {
  _$InventoryStateDataCopyWithImpl(this._self, this._then);

  final InventoryStateData _self;
  final $Res Function(InventoryStateData) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(InventoryStateData(
      null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InventoryItem>,
    ));
  }
}

/// @nodoc

class InventoryStateError implements InventoryState {
  const InventoryStateError(this.message);

  final String message;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InventoryStateErrorCopyWith<InventoryStateError> get copyWith =>
      _$InventoryStateErrorCopyWithImpl<InventoryStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InventoryStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'InventoryState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InventoryStateErrorCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory $InventoryStateErrorCopyWith(
          InventoryStateError value, $Res Function(InventoryStateError) _then) =
      _$InventoryStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$InventoryStateErrorCopyWithImpl<$Res>
    implements $InventoryStateErrorCopyWith<$Res> {
  _$InventoryStateErrorCopyWithImpl(this._self, this._then);

  final InventoryStateError _self;
  final $Res Function(InventoryStateError) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(InventoryStateError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
