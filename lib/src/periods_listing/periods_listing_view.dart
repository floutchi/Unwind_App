import 'package:flutter/material.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/controllers_provider.dart';
import 'package:unwind_app/src/period_details/period_details_view.dart';
import 'package:unwind_app/src/periods_listing/new_period_view.dart';
import 'package:unwind_app/src/settings/settings_view.dart';
import 'package:unwind_app/model/format_date.dart';

class PeriodsListingView extends StatelessWidget {
  const PeriodsListingView({super.key});

  static const route = "/";

  String _buildSubtitle(Period period) =>
      "${period.place.toString()}\n${period.start.dateLocale()} - ${period.end.dateLocale()}\n${period.participants.length} participant(s)";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.provider;
    final authController = provider.authController;
    final periodController = provider.periodController;

    Future<void> initControllers() async {
      await periodController.initPeriods();
      provider.activityController.initActivities(periodController.periods);
    }

    void openDialog() {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) => const Dialog.fullscreen(
          child: NewPeriodView(),
        ),
      );
    }

    Widget buildItem(Period period) {
      return ListTile(
          title: Text(
            period.name,
            style: theme.textTheme.titleLarge,
          ),
          subtitle: Text(
            _buildSubtitle(period),
          ),
          onTap: () async {
            await periodController.getPeriod(period.id);

            if (!context.mounted) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PeriodDetailsView(
                  periodId: period.id,
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unwind'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, SettingsView.route);
          }
        },
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
            ),
            accountName: Text(
              '${authController.user!.firstName} ${authController.user!.lastName}',
              style: TextStyle(color: theme.colorScheme.onSecondaryContainer),
            ),
            accountEmail: Text(
              authController.user!.email,
              style: TextStyle(color: theme.colorScheme.onSecondaryContainer),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Mes vacances'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text('Paramètres'),
          ),
        ],
      ),
      body: BodyWrapper(
        child: RefreshIndicator(
          onRefresh: () async => await initControllers(),
          child: FutureBuilder<void>(
            future: initControllers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const _Loading();
              }

              if (snapshot.hasError) {
                authController.signOut();
                return const _Loading();
              }

              return AnimatedBuilder(
                animation: periodController,
                builder: (context, _) => ListView(
                  children: periodController.periods.map(buildItem).toList(),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openDialog,
        tooltip: 'Ajouter des vacances',
        icon: const Icon(Icons.add),
        label: const Text('Nouvelles vacances'),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
