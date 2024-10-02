import 'package:flutter/material.dart';

class WidgetLogin extends StatelessWidget {
  final String label;

  const WidgetLogin({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontSize: 23),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(fontSize: 23),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
