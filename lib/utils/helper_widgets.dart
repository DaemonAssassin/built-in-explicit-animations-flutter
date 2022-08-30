import 'package:flutter/material.dart';

Widget addVerticalSpace(double space) => SizedBox(height: space);
Widget buildButton(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
  );
}
