import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/function/login.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatApp());
}

class chatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        Register.id: (context) => Register(),
        Login.id: (context) => Login(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: Login.id,
    );
  }
}
