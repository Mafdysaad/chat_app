import 'package:chatapp/const/const.dart';
import 'package:chatapp/function/registeruser.dart';
import 'package:chatapp/function/showsnakbar.dart';
import 'package:chatapp/function/validatinput.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/widget/login/custom_bottun.dart';
import 'package:chatapp/widget/login/widget_login.dart';
import 'package:chatapp/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static String id = 'register';
  String? email;
  String? password;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
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
        body: Padding(
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
                  'Chat',
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                customform(
                  label: 'User Name',
                  functions: (value) {
                    widget.email = value;
                  },
                ),
                customform(
                  label: 'password',
                  obsecur: true,
                  functions: (value) {
                    widget.password = value;
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

                        await Registeruser(
                                email: widget.email, password: widget.password)
                            .registeruser(auth);
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseException catch (e) {
                        if (e.code == 'weak-password') {
                          showsnackbar(context, 'weak-password');
                        } else if (e.code == 'email-already-in-use') {
                          showsnackbar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showsnackbar(context, e.toString());
                      }
                      loading = false;
                      setState(() {});
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
                      'erady have an account..!! ',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(' Login ',
                          style: TextStyle(color: Colors.white, fontSize: 23)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
