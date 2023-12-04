import 'package:flutter/material.dart';
import 'package:unwind_app/src/settings/settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> initSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? themeMode) async {
    if (themeMode == null) return;

    if (themeMode == _themeMode) return;

    _themeMode = themeMode;
    notifyListeners();

    await _settingsService.updateThemeMode(themeMode);
  }
}
