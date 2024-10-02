import 'package:flutter/material.dart';

class CustomBottun extends StatelessWidget {
  const CustomBottun({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        height: 60,
        minWidth: double.infinity,
        onPressed: () {},
        color: Colors.white,
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
