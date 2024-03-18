

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trelltech/features/auth/data/services/authentication_service_impl.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';
import 'package:trelltech/features/boards/data/clients/board_client.dart';
import 'package:trelltech/features/boards/data/services/board_service_impl.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/organization/data/clients/organization_client.dart';
import 'package:trelltech/features/organization/data/services/organization_service_impl.dart';
import 'package:trelltech/features/organization/domain/services/organization_service.dart';
import 'package:trelltech/features/shared/data/clients/card_client.dart';
import 'package:trelltech/features/shared/data/clients/member_client.dart';
import 'package:trelltech/features/shared/data/services_implementation/card_service_impl.dart';
import 'package:trelltech/features/shared/data/services_implementation/member_service_impl.dart';
import 'package:trelltech/features/shared/domain/services/card_service.dart';
import 'package:trelltech/features/shared/domain/services/member_service.dart';

import 'core/interceptors/authentication_interceptor.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AuthenticationInterceptor());
  sl.registerSingleton<Dio>(dio);

  //clients
  InjectClients();
  //services_implementation
  InjectServices();
}

void InjectServices() {
  sl.registerSingleton<AuthenticationService>(
      AuthenticationServiceImpl()
  );

  sl.registerSingleton<MemberService>(
    MemberServiceImpl(sl())
  );

  sl.registerSingleton<OrganizationService>(
      OrganizationServiceImpl(sl())
  );

  sl.registerSingleton<CardService>(
      CardServiceImpl(sl())
  );

  sl.registerSingleton<BoardService>(
      BoardServiceImpl(sl(),sl())
  );

}

Future<void> InjectClients() async {
  sl.registerSingleton<MemberClient>(MemberClient(sl()));
  sl.registerSingleton<OrganizationClient>(OrganizationClient(sl()));
  sl.registerSingleton<BoardsClient>(BoardsClient(sl()));
  sl.registerSingleton<CardClient>(CardClient(sl()));
}