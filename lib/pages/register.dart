import 'package:chatapp/const/const.dart';
import 'package:chatapp/widget/login/custom_bottun.dart';
import 'package:chatapp/widget/login/widget_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatelessWidget {
  Register({super.key});
  String id = '5834';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 150,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/thinking_13098906.png',
                    scale: 4,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Chat',
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
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
              const WidgetLogin(
                label: 'User Name',
              ),
              const WidgetLogin(
                label: 'password',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomBottun(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'erady have an account..!! ',
                    style: const TextStyle(color: Colors.white, fontSize: 22),
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
