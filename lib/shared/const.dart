import 'package:flutter/material.dart';

InputDecoration inputFieldDec() {
  return InputDecoration(
    hintText: 'Email',
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[800], width: 2.0)),
  );
}
