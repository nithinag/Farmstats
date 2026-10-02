// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupMetadataModel {
  String get id;
  String get fileName;
  String get filePath;
  String get timestamp;
  int get fileSizeBytes;
  String get databaseVersion;
  String get checksum;
  bool get isAutoBackup;

  /// Create a copy of BackupMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BackupMetadataModelCopyWith<BackupMetadataModel> get copyWith =>
      _$BackupMetadataModelCopyWithImpl<BackupMetadataModel>(
          this as BackupMetadataModel, _$identity);

  /// Serializes this BackupMetadataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BackupMetadataModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.fileSizeBytes, fileSizeBytes) ||
                other.fileSizeBytes == fileSizeBytes) &&
            (identical(other.databaseVersion, databaseVersion) ||
                other.databaseVersion == databaseVersion) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.isAutoBackup, isAutoBackup) ||
                other.isAutoBackup == isAutoBackup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, filePath,
      timestamp, fileSizeBytes, databaseVersion, checksum, isAutoBackup);

  @override
  String toString() {
    return 'BackupMetadataModel(id: $id, fileName: $fileName, filePath: $filePath, timestamp: $timestamp, fileSizeBytes: $fileSizeBytes, databaseVersion: $databaseVersion, checksum: $checksum, isAutoBackup: $isAutoBackup)';
  }
}

/// @nodoc
abstract mixin class $BackupMetadataModelCopyWith<$Res> {
  factory $BackupMetadataModelCopyWith(
          BackupMetadataModel value, $Res Function(BackupMetadataModel) _then) =
      _$BackupMetadataModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fileName,
      String filePath,
      String timestamp,
      int fileSizeBytes,
      String databaseVersion,
      String checksum,
      bool isAutoBackup});
}

/// @nodoc
class _$BackupMetadataModelCopyWithImpl<$Res>
    implements $BackupMetadataModelCopyWith<$Res> {
  _$BackupMetadataModelCopyWithImpl(this._self, this._then);

  final BackupMetadataModel _self;
  final $Res Function(BackupMetadataModel) _then;

  /// Create a copy of BackupMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? timestamp = null,
    Object? fileSizeBytes = null,
    Object? databaseVersion = null,
    Object? checksum = null,
    Object? isAutoBackup = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      fileSizeBytes: null == fileSizeBytes
          ? _self.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      databaseVersion: null == databaseVersion
          ? _self.databaseVersion
          : databaseVersion // ignore: cast_nullable_to_non_nullable
              as String,
      checksum: null == checksum
          ? _self.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoBackup: null == isAutoBackup
          ? _self.isAutoBackup
          : isAutoBackup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [BackupMetadataModel].
extension BackupMetadataModelPatterns on BackupMetadataModel {
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
    TResult Function(_BackupMetadataModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel() when $default != null:
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
    TResult Function(_BackupMetadataModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel():
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
    TResult? Function(_BackupMetadataModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel() when $default != null:
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
            String id,
            String fileName,
            String filePath,
            String timestamp,
            int fileSizeBytes,
            String databaseVersion,
            String checksum,
            bool isAutoBackup)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel() when $default != null:
        return $default(
            _that.id,
            _that.fileName,
            _that.filePath,
            _that.timestamp,
            _that.fileSizeBytes,
            _that.databaseVersion,
            _that.checksum,
            _that.isAutoBackup);
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
            String id,
            String fileName,
            String filePath,
            String timestamp,
            int fileSizeBytes,
            String databaseVersion,
            String checksum,
            bool isAutoBackup)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel():
        return $default(
            _that.id,
            _that.fileName,
            _that.filePath,
            _that.timestamp,
            _that.fileSizeBytes,
            _that.databaseVersion,
            _that.checksum,
            _that.isAutoBackup);
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
            String id,
            String fileName,
            String filePath,
            String timestamp,
            int fileSizeBytes,
            String databaseVersion,
            String checksum,
            bool isAutoBackup)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BackupMetadataModel() when $default != null:
        return $default(
            _that.id,
            _that.fileName,
            _that.filePath,
            _that.timestamp,
            _that.fileSizeBytes,
            _that.databaseVersion,
            _that.checksum,
            _that.isAutoBackup);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BackupMetadataModel implements BackupMetadataModel {
  const _BackupMetadataModel(
      {required this.id,
      required this.fileName,
      required this.filePath,
      required this.timestamp,
      required this.fileSizeBytes,
      required this.databaseVersion,
      required this.checksum,
      required this.isAutoBackup});
  factory _BackupMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$BackupMetadataModelFromJson(json);

  @override
  final String id;
  @override
  final String fileName;
  @override
  final String filePath;
  @override
  final String timestamp;
  @override
  final int fileSizeBytes;
  @override
  final String databaseVersion;
  @override
  final String checksum;
  @override
  final bool isAutoBackup;

  /// Create a copy of BackupMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BackupMetadataModelCopyWith<_BackupMetadataModel> get copyWith =>
      __$BackupMetadataModelCopyWithImpl<_BackupMetadataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BackupMetadataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BackupMetadataModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.fileSizeBytes, fileSizeBytes) ||
                other.fileSizeBytes == fileSizeBytes) &&
            (identical(other.databaseVersion, databaseVersion) ||
                other.databaseVersion == databaseVersion) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.isAutoBackup, isAutoBackup) ||
                other.isAutoBackup == isAutoBackup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, filePath,
      timestamp, fileSizeBytes, databaseVersion, checksum, isAutoBackup);

  @override
  String toString() {
    return 'BackupMetadataModel(id: $id, fileName: $fileName, filePath: $filePath, timestamp: $timestamp, fileSizeBytes: $fileSizeBytes, databaseVersion: $databaseVersion, checksum: $checksum, isAutoBackup: $isAutoBackup)';
  }
}

/// @nodoc
abstract mixin class _$BackupMetadataModelCopyWith<$Res>
    implements $BackupMetadataModelCopyWith<$Res> {
  factory _$BackupMetadataModelCopyWith(_BackupMetadataModel value,
          $Res Function(_BackupMetadataModel) _then) =
      __$BackupMetadataModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fileName,
      String filePath,
      String timestamp,
      int fileSizeBytes,
      String databaseVersion,
      String checksum,
      bool isAutoBackup});
}

/// @nodoc
class __$BackupMetadataModelCopyWithImpl<$Res>
    implements _$BackupMetadataModelCopyWith<$Res> {
  __$BackupMetadataModelCopyWithImpl(this._self, this._then);

  final _BackupMetadataModel _self;
  final $Res Function(_BackupMetadataModel) _then;

  /// Create a copy of BackupMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? timestamp = null,
    Object? fileSizeBytes = null,
    Object? databaseVersion = null,
    Object? checksum = null,
    Object? isAutoBackup = null,
  }) {
    return _then(_BackupMetadataModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      fileSizeBytes: null == fileSizeBytes
          ? _self.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      databaseVersion: null == databaseVersion
          ? _self.databaseVersion
          : databaseVersion // ignore: cast_nullable_to_non_nullable
              as String,
      checksum: null == checksum
          ? _self.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoBackup: null == isAutoBackup
          ? _self.isAutoBackup
          : isAutoBackup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
