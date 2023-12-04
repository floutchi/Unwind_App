import 'package:flutter/material.dart';
import 'package:unwind_app/src/app.dart';
import 'package:unwind_app/src/auth/auth_controller.dart';
import 'package:unwind_app/src/auth/auth_service.dart';
import 'package:unwind_app/src/settings/settings_controller.dart';
import 'package:unwind_app/src/settings/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsController = SettingsController(SettingsService());
  await settingsController.initSettings();

  final authController = AuthController(AuthService());
  await authController.initAuth();

  runApp(
    UnwindApp(
      settingsController: settingsController,
      authController: authController,
    ),
  );
}
