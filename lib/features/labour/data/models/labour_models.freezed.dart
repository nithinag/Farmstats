// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labour_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabourWorkerModel {
  String get id;
  String get fullName;
  String get phoneNumber;
  String? get address;
  String get role;
  double get dailyWage;
  String get joiningDate;
  String get status;
  String? get emergencyContact;
  String? get notes;

  /// Create a copy of LabourWorkerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabourWorkerModelCopyWith<LabourWorkerModel> get copyWith =>
      _$LabourWorkerModelCopyWithImpl<LabourWorkerModel>(
          this as LabourWorkerModel, _$identity);

  /// Serializes this LabourWorkerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabourWorkerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dailyWage, dailyWage) ||
                other.dailyWage == dailyWage) &&
            (identical(other.joiningDate, joiningDate) ||
                other.joiningDate == joiningDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emergencyContact, emergencyContact) ||
                other.emergencyContact == emergencyContact) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phoneNumber,
      address, role, dailyWage, joiningDate, status, emergencyContact, notes);

  @override
  String toString() {
    return 'LabourWorkerModel(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, role: $role, dailyWage: $dailyWage, joiningDate: $joiningDate, status: $status, emergencyContact: $emergencyContact, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $LabourWorkerModelCopyWith<$Res> {
  factory $LabourWorkerModelCopyWith(
          LabourWorkerModel value, $Res Function(LabourWorkerModel) _then) =
      _$LabourWorkerModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phoneNumber,
      String? address,
      String role,
      double dailyWage,
      String joiningDate,
      String status,
      String? emergencyContact,
      String? notes});
}

/// @nodoc
class _$LabourWorkerModelCopyWithImpl<$Res>
    implements $LabourWorkerModelCopyWith<$Res> {
  _$LabourWorkerModelCopyWithImpl(this._self, this._then);

  final LabourWorkerModel _self;
  final $Res Function(LabourWorkerModel) _then;

  /// Create a copy of LabourWorkerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? role = null,
    Object? dailyWage = null,
    Object? joiningDate = null,
    Object? status = null,
    Object? emergencyContact = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      dailyWage: null == dailyWage
          ? _self.dailyWage
          : dailyWage // ignore: cast_nullable_to_non_nullable
              as double,
      joiningDate: null == joiningDate
          ? _self.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyContact: freezed == emergencyContact
          ? _self.emergencyContact
          : emergencyContact // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LabourWorkerModel].
extension LabourWorkerModelPatterns on LabourWorkerModel {
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
    TResult Function(_LabourWorkerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel() when $default != null:
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
    TResult Function(_LabourWorkerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel():
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
    TResult? Function(_LabourWorkerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel() when $default != null:
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
            String fullName,
            String phoneNumber,
            String? address,
            String role,
            double dailyWage,
            String joiningDate,
            String status,
            String? emergencyContact,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.phoneNumber,
            _that.address,
            _that.role,
            _that.dailyWage,
            _that.joiningDate,
            _that.status,
            _that.emergencyContact,
            _that.notes);
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
            String fullName,
            String phoneNumber,
            String? address,
            String role,
            double dailyWage,
            String joiningDate,
            String status,
            String? emergencyContact,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel():
        return $default(
            _that.id,
            _that.fullName,
            _that.phoneNumber,
            _that.address,
            _that.role,
            _that.dailyWage,
            _that.joiningDate,
            _that.status,
            _that.emergencyContact,
            _that.notes);
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
            String fullName,
            String phoneNumber,
            String? address,
            String role,
            double dailyWage,
            String joiningDate,
            String status,
            String? emergencyContact,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorkerModel() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.phoneNumber,
            _that.address,
            _that.role,
            _that.dailyWage,
            _that.joiningDate,
            _that.status,
            _that.emergencyContact,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LabourWorkerModel implements LabourWorkerModel {
  const _LabourWorkerModel(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      this.address,
      required this.role,
      required this.dailyWage,
      required this.joiningDate,
      required this.status,
      this.emergencyContact,
      this.notes});
  factory _LabourWorkerModel.fromJson(Map<String, dynamic> json) =>
      _$LabourWorkerModelFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String? address;
  @override
  final String role;
  @override
  final double dailyWage;
  @override
  final String joiningDate;
  @override
  final String status;
  @override
  final String? emergencyContact;
  @override
  final String? notes;

  /// Create a copy of LabourWorkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabourWorkerModelCopyWith<_LabourWorkerModel> get copyWith =>
      __$LabourWorkerModelCopyWithImpl<_LabourWorkerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LabourWorkerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabourWorkerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dailyWage, dailyWage) ||
                other.dailyWage == dailyWage) &&
            (identical(other.joiningDate, joiningDate) ||
                other.joiningDate == joiningDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emergencyContact, emergencyContact) ||
                other.emergencyContact == emergencyContact) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phoneNumber,
      address, role, dailyWage, joiningDate, status, emergencyContact, notes);

  @override
  String toString() {
    return 'LabourWorkerModel(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, role: $role, dailyWage: $dailyWage, joiningDate: $joiningDate, status: $status, emergencyContact: $emergencyContact, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$LabourWorkerModelCopyWith<$Res>
    implements $LabourWorkerModelCopyWith<$Res> {
  factory _$LabourWorkerModelCopyWith(
          _LabourWorkerModel value, $Res Function(_LabourWorkerModel) _then) =
      __$LabourWorkerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phoneNumber,
      String? address,
      String role,
      double dailyWage,
      String joiningDate,
      String status,
      String? emergencyContact,
      String? notes});
}

