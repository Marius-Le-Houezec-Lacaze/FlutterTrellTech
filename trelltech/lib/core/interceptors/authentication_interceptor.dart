import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trelltech/config/constant.dart';



class AuthenticationInterceptor implements Interceptor  {



  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("error happened");
    return handler.next(err);
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("onRequest");
    final prefs = await SharedPreferences.getInstance();


    options.queryParameters.addAll({
      'token': prefs.getString('token'),
      'key' : apiKey,
    });

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
