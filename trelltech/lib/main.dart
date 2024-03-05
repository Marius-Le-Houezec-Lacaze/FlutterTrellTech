import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/config/routes.dart';
import 'package:trelltech/constants/TrellTechTheme.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/core/interceptors/authentication_interceptor.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trelltech/theme/theme.dart';
import 'package:trelltech/theme/themeManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: Auth(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
    );
  }
}