/// @nodoc
class __$LabourWorkerModelCopyWithImpl<$Res>
    implements _$LabourWorkerModelCopyWith<$Res> {
  __$LabourWorkerModelCopyWithImpl(this._self, this._then);

  final _LabourWorkerModel _self;
  final $Res Function(_LabourWorkerModel) _then;

  /// Create a copy of LabourWorkerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? role = null,
    Object? dailyWage = null,
    Object? joiningDate = null,
    Object? status = null,
    Object? emergencyContact = freezed,
    Object? notes = freezed,
  }) {
    return _then(_LabourWorkerModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      dailyWage: null == dailyWage
          ? _self.dailyWage
          : dailyWage // ignore: cast_nullable_to_non_nullable
              as double,
      joiningDate: null == joiningDate
          ? _self.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      emergencyContact: freezed == emergencyContact
          ? _self.emergencyContact
          : emergencyContact // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AttendanceModel {
  String get id;
  String get workerId;
  String get date;
  String? get checkIn;
  String? get checkOut;
  double get hoursWorked;
  double get overtimeHours;
  String get leaveStatus;
  String? get remarks;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      _$AttendanceModelCopyWithImpl<AttendanceModel>(
          this as AttendanceModel, _$identity);

  /// Serializes this AttendanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AttendanceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.overtimeHours, overtimeHours) ||
                other.overtimeHours == overtimeHours) &&
            (identical(other.leaveStatus, leaveStatus) ||
                other.leaveStatus == leaveStatus) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, date, checkIn,
      checkOut, hoursWorked, overtimeHours, leaveStatus, remarks);

  @override
  String toString() {
    return 'AttendanceModel(id: $id, workerId: $workerId, date: $date, checkIn: $checkIn, checkOut: $checkOut, hoursWorked: $hoursWorked, overtimeHours: $overtimeHours, leaveStatus: $leaveStatus, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) _then) =
      _$AttendanceModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      String date,
      String? checkIn,
      String? checkOut,
      double hoursWorked,
      double overtimeHours,
      String leaveStatus,
      String? remarks});
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._self, this._then);

  final AttendanceModel _self;
  final $Res Function(AttendanceModel) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? hoursWorked = null,
    Object? overtimeHours = null,
    Object? leaveStatus = null,
    Object? remarks = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursWorked: null == hoursWorked
          ? _self.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _self.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      leaveStatus: null == leaveStatus
          ? _self.leaveStatus
          : leaveStatus // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AttendanceModel].
