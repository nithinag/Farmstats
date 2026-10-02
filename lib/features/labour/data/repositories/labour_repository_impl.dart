import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/labour_entities.dart';
import '../../domain/repositories/i_labour_repository.dart';
import '../datasources/i_labour_datasource.dart';
import '../mappers/labour_mapper.dart';

class LabourRepositoryImpl implements ILabourRepository {
  final ILabourDataSource _dataSource;

  LabourRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<LabourWorker>>> getWorkers() async {
    try {
      final models = await _dataSource.getWorkers();
      return Right(models.map(LabourMapper.fromWorkerModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load workers: $e'));
    }
  }

  @override
  Future<Either<Failure, LabourWorker>> getWorkerById(String id) async {
    try {
      final model = await _dataSource.getWorkerById(id);
      if (model != null) {
        return Right(LabourMapper.fromWorkerModel(model));
      }
      return const Left(Failure('Worker not found'));
    } catch (e) {
      return Left(Failure('Failed to get worker: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addWorker(LabourWorker worker) async {
    try {
      await _dataSource.addWorker(LabourMapper.toWorkerModel(worker));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to add worker: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateWorker(LabourWorker worker) async {
    try {
      await _dataSource.updateWorker(LabourMapper.toWorkerModel(worker));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to update worker: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Attendance>>> getAttendance(String workerId) async {
    try {
      final models = await _dataSource.getAttendance(workerId);
      return Right(models.map(LabourMapper.fromAttendanceModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load attendance: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logAttendance(Attendance attendance) async {
    try {
      await _dataSource.logAttendance(LabourMapper.toAttendanceModel(attendance));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to log attendance: $e'));
    }
  }

  @override
  Future<Either<Failure, List<WorkAssignment>>> getAssignments(String workerId) async {
    try {
      final models = await _dataSource.getAssignments(workerId);
      return Right(models.map(LabourMapper.fromAssignmentModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load assignments: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> assignTask(WorkAssignment assignment) async {
    try {
      await _dataSource.assignTask(LabourMapper.toAssignmentModel(assignment));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to assign task: $e'));
    }
  }

  @override
  Future<Either<Failure, List<WageRecord>>> getWages(String workerId) async {
    try {
      final models = await _dataSource.getWages(workerId);
      return Right(models.map(LabourMapper.fromWageModel).toList());
    } catch (e) {
      return Left(Failure('Failed to load wages: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> payWage(WageRecord wage) async {
    try {
      await _dataSource.payWage(LabourMapper.toWageModel(wage));
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to pay wage: $e'));
    }
  }
}
