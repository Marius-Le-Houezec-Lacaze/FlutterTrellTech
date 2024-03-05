import 'package:flutter/material.dart';


Color primary= const Color(0x00878e88);



final ThemeData trellTechTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      // ···
      brightness: Brightness.dark,
    ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    )
  )
);