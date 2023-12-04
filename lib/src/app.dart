import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unwind_app/src/auth/auth_controller.dart';
import 'package:unwind_app/src/auth/auth_view.dart';
import 'package:unwind_app/src/controllers_provider.dart';
import 'package:unwind_app/src/invite/invite_controller.dart';
import 'package:unwind_app/src/invite/invite_service.dart';
import 'package:unwind_app/src/new_activity/new_activity_controller.dart';
import 'package:unwind_app/src/new_activity/new_activity_service.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_controller.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_service.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_view.dart';
import 'package:unwind_app/src/settings/settings_controller.dart';
import 'package:unwind_app/src/settings/settings_view.dart';

class UnwindApp extends StatelessWidget {
  const UnwindApp({
    super.key,
    required this.settingsController,
    required this.authController,
  });

  final SettingsController settingsController;
  final AuthController authController;

  static const _appColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (light, dark) {
        light ??= ColorScheme.fromSeed(seedColor: _appColor);
        dark ??= ColorScheme.fromSeed(
          seedColor: _appColor,
          brightness: Brightness.dark,
        );

        final lightTheme = ThemeData(
          colorScheme: light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: light.surfaceVariant.withOpacity(0.3),
          ),
          fontFamily: 'Lexend Deca',
        );

        final darkTheme = ThemeData(
          colorScheme: dark,
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: dark.surfaceVariant.withOpacity(0.3),
          ),
          fontFamily: 'Lexend Deca',
        );

        return AnimatedBuilder(
          animation: settingsController,
          builder: (context, _) {
            return AnimatedBuilder(
              animation: authController,
              builder: (context, _) {
                return ControllersProvider(
                  authController: authController,
                  settingsController: settingsController,
                  periodController: PeriodsListingController(
                    PeriodsListingService(authController.userToken ?? ""),
                  ),
                  activityController: NewActivityController(
                    NewActivityService(authController.userToken ?? ""),
                  ),
                  inviteController: InviteController(
                    InviteService(authController.userToken ?? ""),
                  ),
                  child: MaterialApp(
                    title: 'Unwind',
                    restorationScopeId: 'unwind_app',
                    debugShowCheckedModeBanner: false,
                    supportedLocales: const [Locale('fr')],
                    localizationsDelegates: const [
                      GlobalWidgetsLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: settingsController.themeMode,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) {
                        if (!authController.isConnected) {
                          return AuthView(authController: authController);
                        }

                        return switch (settings.name) {
                          SettingsView.route => SettingsView(
                              settingsController: settingsController,
                              authController: authController,
                            ),
                          _ => const PeriodsListingView(),
                        };
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
