import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/config/routes.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/core/interceptors/authentication_interceptor.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: Auth(),
    );
  }
}


