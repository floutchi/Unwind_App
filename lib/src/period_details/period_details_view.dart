import 'package:flutter/material.dart';
import 'package:unwind_app/model/activity.dart';
import 'package:unwind_app/model/format_date.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/model/weather.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/controllers_provider.dart';
import 'package:unwind_app/src/invite/invite_view.dart';
import 'package:unwind_app/src/new_activity/new_activity_view.dart';
import 'package:unwind_app/src/period_details/period_settings_view.dart';

class PeriodDetailsView extends StatelessWidget {
  const PeriodDetailsView({super.key, required this.periodId});

  final int periodId;

  int durationInDays(Period period) => ((period.end.millisecondsSinceEpoch -
              period.start.millisecondsSinceEpoch) /
          (1000 * 60 * 60 * 24))
      .round();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.provider;
    final periodController = provider.periodController;

    void openDialog() => showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) => Dialog.fullscreen(
            child: NewActivityView(periodId: periodId),
          ),
        );

    return AnimatedBuilder(
      animation: periodController,
      builder: (context, _) {
        final period = periodController.period(periodId);

        return Scaffold(
          appBar: AppBar(
            title: Text(period.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Ajouter une activité',
                onPressed: openDialog,
              ),
              IconButton(
                icon: const Icon(Icons.person_add_outlined),
                tooltip: 'Inviter des utilisateurs',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteView(
                      periodId: periodId,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: 'Paramètres des vacances',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeriodSettingsView(period: period),
                  ),
                ),
              ),
            ],
          ),
          body: BodyWrapper(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Users listing
                  Text(
                    'Participants (${period.participants.length}) :',
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: period.participants
                        .map(
                          (p) => Chip(
                            label: Text(
                              '${p.firstName} ${p.lastName}',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20.0),

                  // Vacation location
                  _InfoCard(
                    title: 'Lieu de vacances',
                    subtitle: period.place.toString(),
                    icon: Icons.place_outlined,
                  ),
                  const SizedBox(height: 20.0),

                  // Dates and duration
                  _InfoCard(
                    title: 'Dates et durée',
                    subtitle:
                        'Du ${period.start.dateLocale()} au ${period.end.dateLocale()}. (${durationInDays(period)} jours)',
                    icon: Icons.schedule,
                  ),
                  const SizedBox(height: 20.0),

                  // Activities listing
                  _ActivitiesCard(period.id),
                  const SizedBox(height: 20.0),

                  // Weather data
                  _InfoCard(
                    title: 'Prévisions météo',
                    subtitle: "Les prévisions météorologiques sur place",
                    icon: Icons.thermostat_outlined,
                    child: period.weather == null || period.weather!.isEmpty
                        ? const Text(
                            'Les données météo sont disponibles 5 jours avant le départ en vacances',
                          )
                        : _WeatherCarousel(weather: period.weather!),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Chatter avec le groupe',
            child: const Icon(Icons.chat_outlined),
          ),
        );
      },
    );
  }
}

class _ActivitiesCard extends StatelessWidget {
  const _ActivitiesCard(this.periodId);

  final int periodId;

  String buildActivitySubtitle(Activity activity) =>
      '${activity.place.toString()}\n${activity.start == null ? 'Non planifié' : '${activity.start!.dateTimeLocale()} - ${activity.end!.dateTimeLocale()}'}';

  void _onEdit(BuildContext context, Activity activity) => showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) => Dialog.fullscreen(
          child: NewActivityView(
            periodId: periodId,
            activity: activity,
          ),
        ),
      );

  void _onDelete(BuildContext context, int activityId) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirmer la suppression'),
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          content: const Text(
            'Êtes-vous sûr de vouloir supprimer cette activité ?',
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () async {
                final controller = context.provider.activityController;
                await controller.removeActivity(periodId, activityId);

                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: const Text('Supprimer'),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final controller = context.provider.activityController;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return _InfoCard(
          title: 'Activités prévues',
          subtitle: 'La liste des activités prévues sur place',
          icon: Icons.event_outlined,
          child: SizedBox(
            height: 200.0,
            child: ListView(
              children: controller
                  .activities(periodId)
                  .map(
                    (a) => ListTile(
                      title: Text(a.name),
                      isThreeLine: true,
                      subtitle: Text(
                        buildActivitySubtitle(a),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            tooltip: "Modifier l'activité",
                            onPressed: () => _onEdit(context, a),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            tooltip: "Supprimer l'activité",
                            onPressed: () => _onDelete(context, a.id),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.child,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 5.0),
            Text(
              title,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 20.0),
            Text(
              subtitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 20.0),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}

class _WeatherCarousel extends StatefulWidget {
  const _WeatherCarousel({required this.weather});

  final List<Weather> weather;

  @override
  State<_WeatherCarousel> createState() => __WeatherCarouselState();
}

class __WeatherCarouselState extends State<_WeatherCarousel> {
  var _selectedIndex = 0;

  void _next() => setState(
        () => _selectedIndex = (_selectedIndex + 1) % widget.weather.length,
      );

  void _back() {
    if (_selectedIndex == 0) {
      setState(() => _selectedIndex = widget.weather.length - 1);
    } else {
      setState(() => _selectedIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: _back,
        ),
        _WeatherInfo(
          weather: widget.weather[_selectedIndex],
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: _next,
        ),
      ],
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  const _WeatherInfo({required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          weather.date.dateLocale(),
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 20.0),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.network(weather.iconURL),
        ),
        const SizedBox(height: 20.0),
        Text(
          '${weather.temperature}°C',
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 20.0),
        Text(
          weather.description,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 30.0),
        Text(
          'OpenWeatherMap.org',
          style: theme.textTheme.titleSmall!.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
