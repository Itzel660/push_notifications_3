// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMWaPNH7xgQwhzjsCTLtmL8MwMuB0kxVU',
    appId: '1:1024842154413:web:19ee70d9fa0ae6222c2124',
    messagingSenderId: '1024842154413',
    projectId: 'notificaciones-push-equipo3',
    authDomain: 'notificaciones-push-equipo3.firebaseapp.com',
    storageBucket: 'notificaciones-push-equipo3.firebasestorage.app',
    measurementId: 'G-XK833844TV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANe1NEc3yzMtxLmF7fBTED_g9CoI4E7bo',
    appId: '1:1024842154413:android:25595135881359922c2124',
    messagingSenderId: '1024842154413',
    projectId: 'notificaciones-push-equipo3',
    storageBucket: 'notificaciones-push-equipo3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwgNOxqt_vNWElQFJV5quzcmBXLTTg1Jc',
    appId: '1:1024842154413:ios:d41febe0ff732b462c2124',
    messagingSenderId: '1024842154413',
    projectId: 'notificaciones-push-equipo3',
    storageBucket: 'notificaciones-push-equipo3.firebasestorage.app',
    iosBundleId: 'com.example.notificacionesPush',
  );
}
