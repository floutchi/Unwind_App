import 'package:flutter/material.dart';
import 'package:unwind_app/model/validators.dart';
import 'package:unwind_app/src/body_wrapper.dart';
import 'package:unwind_app/src/controllers_provider.dart';

class InviteView extends StatelessWidget {
  const InviteView({super.key, required this.periodId});

  final int periodId;

  @override
  Widget build(BuildContext context) {
    final inviteController = context.provider.inviteController;
    final periodController = context.provider.periodController;

    var email = "";

    Future<String?> invite(String input) async {
      if (input.trim().isEmpty) return "Veuillez spécifier une adresse e-mail";

      final result = checkEmail(input);
      if (result != null) return result;

      await inviteController.invite(periodId, input);
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inviter des personnes'),
      ),
      body: BodyWrapper(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Adresse e-mail'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => email = value,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                ),
                const SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () async {
                    final message = await invite(email);

                    if (message != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    if (!context.mounted) return;

                    Navigator.pop(context);
                    await periodController.getPeriod(periodId);
                  },
                  child: const Text('Inviter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
