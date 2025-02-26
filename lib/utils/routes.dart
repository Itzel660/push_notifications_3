import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notificaciones_push/pages/login.dart';
import 'package:notificaciones_push/pages/home.dart';
import 'package:notificaciones_push/services/auth_service.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  Widget _builder(BuildContext context, AsyncSnapshot<User?> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasData) {
      return Home();
    }
    return Login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => Home(),
      },
      home: StreamBuilder<User?>(
        stream: UserAuthService.checkUserAuth(),
        builder: _builder,
      ),
    );
  }
}
