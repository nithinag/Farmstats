import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/harvest_entities.dart';

part 'harvest_state.freezed.dart';

@freezed
abstract class HarvestState with _$HarvestState {
  const factory HarvestState.initial() = HarvestStateInitial;
  const factory HarvestState.loading() = HarvestStateLoading;
  const factory HarvestState.data(List<HarvestRecord> harvests) = HarvestStateData;
  const factory HarvestState.error(String message) = HarvestStateError;
}
