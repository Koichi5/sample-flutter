// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sample_flutter/shared_preferences/provider/shared_preferences_provider.dart';

// part 'theme_mode_provider.g.dart';

// @Riverpod(keepAlive: true, dependencies: [SharedPreferencesController])
// class ThemeModeController extends _$ThemeModeController {
//   static const String themeModeKey = 'theme_mode';

//   @override
//   ThemeMode build() {
//     return state = _loadThemeMode() ?? ThemeMode.system;
//   }

//   Future<void> toggle() async {
//     ThemeMode themeMode;
//     switch (state) {
//       case ThemeMode.light:
//         themeMode = ThemeMode.dark;
//         break;
//       case ThemeMode.dark:
//         themeMode = ThemeMode.light;
//         break;
//       case ThemeMode.system:
//         themeMode = ThemeMode.light;
//         break;
//     }
//     await _saveThemeMode(themeMode).then(
//       (value) {
//         print('themeMode: $themeMode');
//         state = themeMode;
//       },
//     );
//   }

//   ThemeMode? _loadThemeMode() {
//     final loadedMode = ref
//         .read(sharedPreferencesControllerProvider.notifier)
//         .getValue(key: themeModeKey);
//     print('_loadThemeMode: $loadedMode');
//     if (loadedMode == null) {
//       return null;
//     }
//     return ThemeMode.values.byName(loadedMode);
//   }

//   Future<void> _saveThemeMode(ThemeMode themeMode) async {
//     await ref
//         .read(sharedPreferencesControllerProvider.notifier)
//         .setValue(key: themeModeKey, value: themeMode.name);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  return ThemeModeController();
});

class ThemeModeController extends StateNotifier<ThemeMode> {
  static const String themeModeKey = 'theme_mode';

  ThemeModeController() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedMode = prefs.getString(themeModeKey);
    print('loaded mode : $loadedMode');
    if (loadedMode != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.toString().split('.').last == loadedMode,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> toggle() async {
    final prefs = await SharedPreferences.getInstance();
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await prefs.setString(themeModeKey, newMode.toString().split('.').last);
    print('new mode : $newMode');
    state = newMode;
  }
}
