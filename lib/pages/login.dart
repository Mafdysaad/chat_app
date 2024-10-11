import 'package:chatapp/const/const.dart';
import 'package:chatapp/function/login.dart';

import 'package:chatapp/function/showsnakbar.dart';
import 'package:chatapp/function/validatinput.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register.dart';
import 'package:chatapp/widget/login/custom_bottun.dart';
import 'package:chatapp/widget/login/widget_login.dart';
import 'package:chatapp/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  Login({super.key});
  static String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;

  String? password;
  bool loading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance;
    return ModalProgressHUD(
      inAsyncCall: loading,
      color: Colors.white,
      blur: 3,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.blue,
      ),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Logo(size: 150),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Chate',
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  customform(
                    label: 'User Name',
                    functions: (value) {
                      email = value;
                    },
                  ),
                  customform(
                    label: 'password',
                    obsecur: true,
                    functions: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBottun(
                    functions: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          setState(() {
                            loading = true;
                          });
                          await login(email: email, password: password)
                              .loginuser(auth);

                          Navigator.pushNamed(context, ChatPage.id,
                              arguments: email);
                        } on FirebaseException catch (e) {
                          if (e.code == 'user-not-found') {
                            showsnackbar(context, 'user-not-found');
                          } else if (e.code == 'wrong-password') {
                            showsnackbar(context, 'wrong-password');
                          }
                        } catch (e) {
                          showsnackbar(context, e.toString());
                        }
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont\'n have an account ',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: const Text(' SignUp?',
                            style:
                                TextStyle(color: Colors.white, fontSize: 23)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
