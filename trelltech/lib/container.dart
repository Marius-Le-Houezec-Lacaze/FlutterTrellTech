

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trelltech/features/auth/data/services/authentication_service_impl.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';
import 'package:trelltech/features/organization/data/clients/organization_client.dart';
import 'package:trelltech/features/organization/data/services/organization_service_impl.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
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
  sl.registerSingleton<OrganizationClient>(OrganizationClient(sl()));

  //services
  sl.registerSingleton<AuthenticationService>(
      AuthenticationServiceImpl()
  );

  sl.registerSingleton<MemberService>(
    MemberServiceImpl(sl())
  );

  sl.registerSingleton<OrganizationService>(
      OrganizationServiceImpl(sl())
  );


}