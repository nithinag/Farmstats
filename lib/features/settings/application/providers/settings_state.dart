import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/settings_entities.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsStateInitial;
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.data({
    required FarmProfile profile,
    required AppPreferences preferences,
  }) = SettingsStateData;
  const factory SettingsState.error(String message) = SettingsStateError;
}
