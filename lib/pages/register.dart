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
  final confirmPasswordController = TextEditingController();

  final UserAuthService _authService = UserAuthService();

  register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _alertDialog('Por favor, rellena todos los campos');
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      _alertDialog('Las contraseñas no coinciden');
      return;
    }
    try {
      await _authService.registerWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      _alertDialog('Error al registrar el usuario');
    }
  }

  _alertDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Error')),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
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
                      controller: confirmPasswordController,
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
