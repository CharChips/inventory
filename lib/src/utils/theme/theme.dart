// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
        color: Colors.black87,
      )));
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
