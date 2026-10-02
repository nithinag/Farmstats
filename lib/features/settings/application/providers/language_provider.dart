import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_notifier.dart';

class AppLanguage {
  final String code;
  final String englishName;
  final String nativeName;

  const AppLanguage({
    required this.code,
    required this.englishName,
    required this.nativeName,
  });
}

const List<AppLanguage> kSupportedLanguages = [
  AppLanguage(code: 'system', englishName: 'System Default', nativeName: 'Auto'),
  AppLanguage(code: 'en', englishName: 'English', nativeName: 'English'),
  AppLanguage(code: 'te', englishName: 'Telugu', nativeName: 'తెలుగు'),
  AppLanguage(code: 'kn', englishName: 'Kannada', nativeName: 'ಕನ್ನಡ'),
  AppLanguage(code: 'ta', englishName: 'Tamil', nativeName: 'தமிழ்'),
  AppLanguage(code: 'hi', englishName: 'Hindi', nativeName: 'हिन्दी'),
  AppLanguage(code: 'mr', englishName: 'Marathi', nativeName: 'मराठी'),
  AppLanguage(code: 'ml', englishName: 'Malayalam', nativeName: 'മലയാളം'),
  AppLanguage(code: 'bn', englishName: 'Bengali', nativeName: 'বাংলা'),
  AppLanguage(code: 'gu', englishName: 'Gujarati', nativeName: 'ગુજરાતી'),
  AppLanguage(code: 'pa', englishName: 'Punjabi', nativeName: 'ਪੰਜਾਬੀ'),
  AppLanguage(code: 'or', englishName: 'Odia', nativeName: 'ଓଡ଼ିଆ'),
  AppLanguage(code: 'ur', englishName: 'Urdu', nativeName: 'اردو'),
];

class LanguageNotifier extends Notifier<String> {
  static const String _key = 'APP_LANGUAGE_CODE';

  @override
  String build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key) ?? 'en';
  }

  Future<void> setLanguage(String code) async {
    state = code;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_key, code);
  }

  AppLanguage get currentLanguage {
    return kSupportedLanguages.firstWhere(
      (l) => l.code == state,
      orElse: () => kSupportedLanguages[1],
    );
  }
}

final languageProvider = NotifierProvider<LanguageNotifier, String>(() {
  return LanguageNotifier();
});
