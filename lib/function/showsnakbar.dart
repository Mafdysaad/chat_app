import 'package:flutter/material.dart';

showsnackbar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}
