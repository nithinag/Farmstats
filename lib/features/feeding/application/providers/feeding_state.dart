import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/feeding_entities.dart';

part 'feeding_state.freezed.dart';

@freezed
abstract class FeedingState with _$FeedingState {
  const factory FeedingState.initial() = FeedingStateInitial;
  const factory FeedingState.loading() = FeedingStateLoading;
  const factory FeedingState.data({
    required List<FeedingLog> feedings,
    required List<MortalityRecord> mortality,
    required List<EnvironmentalReading> environments,
  }) = FeedingStateData;
  const factory FeedingState.error(String message) = FeedingStateError;
}
