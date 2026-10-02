import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/inventory_entities.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = InventoryStateInitial;
  const factory InventoryState.loading() = InventoryStateLoading;
  const factory InventoryState.data(List<InventoryItem> items) = InventoryStateData;
  const factory InventoryState.error(String message) = InventoryStateError;
}
