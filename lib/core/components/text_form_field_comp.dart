import 'package:flutter/material.dart';

class TextFormFieldComp {
  static InputDecoration inpurDecoration(String hint, String label) =>
      InputDecoration(
        hintText: hint,
        labelText: label,
        border: UnderlineInputBorder(),
      );
}
