import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/batch_entities.dart';

part 'batch_state.freezed.dart';

@freezed
abstract class BatchState with _$BatchState {
  const factory BatchState.initial() = BatchStateInitial;
  const factory BatchState.loading() = BatchStateLoading;
  const factory BatchState.data(List<Batch> batches) = BatchStateData;
  const factory BatchState.error(String message) = BatchStateError;
}
