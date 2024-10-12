import 'package:chatapp/const/const.dart';

import 'package:chatapp/function/showsnakbar.dart';

import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubites/authbloc/authbloc_bloc.dart';

import 'package:chatapp/widget/login/custom_bottun.dart';
import 'package:chatapp/widget/login/widget_login.dart';
import 'package:chatapp/widget/logo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatelessWidget {
  Register({super.key});
  static String id = 'register';
  String? email;
  String? password;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();

    return BlocConsumer<AuthblocBloc, Authstate>(listener: (context, state) {
      if (state is Registerloding) {
        loading = true;
      } else if (state is Registersuccess) {
        Navigator.of(context).pushNamed(ChatPage.id);
        loading = false;
      } else if (state is Registerfuilar) {
        showsnackbar(context, state.error);
        loading = false;
      }
    }, builder: (context, state) {
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
                        BlocProvider.of<AuthblocBloc>(context)
                            .add(Registerevent(email!, password!));
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
      );
    });
  }
}
