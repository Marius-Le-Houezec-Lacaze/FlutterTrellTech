import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get_it/get_it.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';
import 'package:trelltech/features/shared/domain/services/member_service.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

   final AuthenticationService _authenticationService = sl<AuthenticationService>();
   final MemberService _memberService = sl<MemberService>();


   Future<void> authUser() async {
     print("tryAuthUser");
     final token = await _authenticationService.tryAuthenticateUser();
     final user = await _memberService.getMemberByToken(token);

     print(user.id);
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton( onPressed: authUser,child: const Text("Authenticate with trello")),
      )
    );
  }
}