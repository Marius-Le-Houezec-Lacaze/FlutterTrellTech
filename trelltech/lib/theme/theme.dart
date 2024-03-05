import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff274029),
          primary:Color(0xff274029),
          onPrimary: Colors.white,
          secondary: Color(0xffffc857),
          tertiary: Color(0xff181f1c)
    ),
    textTheme: TextTheme(
          titleLarge: GoogleFonts.workSans(
                fontSize: 42,
                fontWeight: FontWeight.bold,
          )
    )

);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark
);