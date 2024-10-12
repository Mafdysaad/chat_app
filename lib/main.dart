import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubites/Login_cubit/login_cubit.dart';
import 'package:chatapp/pages/cubites/Register_cubit/Register_cubit.dart';
import 'package:chatapp/pages/cubites/authbloc/authbloc_bloc.dart';
import 'package:chatapp/pages/cubites/authcubit/authcubit.dart';
import 'package:chatapp/pages/cubites/chat_cubit/chat_cubit.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthblocBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: {
          Register.id: (context) => Register(),
          Login.id: (context) => Login(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: Login.id,
      ),
    );
  }
}
