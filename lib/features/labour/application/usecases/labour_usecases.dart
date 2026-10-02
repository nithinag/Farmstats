import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/labour_entities.dart';
import '../../domain/repositories/i_labour_repository.dart';
import '../services/labour_validation_service.dart';

class GetWorkersUseCase {
  final ILabourRepository _repository;
  GetWorkersUseCase(this._repository);

  Future<Either<Failure, List<LabourWorker>>> execute() {
    return _repository.getWorkers();
  }
}

class AddWorkerUseCase {
  final ILabourRepository _repository;
  AddWorkerUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(LabourWorker worker) async {
    final errors = LabourValidationService.validateWorker(
      fullName: worker.fullName,
      phoneNumber: worker.phoneNumber,
      dailyWage: worker.dailyWage,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.addWorker(worker);
  }
}

class UpdateWorkerUseCase {
  final ILabourRepository _repository;
  UpdateWorkerUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(LabourWorker worker) async {
    final errors = LabourValidationService.validateWorker(
      fullName: worker.fullName,
      phoneNumber: worker.phoneNumber,
      dailyWage: worker.dailyWage,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.updateWorker(worker);
  }
}

class LogAttendanceUseCase {
  final ILabourRepository _repository;
  LogAttendanceUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(Attendance attendance) async {
    final errors = LabourValidationService.validateAttendance(
      checkIn: attendance.checkIn,
      checkOut: attendance.checkOut,
      hoursWorked: attendance.hoursWorked,
      overtimeHours: attendance.overtimeHours,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.logAttendance(attendance);
  }
}

class PayWageUseCase {
  final ILabourRepository _repository;
  PayWageUseCase(this._repository);

  Future<Either<Failure, Unit>> execute(WageRecord wage) async {
    final errors = LabourValidationService.validateWageRecord(
      baseWage: wage.baseWage,
      overtimePay: wage.overtimePay,
      bonuses: wage.bonuses,
      deductions: wage.deductions,
      netPay: wage.netPay,
    );

    if (errors.isNotEmpty) {
      return Left(Failure(errors.join(', ')));
    }

    return _repository.payWage(wage);
  }
}
