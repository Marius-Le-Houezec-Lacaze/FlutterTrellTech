import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});


  void authenticate() async {
    // Present the dialog to the user
    final result = await FlutterWebAuth2.authenticate(
      url:
      "https://trello.com/1/authorize?expiration=never&scope=read,write,account&return_url=trelltech:/&response_type=token&key=c7c801ab56ffa887bf9ae6d04a8b8b98",
      callbackUrlScheme: "trelltech",
    );

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton( onPressed: ()=>authenticate(),child: Text("hello world")),
      )
    );
  }
}