extension AttendanceModelPatterns on AttendanceModel {
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
    TResult Function(_AttendanceModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel() when $default != null:
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
    TResult Function(_AttendanceModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel():
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
    TResult? Function(_AttendanceModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel() when $default != null:
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
            String workerId,
            String date,
            String? checkIn,
            String? checkOut,
            double hoursWorked,
            double overtimeHours,
            String leaveStatus,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel() when $default != null:
        return $default(
            _that.id,
            _that.workerId,
            _that.date,
            _that.checkIn,
            _that.checkOut,
            _that.hoursWorked,
            _that.overtimeHours,
            _that.leaveStatus,
            _that.remarks);
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
            String workerId,
            String date,
            String? checkIn,
            String? checkOut,
            double hoursWorked,
            double overtimeHours,
            String leaveStatus,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel():
        return $default(
            _that.id,
            _that.workerId,
            _that.date,
            _that.checkIn,
            _that.checkOut,
            _that.hoursWorked,
            _that.overtimeHours,
            _that.leaveStatus,
            _that.remarks);
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
            String workerId,
            String date,
            String? checkIn,
            String? checkOut,
            double hoursWorked,
            double overtimeHours,
            String leaveStatus,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AttendanceModel() when $default != null:
        return $default(
            _that.id,
            _that.workerId,
            _that.date,
            _that.checkIn,
            _that.checkOut,
            _that.hoursWorked,
            _that.overtimeHours,
            _that.leaveStatus,
            _that.remarks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AttendanceModel implements AttendanceModel {
  const _AttendanceModel(
      {required this.id,
      required this.workerId,
      required this.date,
      this.checkIn,
      this.checkOut,
      required this.hoursWorked,
      required this.overtimeHours,
      required this.leaveStatus,
      this.remarks});
  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  @override
  final String id;
  @override
  final String workerId;
  @override
  final String date;
  @override
  final String? checkIn;
  @override
  final String? checkOut;
  @override
  final double hoursWorked;
  @override
  final double overtimeHours;
  @override
  final String leaveStatus;
  @override
  final String? remarks;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttendanceModelCopyWith<_AttendanceModel> get copyWith =>
      __$AttendanceModelCopyWithImpl<_AttendanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AttendanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttendanceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.overtimeHours, overtimeHours) ||
                other.overtimeHours == overtimeHours) &&
            (identical(other.leaveStatus, leaveStatus) ||
                other.leaveStatus == leaveStatus) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, date, checkIn,
      checkOut, hoursWorked, overtimeHours, leaveStatus, remarks);

  @override
  String toString() {
    return 'AttendanceModel(id: $id, workerId: $workerId, date: $date, checkIn: $checkIn, checkOut: $checkOut, hoursWorked: $hoursWorked, overtimeHours: $overtimeHours, leaveStatus: $leaveStatus, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$AttendanceModelCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$AttendanceModelCopyWith(
          _AttendanceModel value, $Res Function(_AttendanceModel) _then) =
      __$AttendanceModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String workerId,
      String date,
      String? checkIn,
      String? checkOut,
      double hoursWorked,
      double overtimeHours,
      String leaveStatus,
      String? remarks});
}

/// @nodoc
class __$AttendanceModelCopyWithImpl<$Res>
    implements _$AttendanceModelCopyWith<$Res> {
  __$AttendanceModelCopyWithImpl(this._self, this._then);

  final _AttendanceModel _self;
  final $Res Function(_AttendanceModel) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? date = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? hoursWorked = null,
    Object? overtimeHours = null,
    Object? leaveStatus = null,
    Object? remarks = freezed,
  }) {
    return _then(_AttendanceModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      hoursWorked: null == hoursWorked
          ? _self.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double,
      overtimeHours: null == overtimeHours
          ? _self.overtimeHours
          : overtimeHours // ignore: cast_nullable_to_non_nullable
              as double,
      leaveStatus: null == leaveStatus
          ? _self.leaveStatus
          : leaveStatus // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$WorkAssignmentModel {
  String get id;
  String get workerId;
  String? get batchId;
  String get task;
  String get startTime;
  String? get endTime;
  double? get durationHours;
  String get status;

  /// Create a copy of WorkAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkAssignmentModelCopyWith<WorkAssignmentModel> get copyWith =>
      _$WorkAssignmentModelCopyWithImpl<WorkAssignmentModel>(
          this as WorkAssignmentModel, _$identity);

  /// Serializes this WorkAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkAssignmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, batchId, task,
      startTime, endTime, durationHours, status);

  @override
  String toString() {
    return 'WorkAssignmentModel(id: $id, workerId: $workerId, batchId: $batchId, task: $task, startTime: $startTime, endTime: $endTime, durationHours: $durationHours, status: $status)';
  }
}

