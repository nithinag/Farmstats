// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labour_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabourWorker {
  String get id;
  String get fullName;
  String get phoneNumber;
  String? get address;
  WorkerRole get role;
  double get dailyWage;
  DateTime get joiningDate;
  WorkerStatus get status;
  String? get emergencyContact;
  String? get notes;

  /// Create a copy of LabourWorker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabourWorkerCopyWith<LabourWorker> get copyWith =>
      _$LabourWorkerCopyWithImpl<LabourWorker>(
          this as LabourWorker, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabourWorker &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phoneNumber,
      address, role, dailyWage, joiningDate, status, emergencyContact, notes);

  @override
  String toString() {
    return 'LabourWorker(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, role: $role, dailyWage: $dailyWage, joiningDate: $joiningDate, status: $status, emergencyContact: $emergencyContact, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $LabourWorkerCopyWith<$Res> {
  factory $LabourWorkerCopyWith(
          LabourWorker value, $Res Function(LabourWorker) _then) =
      _$LabourWorkerCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phoneNumber,
      String? address,
      WorkerRole role,
      double dailyWage,
      DateTime joiningDate,
      WorkerStatus status,
      String? emergencyContact,
      String? notes});
}

/// @nodoc
class _$LabourWorkerCopyWithImpl<$Res> implements $LabourWorkerCopyWith<$Res> {
  _$LabourWorkerCopyWithImpl(this._self, this._then);

  final LabourWorker _self;
  final $Res Function(LabourWorker) _then;

