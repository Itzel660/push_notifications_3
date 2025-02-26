import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notificaciones_push/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final UserAuthService _authService = UserAuthService();

  login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }

    _authService.signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Iniciar sesión', style: TextStyle(fontSize: 24)),
            ),

            // user and password fields
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            // login button
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text('Login'),
              ),
            ),
            // register button
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text('¿No tienes cuenta?'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: register
                },
                child: const Text('Registrate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
