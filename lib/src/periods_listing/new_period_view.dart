import 'package:flutter/material.dart';
import 'package:unwind_app/model/countries.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/model/place.dart';
import 'package:unwind_app/model/validators.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/model/format_date.dart';
import 'package:unwind_app/src/controllers_provider.dart';

class NewPeriodView extends StatefulWidget {
  const NewPeriodView({super.key, this.period});

  final Period? period;

  @override
  State<NewPeriodView> createState() => _NewPeriodViewState();
}

class _NewPeriodViewState extends State<NewPeriodView> {
  final key = GlobalKey<FormState>();

  DateTime? _start;
  DateTime? _end;

  @override
  void initState() {
    super.initState();
    setState(() {
      _start = widget.period?.start;
      _end = widget.period?.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ControllersProvider.of(context).periodController;

    var name = widget.period?.name ?? "";
    var street = widget.period?.place.street ?? "";
    var number = widget.period?.place.number.toString() ?? "";
    var zipCode = widget.period?.place.zipCode ?? "";
    var city = widget.period?.place.city ?? "";
    var country = widget.period?.place.country;

    Future<void> onSubmit() async {
      if (!key.currentState!.validate()) return;

      if (_start == null || _end == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez préciser la date début et de fin'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      final place = Place(
        street: street,
        number: int.parse(number),
        zipCode: zipCode,
        city: city,
        country: country!,
      );

      final period = Period(
        id: widget.period?.id ?? -1,
        name: name,
        start: _start!,
        end: _end!,
        place: place,
        participants: widget.period?.participants ?? [],
        activities: widget.period?.activities ?? [],
        weather: widget.period?.weather ?? [],
      );

      if (widget.period == null) {
        await controller.createPeriod(period);
      } else {
        await controller.editPeriod(period);
      }

      if (!context.mounted) return;
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.period == null
              ? 'Nouvelles vacances'
              : 'Modifier les vacances',
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
                  onChanged: (value) => name = value,
                  validator: checkEmpty,
                  initialValue: name,
                ),
                const SizedBox(height: 20.0),
                OutlinedButton(
                  onPressed: () async {
                    final start = await showDatePicker(
                      context: context,
                      currentDate: _start,
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 5)),
                    );

                    setState(() => _start = start);
                  },
                  child: Text(
                    _start == null
                        ? 'Sélectionner la date de début'
                        : 'Début : ${_start!.dateLocale()}',
                  ),
                ),
                const SizedBox(height: 10.0),
                OutlinedButton(
                  onPressed: () async {
                    final end = await showDatePicker(
                      context: context,
                      currentDate: _end,
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 5)),
                    );

                    setState(() => _end = end);
                  },
                  child: Text(
                    _end == null
                        ? 'Sélectionner la date de fin'
                        : 'Fin : ${_end!.dateLocale()}',
                  ),
                ),
                const SizedBox(height: 20.0),

                // Street
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Rue'),
                  ),
                  onChanged: (value) => street = value,
                  validator: checkEmpty,
                  initialValue: street,
                ),
                const SizedBox(height: 20.0),

                // Street number
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Numéro'),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => number = value,
                  validator: checkNumber,
                  initialValue: number,
                ),
                const SizedBox(height: 20.0),

                // Zip code
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Code postal'),
                  ),
                  onChanged: (value) => zipCode = value,
                  validator: checkEmpty,
                  initialValue: zipCode,
                ),
                const SizedBox(height: 20.0),

                // City
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Localité'),
                  ),
                  onChanged: (value) => city = value,
                  validator: checkEmpty,
                  initialValue: city,
                ),
                const SizedBox(height: 20.0),

                // Country
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

                // Confirm button
                FilledButton(
                  onPressed: () async => await onSubmit(),
                  child: Text(
                    widget.period == null ? 'Créer' : 'Modifier',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
