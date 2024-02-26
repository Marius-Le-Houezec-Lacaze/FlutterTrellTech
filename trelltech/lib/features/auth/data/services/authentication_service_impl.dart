
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../../config/constant.dart';
import '../../domain/services/AuthenticationServices.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  @override
  Future<String> tryAuthenticateUser() async {
    final url = Uri.https('trello.com', '/1/authorize', {
      'expiration': 'never',
      'scope': 'read,write,account',
      'key': apiToken,
      'return_url': "$callbackScheme:/",
      'response_type': 'token',
    });

    final result = await FlutterWebAuth2.authenticate(
      url: url.toString(),
      callbackUrlScheme: callbackScheme,
    );

    return Future.value(result);
  }


}