

import 'package:get_it/get_it.dart';
import 'package:trelltech/features/auth/data/services/authentication_service_impl.dart';
import 'package:trelltech/features/auth/domain/services/AuthenticationServices.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthenticationService>(
      AuthenticationServiceImpl()
  );

}