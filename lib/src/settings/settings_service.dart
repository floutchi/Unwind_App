import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension on ThemeMode {
  int get id => switch (this) {
        ThemeMode.system => 0,
        ThemeMode.light => 1,
        ThemeMode.dark => 2,
      };
}

ThemeMode _getThemeModeFromId(int id) => switch (id) {
      0 => ThemeMode.system,
      1 => ThemeMode.light,
      2 => ThemeMode.dark,
      _ => ThemeMode.system,
    };

class SettingsService {
  static const _key = "themeMode";

  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt(_key) ?? 0;
    return _getThemeModeFromId(id);
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, themeMode.id);
  }
}
