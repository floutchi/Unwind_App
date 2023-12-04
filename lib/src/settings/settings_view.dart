import 'package:flutter/material.dart';
import 'package:unwind_app/src/auth/auth_controller.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/settings/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.settingsController,
    required this.authController,
  });

  final SettingsController settingsController;
  final AuthController authController;

  static const route = "/settings";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: BodyWrapper(
        child: Center(
          child: Column(
            children: [
              DropdownButton<ThemeMode>(
                onChanged: settingsController.updateThemeMode,
                value: settingsController.themeMode,
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('Thème système'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Thème clair'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Thème sombre'),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: const Text('Se déconnecter'),
                onTap: () async => await authController.signOut(),
              ),
              AboutListTile(
                icon: Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                ),
                applicationIcon: Icon(
                  Icons.beach_access_outlined,
                  color: theme.colorScheme.primary,
                ),
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Cette application est développée par Quentin Eppe & Florian Detiffe. Tous droits réservés.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
