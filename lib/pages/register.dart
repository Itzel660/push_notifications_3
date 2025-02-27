import 'package:flutter/material.dart';
import 'package:notificaciones_push/services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final UserAuthService _authService = UserAuthService();

  register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return;
    }

    await _authService.registerWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    //navigato to home
    Navigator.pushNamed(context, '/home');
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
              child: Text('Registrar', style: TextStyle(fontSize: 24)),
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
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Confirmar password',
                      ),
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
                  register();
                },
                child: const Text('Registrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
