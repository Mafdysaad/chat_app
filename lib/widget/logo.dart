import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  double? size;
  Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          height: size,
          'assets/images/thinking_13098906.png',
        ),
      ),
    );
  }
}
