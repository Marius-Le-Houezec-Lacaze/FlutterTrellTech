import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/config/routes.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/core/interceptors/authentication_interceptor.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';
import 'package:trelltech/features/boards/presentation/pages/boards.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/presentation/pages/app.dart';

import 'features/organization/domain/arguments/organization_arguments.dart';

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
      routes: {
        // '/': (context)=> Auth(),
        '/boards': (context) => Boards(ModalRoute.of(context)
            ?.settings
            .arguments as OrganizationArguments),
        '/organization': (context) => const Organization(),
        '/app': (context) => App(),
      },
      home: Auth(),
    );
  }
}


