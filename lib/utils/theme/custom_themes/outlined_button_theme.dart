import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();
  // lightTOutlinedButtonTheme:
  static final lightTOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    side: BorderSide(color: Colors.blue),
    textStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));

  // darkTOutlinedButtonTheme:
  static final darkTOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    side: BorderSide(color: Colors.blueAccent),
    textStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}
