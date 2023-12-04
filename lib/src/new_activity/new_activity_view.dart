import 'package:flutter/material.dart';
import 'package:unwind_app/model/activity.dart';
import 'package:unwind_app/model/countries.dart';
import 'package:unwind_app/model/format_date.dart';
import 'package:unwind_app/model/place.dart';
import 'package:unwind_app/model/validators.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/controllers_provider.dart';

class NewActivityView extends StatefulWidget {
  const NewActivityView({
    super.key,
    required this.periodId,
    this.activity,
  });

  final int periodId;
  final Activity? activity;

  @override
  State<NewActivityView> createState() => _NewActivityViewState();
}

enum _DateType {
  start,
  end;
}

class _NewActivityViewState extends State<NewActivityView> {
  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    setState(() {
      _start = widget.activity?.start;
      _end = widget.activity?.end;
    });
  }

  Future<DateTime?> _showDateTimePicker(
    BuildContext context,
    _DateType type,
  ) async {
    final now = DateTime.now();
    final initialValue = switch (type) {
      _DateType.start => _start,
      _DateType.end => _end,
    };

    final date = await showDatePicker(
      context: context,
      currentDate: initialValue,
      firstDate: now,
      lastDate: now.add(
        const Duration(days: 365 * 5),
      ),
    );

    if (date == null) return null;

    if (!context.mounted) return null;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialValue ?? now),
    );

    if (time == null) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final controller = context.provider.activityController;

    var name = widget.activity?.name ?? "";
    var street = widget.activity?.place.street ?? "";
    var number = widget.activity?.place.number.toString() ?? "";
    var zipCode = widget.activity?.place.zipCode ?? "";
    var city = widget.activity?.place.city ?? "";
    var country = widget.activity?.place.country;

    Future<void> submitForm() async {
      if (!key.currentState!.validate()) return;

      final place = Place(
        street: street,
        number: int.parse(number),
        zipCode: zipCode,
        city: city,
        country: country!,
      );

      final newActivity = Activity(
        id: widget.activity?.id ?? -1,
        name: name,
        start: _start,
        end: _end,
        place: place,
      );

      if (widget.activity == null) {
        await controller.createActivity(widget.periodId, newActivity);
      } else {
        await controller.editActivity(widget.periodId, newActivity);
      }

      if (!context.mounted) return;
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity == null ? 'Nouvelle activité' : "Modifier l'activité",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Fermer',
        ),
      ),
      body: BodyWrapper(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: key,
            child: ListView(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Nom'),
                  ),
                  autofocus: true,
                  validator: checkEmpty,
                  initialValue: name,
                  onChanged: (value) => name = value,
                ),
                widget.activity != null
                    ? const SizedBox(height: 20.0)
                    : Container(),
                widget.activity != null
                    ? OutlinedButton(
                        onPressed: () async {
                          final dateTime = await _showDateTimePicker(
                            context,
                            _DateType.start,
                          );

                          if (dateTime == null) return;

                          setState(() => _start = dateTime);
                        },
                        child: Text(
                          _start == null
                              ? 'Sélectionner la date de début'
                              : 'Début : ${_start!.dateTimeLocale()}',
                        ),
                      )
                    : Container(),
                widget.activity != null
                    ? const SizedBox(height: 10.0)
                    : Container(),
                widget.activity != null
                    ? OutlinedButton(
                        onPressed: () async {
                          final dateTime = await _showDateTimePicker(
                            context,
                            _DateType.end,
                          );

                          if (dateTime == null) return;

                          setState(() => _end = dateTime);
                        },
                        child: Text(
                          _end == null
                              ? 'Sélectionner la date de fin'
                              : 'Fin : ${_end!.dateTimeLocale()}',
                        ),
                      )
                    : Container(),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Rue'),
                  ),
                  validator: checkEmpty,
                  initialValue: street,
                  onChanged: (value) => street = value,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Numéro'),
                  ),
                  autofocus: true,
                  validator: checkNumber,
                  keyboardType: TextInputType.number,
                  initialValue: number,
                  onChanged: (value) => number = value,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Code postal'),
                  ),
                  validator: checkEmpty,
                  initialValue: zipCode,
                  onChanged: (value) => zipCode = value,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Localité'),
                  ),
                  validator: checkEmpty,
                  initialValue: city,
                  onChanged: (value) => city = value,
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField(
                  hint: const Text('Sélectionnez un pays'),
                  isExpanded: true,
                  value: country,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Pays'),
                  ),
                  validator: checkEmpty,
                  items: countries
                      .map(
                        (c) => DropdownMenuItem<String>(
                          value: c.code,
                          child: Text(c.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => country = value,
                ),
                const SizedBox(height: 20.0),
                FilledButton(
                  onPressed: submitForm,
                  child: Text(widget.activity == null ? 'Ajouter' : 'Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
