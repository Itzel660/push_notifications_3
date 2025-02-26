import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid = '';
  DatabaseService();

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future updateUserData(String email, String password, token) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'password': password,
      'token': token,
    });
  }

  // get user data
  Future getUserData(uid) async {
    this.uid = uid;
    return await userCollection.doc(this.uid).get();
  }
}
