import 'package:flutter/material.dart';
import 'package:notificaciones_push/services/auth_service.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _userAuthService = UserAuthService();
  _userLogout() {
    _userAuthService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagina Principal')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                _userLogout();
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
