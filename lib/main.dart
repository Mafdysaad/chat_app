import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: const Login(),
      routes: {
        Register.id: (context) => Register(),
      },
    );
  }
}
