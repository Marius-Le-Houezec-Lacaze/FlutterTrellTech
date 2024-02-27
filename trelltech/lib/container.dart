

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trelltech/features/auth/data/services/authentication_service_impl.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';
import 'package:trelltech/features/shared/data/clients/member_client.dart';
import 'package:trelltech/features/shared/data/services/member_service_impl.dart';
import 'package:trelltech/features/shared/domain/services/member_service.dart';

import 'core/interceptors/authentication_interceptor.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AuthenticationInterceptor());
  sl.registerSingleton<Dio>(dio);



  //clients
  sl.registerSingleton<MemberClient>(MemberClient(sl()));

  //services
  sl.registerSingleton<AuthenticationService>(
      AuthenticationServiceImpl()
  );

  sl.registerSingleton<MemberService>(
    MemberServiceImpl(sl())
  );


}