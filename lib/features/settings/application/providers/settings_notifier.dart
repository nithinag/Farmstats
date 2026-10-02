
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/settings_entities.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../data/datasources/i_settings_datasource.dart';
import '../../data/datasources/settings_local_datasource.dart';
import '../usecases/settings_usecases.dart';
import 'settings_state.dart';

// Need to override this in ProviderScope during app initialization
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

final settingsDataSourceProvider = Provider<ISettingsDataSource>((ref) {
  return SettingsLocalDataSourceImpl(ref.watch(sharedPreferencesProvider));
});

final settingsRepositoryProvider = Provider<ISettingsRepository>((ref) {
  return SettingsRepositoryImpl(ref.watch(settingsDataSourceProvider));
});

final getFarmProfileUseCaseProvider = Provider((ref) => GetFarmProfileUseCase(ref.watch(settingsRepositoryProvider)));
final saveFarmProfileUseCaseProvider = Provider((ref) => SaveFarmProfileUseCase(ref.watch(settingsRepositoryProvider)));
final getAppPreferencesUseCaseProvider = Provider((ref) => GetAppPreferencesUseCase(ref.watch(settingsRepositoryProvider)));
final saveAppPreferencesUseCaseProvider = Provider((ref) => SaveAppPreferencesUseCase(ref.watch(settingsRepositoryProvider)));

final settingsNotifierProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});

class SettingsNotifier extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    loadSettings();
    return const SettingsState.initial();
  }

  Future<void> loadSettings() async {
    state = const SettingsState.loading();
    
    final profileResult = await ref.read(getFarmProfileUseCaseProvider).execute();
    final prefsResult = await ref.read(getAppPreferencesUseCaseProvider).execute();

    profileResult.fold(
      (failure) => state = SettingsState.error(failure.message),
      (profile) {
        prefsResult.fold(
          (failure) => state = SettingsState.error(failure.message),
          (prefs) => state = SettingsState.data(profile: profile, preferences: prefs),
        );
      },
    );
  }

  Future<void> saveProfile(FarmProfile profile) async {
    final result = await ref.read(saveFarmProfileUseCaseProvider).execute(profile);
    result.fold(
      (failure) => state = SettingsState.error(failure.message),
      (_) => loadSettings(),
    );
  }

  Future<void> savePreferences(AppPreferences preferences) async {
    final result = await ref.read(saveAppPreferencesUseCaseProvider).execute(preferences);
    result.fold(
      (failure) => state = SettingsState.error(failure.message),
      (_) => loadSettings(),
    );
  }
}
