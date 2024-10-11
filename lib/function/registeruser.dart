import 'package:firebase_auth/firebase_auth.dart';

class Registeruser {
  String? email;
  String? password;
  Registeruser({required this.email, required this.password});
  Future<void> registeruser(FirebaseAuth auth) async {
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
