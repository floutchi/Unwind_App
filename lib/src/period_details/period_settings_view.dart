import 'package:flutter/material.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/controllers_provider.dart';
import 'package:unwind_app/src/periods_listing/new_period_view.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_view.dart';

class PeriodSettingsView extends StatelessWidget {
  const PeriodSettingsView({super.key, required this.period});

  final Period period;

  @override
  Widget build(BuildContext context) {
    final controller = context.provider.periodController;

    Future<void> delete() async {
      await controller.removePeriod(period.id);

      if (!context.mounted) return;

      Navigator.pushReplacementNamed(context, PeriodsListingView.route);
    }

    Future<void> onDelete() async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          title: const Text('Confirmer la suppression'),
          content: const Text(
            'Êtes-vous sûr de vouloir supprimer cette période de vacances ?',
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: delete,
              child: const Text('Supprimer'),
            ),
          ],
        ),
      );
    }

    void onEdit() {
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => Dialog.fullscreen(
          child: NewPeriodView(period: period),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de ${period.name}'),
      ),
      body: BodyWrapper(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('ID: ${period.id}'),
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Modifier'),
              onTap: onEdit,
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Supprimer'),
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
