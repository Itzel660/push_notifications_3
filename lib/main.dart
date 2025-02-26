import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notificaciones_push/services/messaging_service.dart';
import 'package:notificaciones_push/utils/routes.dart';
import 'utils/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MessagingService().init();
  runApp(const Routes());
}