  /// Create a copy of LabourWorker
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
              as WorkerRole,
      dailyWage: null == dailyWage
          ? _self.dailyWage
          : dailyWage // ignore: cast_nullable_to_non_nullable
              as double,
      joiningDate: null == joiningDate
          ? _self.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkerStatus,
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

/// Adds pattern-matching-related methods to [LabourWorker].
extension LabourWorkerPatterns on LabourWorker {
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
    TResult Function(_LabourWorker value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabourWorker() when $default != null:
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
    TResult Function(_LabourWorker value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorker():
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
    TResult? Function(_LabourWorker value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorker() when $default != null:
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
            WorkerRole role,
            double dailyWage,
            DateTime joiningDate,
            WorkerStatus status,
            String? emergencyContact,
            String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LabourWorker() when $default != null:
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
            WorkerRole role,
            double dailyWage,
            DateTime joiningDate,
            WorkerStatus status,
            String? emergencyContact,
            String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorker():
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
            WorkerRole role,
            double dailyWage,
            DateTime joiningDate,
            WorkerStatus status,
            String? emergencyContact,
            String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LabourWorker() when $default != null:
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

class _LabourWorker implements LabourWorker {
  const _LabourWorker(
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

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String? address;
  @override
  final WorkerRole role;
  @override
  final double dailyWage;
  @override
  final DateTime joiningDate;
  @override
  final WorkerStatus status;
  @override
  final String? emergencyContact;
  @override
  final String? notes;

  /// Create a copy of LabourWorker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabourWorkerCopyWith<_LabourWorker> get copyWith =>
      __$LabourWorkerCopyWithImpl<_LabourWorker>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabourWorker &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, phoneNumber,
      address, role, dailyWage, joiningDate, status, emergencyContact, notes);

  @override
  String toString() {
    return 'LabourWorker(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, role: $role, dailyWage: $dailyWage, joiningDate: $joiningDate, status: $status, emergencyContact: $emergencyContact, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$LabourWorkerCopyWith<$Res>
    implements $LabourWorkerCopyWith<$Res> {
  factory _$LabourWorkerCopyWith(
          _LabourWorker value, $Res Function(_LabourWorker) _then) =
      __$LabourWorkerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String phoneNumber,
      String? address,
      WorkerRole role,
      double dailyWage,
      DateTime joiningDate,
      WorkerStatus status,
      String? emergencyContact,
      String? notes});
}

/// @nodoc
class __$LabourWorkerCopyWithImpl<$Res>
    implements _$LabourWorkerCopyWith<$Res> {
  __$LabourWorkerCopyWithImpl(this._self, this._then);

  final _LabourWorker _self;
  final $Res Function(_LabourWorker) _then;

  /// Create a copy of LabourWorker
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
    return _then(_LabourWorker(
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
              as WorkerRole,
      dailyWage: null == dailyWage
          ? _self.dailyWage
          : dailyWage // ignore: cast_nullable_to_non_nullable
              as double,
      joiningDate: null == joiningDate
          ? _self.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkerStatus,
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
mixin _$Attendance {
  String get id;
  String get workerId;
  DateTime get date;
  DateTime? get checkIn;
  DateTime? get checkOut;
  double get hoursWorked;
  double get overtimeHours;
  LeaveStatus get leaveStatus;
  String? get remarks;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttendanceCopyWith<Attendance> get copyWith =>
      _$AttendanceCopyWithImpl<Attendance>(this as Attendance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Attendance &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, date, checkIn,
      checkOut, hoursWorked, overtimeHours, leaveStatus, remarks);

  @override
  String toString() {
    return 'Attendance(id: $id, workerId: $workerId, date: $date, checkIn: $checkIn, checkOut: $checkOut, hoursWorked: $hoursWorked, overtimeHours: $overtimeHours, leaveStatus: $leaveStatus, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) _then) =
      _$AttendanceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      DateTime date,
      DateTime? checkIn,
      DateTime? checkOut,
      double hoursWorked,
      double overtimeHours,
      LeaveStatus leaveStatus,
      String? remarks});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res> implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._self, this._then);

  final Attendance _self;
  final $Res Function(Attendance) _then;

  /// Create a copy of Attendance
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
              as DateTime,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as LeaveStatus,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Attendance].
extension AttendancePatterns on Attendance {
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
    TResult Function(_Attendance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Attendance() when $default != null:
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
    TResult Function(_Attendance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Attendance():
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
    TResult? Function(_Attendance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Attendance() when $default != null:
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
            DateTime date,
            DateTime? checkIn,
            DateTime? checkOut,
            double hoursWorked,
            double overtimeHours,
            LeaveStatus leaveStatus,
            String? remarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Attendance() when $default != null:
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
            DateTime date,
            DateTime? checkIn,
            DateTime? checkOut,
            double hoursWorked,
            double overtimeHours,
            LeaveStatus leaveStatus,
            String? remarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Attendance():
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
            DateTime date,
            DateTime? checkIn,
            DateTime? checkOut,
            double hoursWorked,
            double overtimeHours,
            LeaveStatus leaveStatus,
            String? remarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Attendance() when $default != null:
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

class _Attendance implements Attendance {
  const _Attendance(
      {required this.id,
      required this.workerId,
      required this.date,
      this.checkIn,
      this.checkOut,
      this.hoursWorked = 0.0,
      this.overtimeHours = 0.0,
      required this.leaveStatus,
      this.remarks});

  @override
  final String id;
  @override
  final String workerId;
  @override
  final DateTime date;
  @override
  final DateTime? checkIn;
  @override
  final DateTime? checkOut;
  @override
  @JsonKey()
  final double hoursWorked;
  @override
  @JsonKey()
  final double overtimeHours;
  @override
  final LeaveStatus leaveStatus;
  @override
  final String? remarks;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttendanceCopyWith<_Attendance> get copyWith =>
      __$AttendanceCopyWithImpl<_Attendance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Attendance &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, date, checkIn,
      checkOut, hoursWorked, overtimeHours, leaveStatus, remarks);

  @override
  String toString() {
    return 'Attendance(id: $id, workerId: $workerId, date: $date, checkIn: $checkIn, checkOut: $checkOut, hoursWorked: $hoursWorked, overtimeHours: $overtimeHours, leaveStatus: $leaveStatus, remarks: $remarks)';
  }
}

/// @nodoc
abstract mixin class _$AttendanceCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$AttendanceCopyWith(
          _Attendance value, $Res Function(_Attendance) _then) =
      __$AttendanceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String workerId,
      DateTime date,
      DateTime? checkIn,
      DateTime? checkOut,
      double hoursWorked,
      double overtimeHours,
      LeaveStatus leaveStatus,
      String? remarks});
}

/// @nodoc
class __$AttendanceCopyWithImpl<$Res> implements _$AttendanceCopyWith<$Res> {
  __$AttendanceCopyWithImpl(this._self, this._then);

  final _Attendance _self;
  final $Res Function(_Attendance) _then;

  /// Create a copy of Attendance
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
    return _then(_Attendance(
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
              as DateTime,
      checkIn: freezed == checkIn
          ? _self.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOut: freezed == checkOut
          ? _self.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as LeaveStatus,
      remarks: freezed == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$WorkAssignment {
  String get id;
  String get workerId;
  String? get batchId;
  TaskType get task;
  DateTime get startTime;
  DateTime? get endTime;
  double? get durationHours;
  AssignmentStatus get status;

  /// Create a copy of WorkAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkAssignmentCopyWith<WorkAssignment> get copyWith =>
      _$WorkAssignmentCopyWithImpl<WorkAssignment>(
          this as WorkAssignment, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkAssignment &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, batchId, task,
      startTime, endTime, durationHours, status);

  @override
  String toString() {
    return 'WorkAssignment(id: $id, workerId: $workerId, batchId: $batchId, task: $task, startTime: $startTime, endTime: $endTime, durationHours: $durationHours, status: $status)';
  }
}

/// @nodoc
abstract mixin class $WorkAssignmentCopyWith<$Res> {
  factory $WorkAssignmentCopyWith(
          WorkAssignment value, $Res Function(WorkAssignment) _then) =
      _$WorkAssignmentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      String? batchId,
      TaskType task,
      DateTime startTime,
      DateTime? endTime,
      double? durationHours,
      AssignmentStatus status});
}

/// @nodoc
class _$WorkAssignmentCopyWithImpl<$Res>
    implements $WorkAssignmentCopyWith<$Res> {
  _$WorkAssignmentCopyWithImpl(this._self, this._then);

  final WorkAssignment _self;
  final $Res Function(WorkAssignment) _then;

  /// Create a copy of WorkAssignment
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
              as TaskType,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssignmentStatus,
    ));
  }
}

/// Adds pattern-matching-related methods to [WorkAssignment].
extension WorkAssignmentPatterns on WorkAssignment {
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
    TResult Function(_WorkAssignment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment() when $default != null:
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
    TResult Function(_WorkAssignment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment():
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
    TResult? Function(_WorkAssignment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment() when $default != null:
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
            TaskType task,
            DateTime startTime,
            DateTime? endTime,
            double? durationHours,
            AssignmentStatus status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment() when $default != null:
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
            TaskType task,
            DateTime startTime,
            DateTime? endTime,
            double? durationHours,
            AssignmentStatus status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment():
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
            TaskType task,
            DateTime startTime,
            DateTime? endTime,
            double? durationHours,
            AssignmentStatus status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorkAssignment() when $default != null:
        return $default(_that.id, _that.workerId, _that.batchId, _that.task,
            _that.startTime, _that.endTime, _that.durationHours, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WorkAssignment implements WorkAssignment {
  const _WorkAssignment(
      {required this.id,
      required this.workerId,
      this.batchId,
      required this.task,
      required this.startTime,
      this.endTime,
      this.durationHours,
      required this.status});

  @override
  final String id;
  @override
  final String workerId;
  @override
  final String? batchId;
  @override
  final TaskType task;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final double? durationHours;
  @override
  final AssignmentStatus status;

  /// Create a copy of WorkAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkAssignmentCopyWith<_WorkAssignment> get copyWith =>
      __$WorkAssignmentCopyWithImpl<_WorkAssignment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkAssignment &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, workerId, batchId, task,
      startTime, endTime, durationHours, status);

  @override
  String toString() {
    return 'WorkAssignment(id: $id, workerId: $workerId, batchId: $batchId, task: $task, startTime: $startTime, endTime: $endTime, durationHours: $durationHours, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$WorkAssignmentCopyWith<$Res>
    implements $WorkAssignmentCopyWith<$Res> {
  factory _$WorkAssignmentCopyWith(
          _WorkAssignment value, $Res Function(_WorkAssignment) _then) =
      __$WorkAssignmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String workerId,
      String? batchId,
      TaskType task,
      DateTime startTime,
      DateTime? endTime,
      double? durationHours,
      AssignmentStatus status});
}

/// @nodoc
class __$WorkAssignmentCopyWithImpl<$Res>
    implements _$WorkAssignmentCopyWith<$Res> {
  __$WorkAssignmentCopyWithImpl(this._self, this._then);

  final _WorkAssignment _self;
  final $Res Function(_WorkAssignment) _then;

  /// Create a copy of WorkAssignment
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
    return _then(_WorkAssignment(
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
              as TaskType,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationHours: freezed == durationHours
          ? _self.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssignmentStatus,
    ));
  }
}

/// @nodoc
mixin _$WageRecord {
  String get id;
  String get workerId;
  double get baseWage;
  double get overtimePay;
  double get bonuses;
  double get deductions;
  double get netPay;
  DateTime get paymentDate;
  PaymentMethod get paymentMethod;
  String? get referenceNotes;

  /// Create a copy of WageRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WageRecordCopyWith<WageRecord> get copyWith =>
      _$WageRecordCopyWithImpl<WageRecord>(this as WageRecord, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WageRecord &&
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
    return 'WageRecord(id: $id, workerId: $workerId, baseWage: $baseWage, overtimePay: $overtimePay, bonuses: $bonuses, deductions: $deductions, netPay: $netPay, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNotes: $referenceNotes)';
  }
}

/// @nodoc
abstract mixin class $WageRecordCopyWith<$Res> {
  factory $WageRecordCopyWith(
          WageRecord value, $Res Function(WageRecord) _then) =
      _$WageRecordCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String workerId,
      double baseWage,
      double overtimePay,
      double bonuses,
      double deductions,
      double netPay,
      DateTime paymentDate,
      PaymentMethod paymentMethod,
      String? referenceNotes});
}

/// @nodoc
class _$WageRecordCopyWithImpl<$Res> implements $WageRecordCopyWith<$Res> {
  _$WageRecordCopyWithImpl(this._self, this._then);

  final WageRecord _self;
  final $Res Function(WageRecord) _then;

  /// Create a copy of WageRecord
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
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      referenceNotes: freezed == referenceNotes
          ? _self.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [WageRecord].
extension WageRecordPatterns on WageRecord {
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
    TResult Function(_WageRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WageRecord() when $default != null:
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
    TResult Function(_WageRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecord():
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
    TResult? Function(_WageRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecord() when $default != null:
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
            DateTime paymentDate,
            PaymentMethod paymentMethod,
            String? referenceNotes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WageRecord() when $default != null:
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
            DateTime paymentDate,
            PaymentMethod paymentMethod,
            String? referenceNotes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecord():
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
            DateTime paymentDate,
            PaymentMethod paymentMethod,
            String? referenceNotes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WageRecord() when $default != null:
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

class _WageRecord implements WageRecord {
  const _WageRecord(
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
  final DateTime paymentDate;
  @override
  final PaymentMethod paymentMethod;
  @override
  final String? referenceNotes;

  /// Create a copy of WageRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WageRecordCopyWith<_WageRecord> get copyWith =>
      __$WageRecordCopyWithImpl<_WageRecord>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WageRecord &&
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
    return 'WageRecord(id: $id, workerId: $workerId, baseWage: $baseWage, overtimePay: $overtimePay, bonuses: $bonuses, deductions: $deductions, netPay: $netPay, paymentDate: $paymentDate, paymentMethod: $paymentMethod, referenceNotes: $referenceNotes)';
  }
}

/// @nodoc
abstract mixin class _$WageRecordCopyWith<$Res>
    implements $WageRecordCopyWith<$Res> {
  factory _$WageRecordCopyWith(
          _WageRecord value, $Res Function(_WageRecord) _then) =
      __$WageRecordCopyWithImpl;
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
      DateTime paymentDate,
      PaymentMethod paymentMethod,
      String? referenceNotes});
}

/// @nodoc
class __$WageRecordCopyWithImpl<$Res> implements _$WageRecordCopyWith<$Res> {
  __$WageRecordCopyWithImpl(this._self, this._then);

  final _WageRecord _self;
  final $Res Function(_WageRecord) _then;

  /// Create a copy of WageRecord
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
    return _then(_WageRecord(
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
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      referenceNotes: freezed == referenceNotes
          ? _self.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
