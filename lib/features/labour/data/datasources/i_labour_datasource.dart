import '../models/labour_models.dart';

abstract class ILabourDataSource {
  Future<List<LabourWorkerModel>> getWorkers();
  Future<LabourWorkerModel?> getWorkerById(String id);
  Future<void> addWorker(LabourWorkerModel worker);
  Future<void> updateWorker(LabourWorkerModel worker);
  
  Future<List<AttendanceModel>> getAttendance(String workerId);
  Future<void> logAttendance(AttendanceModel attendance);
  
  Future<List<WorkAssignmentModel>> getAssignments(String workerId);
  Future<void> assignTask(WorkAssignmentModel assignment);
  
  Future<List<WageRecordModel>> getWages(String workerId);
  Future<void> payWage(WageRecordModel wage);
}
