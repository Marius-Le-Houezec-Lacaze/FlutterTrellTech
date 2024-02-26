import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get_it/get_it.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

   final AuthenticationService _authenticationService = sl<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton( onPressed: ()=> _authenticationService.tryAuthenticateUser(),child: const Text("Authenticate with trello")),
      )
    );
  }
}