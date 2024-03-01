import 'package:flutter_rivierpord_loginsignup/data/auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/data/auth_usecae.dart';
import 'package:flutter_rivierpord_loginsignup/data/impl_auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/screen/login.dart';
import 'package:get_it/get_it.dart';

import '../data/local_auth.dart';
import 'api_services.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(ApiServices(''));
  locator.registerSingleton(LocalAuthsource());
  locator.registerSingleton<AuthRepository>(
      ImplAuthRepository(locator<ApiServices>(), locator<LocalAuthsource>()));

  locator
      .registerSingleton<AuthUseCase>(AuthUseCase(locator<AuthRepository>()));
}
