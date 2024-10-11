import 'package:chatapp/function/showsnakbar.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login {
  String? email;
  String? password;
  login({required this.email, required this.password});
  Future<void> loginuser(FirebaseAuth auth) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
