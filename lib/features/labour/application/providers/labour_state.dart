import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/labour_entities.dart';

part 'labour_state.freezed.dart';

@freezed
abstract class LabourState with _$LabourState {
  const factory LabourState.initial() = LabourStateInitial;
  const factory LabourState.loading() = LabourStateLoading;
  const factory LabourState.data(List<LabourWorker> workers) = LabourStateData;
  const factory LabourState.error(String message) = LabourStateError;
}
