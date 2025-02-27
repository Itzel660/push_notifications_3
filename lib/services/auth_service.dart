import 'package:firebase_auth/firebase_auth.dart';
import 'package:notificaciones_push/services/database_service.dart';
import 'package:notificaciones_push/services/messaging_service.dart';

class UserAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final DatabaseService _db = DatabaseService();
  static final MessagingService _messaging = MessagingService();

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var token = await _messaging.getToken();
      User? user = userCredential.user;
      await _db.updateUserData(email, password, token);
      return user;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  static checkUserAuth() {
    return _auth.authStateChanges();
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
