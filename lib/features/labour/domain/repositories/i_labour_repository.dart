import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failure.dart';
import '../entities/labour_entities.dart';

abstract class ILabourRepository {
  Future<Either<Failure, List<LabourWorker>>> getWorkers();
  Future<Either<Failure, LabourWorker>> getWorkerById(String id);
  Future<Either<Failure, Unit>> addWorker(LabourWorker worker);
  Future<Either<Failure, Unit>> updateWorker(LabourWorker worker);
  
  Future<Either<Failure, List<Attendance>>> getAttendance(String workerId);
  Future<Either<Failure, Unit>> logAttendance(Attendance attendance);
  
  Future<Either<Failure, List<WorkAssignment>>> getAssignments(String workerId);
  Future<Either<Failure, Unit>> assignTask(WorkAssignment assignment);
  
  Future<Either<Failure, List<WageRecord>>> getWages(String workerId);
  Future<Either<Failure, Unit>> payWage(WageRecord wage);
}
