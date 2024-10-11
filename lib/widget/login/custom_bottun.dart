import 'package:flutter/material.dart';

class CustomBottun extends StatelessWidget {
  CustomBottun({super.key, required this.functions});
  void Function()? functions;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        height: 60,
        //  minWidth: double.infinity,
        onPressed: functions,
        color: Colors.white,
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
