import 'package:flutter/material.dart';
import 'package:unwind_app/model/validators.dart';
import 'package:unwind_app/src/auth/auth_controller.dart';
import 'package:unwind_app/src/body_wrapper.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key, required this.authController});

  final AuthController authController;

  static const route = "/auth";

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final key = GlobalKey<FormState>();
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification'),
      ),
      body: BodyWrapper(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Adresse e-mail'),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: checkEmail,
                    onChanged: (value) => setState(() => email = value),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Mot de passe'),
                      border: OutlineInputBorder(),
                    ),
                    validator: checkPassword,
                    obscureText: true,
                    onChanged: (value) => setState(() => password = value),
                  ),
                  const SizedBox(height: 20.0),
                  FilledButton(
                    onPressed: () async {
                      if (!key.currentState!.validate()) {
                        return;
                      }

                      await widget.authController.signIn(email, password);
                    },
                    child: const Text('Se connecter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
