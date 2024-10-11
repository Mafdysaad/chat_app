import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customform extends StatelessWidget {
  String label;
  Function(String)? functions;
  bool obsecur;
  customform(
      {super.key,
      required this.label,
      required this.functions,
      this.obsecur = false});
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        obscureText: obsecur,
        onChanged: functions,
        validator: (value) {
          if (value!.isEmpty) {
            return 'required filde';
          }
        },
        style: const TextStyle(color: Colors.white, fontSize: 23),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.white),
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