/// @nodoc
abstract mixin class $WorkAssignmentModelCopyWith<$Res> {
  factory $WorkAssignmentModelCopyWith(
          WorkAssignmentModel value, $Res Function(WorkAssignmentModel) _then) =
      _$WorkAssignmentModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      String? batchId,
      String task,
      String startTime,
      String? endTime,
      double? durationHours,
      String status});
}

/// @nodoc
class _$WorkAssignmentModelCopyWithImpl<$Res>
    implements $WorkAssignmentModelCopyWith<$Res> {
  _$WorkAssignmentModelCopyWithImpl(this._self, this._then);

  final WorkAssignmentModel _self;
  final $Res Function(WorkAssignmentModel) _then;

  /// Create a copy of WorkAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? batchId = freezed,
    Object? task = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationHours = freezed,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkAssignmentModel].
extension WorkAssignmentModelPatterns on WorkAssignmentModel {
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
    TResult Function(_WorkAssignmentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel() when $default != null:
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
    TResult Function(_WorkAssignmentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel():
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
    TResult? Function(_WorkAssignmentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel() when $default != null:
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
            String workerId,
            String? batchId,
            String task,
            String startTime,
            String? endTime,
            double? durationHours,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel() when $default != null:
        return $default(_that.id, _that.workerId, _that.batchId, _that.task,
            _that.startTime, _that.endTime, _that.durationHours, _that.status);
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
            String workerId,
            String? batchId,
            String task,
            String startTime,
            String? endTime,
            double? durationHours,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel():
        return $default(_that.id, _that.workerId, _that.batchId, _that.task,
            _that.startTime, _that.endTime, _that.durationHours, _that.status);
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
            String workerId,
            String? batchId,
            String task,
            String startTime,
            String? endTime,
            double? durationHours,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignmentModel() when $default != null:
        return $default(_that.id, _that.workerId, _that.batchId, _that.task,
            _that.startTime, _that.endTime, _that.durationHours, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WorkAssignmentModel implements WorkAssignmentModel {
  const _WorkAssignmentModel(
      {required this.id,
      required this.workerId,
      this.batchId,
      required this.task,
      required this.startTime,
      this.endTime,
      this.durationHours,
      required this.status});
  factory _WorkAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$WorkAssignmentModelFromJson(json);

  @override
  final String id;
  @override
  final String workerId;
  @override
  final String? batchId;
  @override
  final String task;
  @override
  final String startTime;
  @override
  final String? endTime;
  @override
  final double? durationHours;
  @override
  final String status;

  /// Create a copy of WorkAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkAssignmentModelCopyWith<_WorkAssignmentModel> get copyWith =>
      __$WorkAssignmentModelCopyWithImpl<_WorkAssignmentModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkAssignmentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkAssignmentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, batchId, task,
      startTime, endTime, durationHours, status);

  @override
  String toString() {
    return 'WorkAssignmentModel(id: $id, workerId: $workerId, batchId: $batchId, task: $task, startTime: $startTime, endTime: $endTime, durationHours: $durationHours, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$WorkAssignmentModelCopyWith<$Res>
    implements $WorkAssignmentModelCopyWith<$Res> {
  factory _$WorkAssignmentModelCopyWith(_WorkAssignmentModel value,
          $Res Function(_WorkAssignmentModel) _then) =
      __$WorkAssignmentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String workerId,
      String? batchId,
      String task,
      String startTime,
      String? endTime,
      double? durationHours,
      String status});
}

/// @nodoc
class __$WorkAssignmentModelCopyWithImpl<$Res>
    implements _$WorkAssignmentModelCopyWith<$Res> {
  __$WorkAssignmentModelCopyWithImpl(this._self, this._then);

  final _WorkAssignmentModel _self;
  final $Res Function(_WorkAssignmentModel) _then;

  /// Create a copy of WorkAssignmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? batchId = freezed,
    Object? task = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationHours = freezed,
    Object? status = null,
  }) {
    return _then(_WorkAssignmentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String?,
      task: null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WageRecordModel {
  String get id;
  String get workerId;
  double get baseWage;
  double get overtimePay;
  double get bonuses;
  double get deductions;
  double get netPay;
  String get paymentDate;
  String get paymentMethod;
  String? get referenceNotes;

  /// Create a copy of WageRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WageRecordModelCopyWith<WageRecordModel> get copyWith =>
      _$WageRecordModelCopyWithImpl<WageRecordModel>(
          this as WageRecordModel, _$identity);

  /// Serializes this WageRecordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WageRecordModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.baseWage, baseWage) ||
                other.baseWage == baseWage) &&
            (identical(other.overtimePay, overtimePay) ||
                other.overtimePay == overtimePay) &&
            (identical(other.bonuses, bonuses) || other.bonuses == bonuses) &&
            (identical(other.deductions, deductions) ||
                other.deductions == deductions) &&
            (identical(other.netPay, netPay) || other.netPay == netPay) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workerId,
      baseWage,
      overtimePay,
      bonuses,
      deductions,
      netPay,
      paymentDate,
      paymentMethod,
      referenceNotes);

  @override
  String toString() {
    return 'WageRecordModel(id: $id, workerId: $workerId, baseWage: $baseWage, overtimePay: $overtimePay, bonuses: $bonuses, deductions: $deductions, netPay: $netPay, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNotes: $referenceNotes)';
  }
}

/// @nodoc
abstract mixin class $WageRecordModelCopyWith<$Res> {
  factory $WageRecordModelCopyWith(
          WageRecordModel value, $Res Function(WageRecordModel) _then) =
      _$WageRecordModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      double baseWage,
      double overtimePay,
      double bonuses,
      double deductions,
      double netPay,
      String paymentDate,
      String paymentMethod,
      String? referenceNotes});
}

/// @nodoc
class _$WageRecordModelCopyWithImpl<$Res>
    implements $WageRecordModelCopyWith<$Res> {
  _$WageRecordModelCopyWithImpl(this._self, this._then);

  final WageRecordModel _self;
  final $Res Function(WageRecordModel) _then;

  /// Create a copy of WageRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? baseWage = null,
    Object? overtimePay = null,
    Object? bonuses = null,
    Object? deductions = null,
    Object? netPay = null,
    Object? paymentDate = null,
    Object? paymentMethod = null,
    Object? referenceNotes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      baseWage: null == baseWage
          ? _self.baseWage
          : baseWage // ignore: cast_nullable_to_non_nullable
              as double,
      overtimePay: null == overtimePay
          ? _self.overtimePay
          : overtimePay // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _self.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      deductions: null == deductions
          ? _self.deductions
          : deductions // ignore: cast_nullable_to_non_nullable
              as double,
      netPay: null == netPay
          ? _self.netPay
          : netPay // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: freezed == referenceNotes
          ? _self.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WageRecordModel].
extension WageRecordModelPatterns on WageRecordModel {
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
    TResult Function(_WageRecordModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel() when $default != null:
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
    TResult Function(_WageRecordModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel():
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
    TResult? Function(_WageRecordModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel() when $default != null:
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
            String workerId,
            double baseWage,
            double overtimePay,
            double bonuses,
            double deductions,
            double netPay,
            String paymentDate,
            String paymentMethod,
            String? referenceNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel() when $default != null:
        return $default(
            _that.id,
            _that.workerId,
            _that.baseWage,
            _that.overtimePay,
            _that.bonuses,
            _that.deductions,
            _that.netPay,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNotes);
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
            String workerId,
            double baseWage,
            double overtimePay,
            double bonuses,
            double deductions,
            double netPay,
            String paymentDate,
            String paymentMethod,
            String? referenceNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel():
        return $default(
            _that.id,
            _that.workerId,
            _that.baseWage,
            _that.overtimePay,
            _that.bonuses,
            _that.deductions,
            _that.netPay,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNotes);
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
            String workerId,
            double baseWage,
            double overtimePay,
            double bonuses,
            double deductions,
            double netPay,
            String paymentDate,
            String paymentMethod,
            String? referenceNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecordModel() when $default != null:
        return $default(
            _that.id,
            _that.workerId,
            _that.baseWage,
            _that.overtimePay,
            _that.bonuses,
            _that.deductions,
            _that.netPay,
            _that.paymentDate,
            _that.paymentMethod,
            _that.referenceNotes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WageRecordModel implements WageRecordModel {
  const _WageRecordModel(
      {required this.id,
      required this.workerId,
      required this.baseWage,
      required this.overtimePay,
      required this.bonuses,
      required this.deductions,
      required this.netPay,
      required this.paymentDate,
      required this.paymentMethod,
      this.referenceNotes});
  factory _WageRecordModel.fromJson(Map<String, dynamic> json) =>
      _$WageRecordModelFromJson(json);

  @override
  final String id;
  @override
  final String workerId;
  @override
  final double baseWage;
  @override
  final double overtimePay;
  @override
  final double bonuses;
  @override
  final double deductions;
  @override
  final double netPay;
  @override
  final String paymentDate;
  @override
  final String paymentMethod;
  @override
  final String? referenceNotes;

  /// Create a copy of WageRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WageRecordModelCopyWith<_WageRecordModel> get copyWith =>
      __$WageRecordModelCopyWithImpl<_WageRecordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WageRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WageRecordModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workerId, workerId) ||
                other.workerId == workerId) &&
            (identical(other.baseWage, baseWage) ||
                other.baseWage == baseWage) &&
            (identical(other.overtimePay, overtimePay) ||
                other.overtimePay == overtimePay) &&
            (identical(other.bonuses, bonuses) || other.bonuses == bonuses) &&
            (identical(other.deductions, deductions) ||
                other.deductions == deductions) &&
            (identical(other.netPay, netPay) || other.netPay == netPay) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workerId,
      baseWage,
      overtimePay,
      bonuses,
      deductions,
      netPay,
      paymentDate,
      paymentMethod,
      referenceNotes);

  @override
  String toString() {
    return 'WageRecordModel(id: $id, workerId: $workerId, baseWage: $baseWage, overtimePay: $overtimePay, bonuses: $bonuses, deductions: $deductions, netPay: $netPay, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNotes: $referenceNotes)';
  }
}

/// @nodoc
abstract mixin class _$WageRecordModelCopyWith<$Res>
    implements $WageRecordModelCopyWith<$Res> {
  factory _$WageRecordModelCopyWith(
          _WageRecordModel value, $Res Function(_WageRecordModel) _then) =
      __$WageRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String workerId,
      double baseWage,
      double overtimePay,
      double bonuses,
      double deductions,
      double netPay,
      String paymentDate,
      String paymentMethod,
      String? referenceNotes});
}

/// @nodoc
class __$WageRecordModelCopyWithImpl<$Res>
    implements _$WageRecordModelCopyWith<$Res> {
  __$WageRecordModelCopyWithImpl(this._self, this._then);

  final _WageRecordModel _self;
  final $Res Function(_WageRecordModel) _then;

  /// Create a copy of WageRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? workerId = null,
    Object? baseWage = null,
    Object? overtimePay = null,
    Object? bonuses = null,
    Object? deductions = null,
    Object? netPay = null,
    Object? paymentDate = null,
    Object? paymentMethod = null,
    Object? referenceNotes = freezed,
  }) {
    return _then(_WageRecordModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workerId: null == workerId
          ? _self.workerId
          : workerId // ignore: cast_nullable_to_non_nullable
              as String,
      baseWage: null == baseWage
          ? _self.baseWage
          : baseWage // ignore: cast_nullable_to_non_nullable
              as double,
      overtimePay: null == overtimePay
          ? _self.overtimePay
          : overtimePay // ignore: cast_nullable_to_non_nullable
              as double,
      bonuses: null == bonuses
          ? _self.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as double,
      deductions: null == deductions
          ? _self.deductions
          : deductions // ignore: cast_nullable_to_non_nullable
              as double,
      netPay: null == netPay
          ? _self.netPay
          : netPay // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: null == paymentDate
          ? _self.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: freezed == referenceNotes
          ? _self.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
