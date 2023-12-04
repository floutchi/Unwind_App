import 'package:flutter/material.dart';
import 'package:unwind_app/src/auth/auth_controller.dart';
import 'package:unwind_app/src/invite/invite_controller.dart';
import 'package:unwind_app/src/new_activity/new_activity_controller.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_controller.dart';
import 'package:unwind_app/src/settings/settings_controller.dart';

class ControllersProvider extends InheritedWidget {
  const ControllersProvider({
    super.key,
    required super.child,
    required this.authController,
    required this.settingsController,
    required this.periodController,
    required this.activityController,
    required this.inviteController,
  });

  final AuthController authController;
  final SettingsController settingsController;
  final PeriodsListingController periodController;
  final NewActivityController activityController;
  final InviteController inviteController;

  static ControllersProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ControllersProvider>()!;

  @override
  bool updateShouldNotify(ControllersProvider oldWidget) => true;
}

extension ContextProvider on BuildContext {
  ControllersProvider get provider => ControllersProvider.of(this);
}
