import 'package:flutter/material.dart';

class MyMessenger {
  static showMessenger(BuildContext context, String text, Color color) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: color,
          content: Text(text),
        ),
      );
}
