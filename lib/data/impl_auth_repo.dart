import 'package:flutter_rivierpord_loginsignup/data/auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/data/user_enitity.dart';

import '../services/api_services.dart';

class ImplAuthRepository implements AuthRepository {
  final ApiServices _apiServices;
  ImplAuthRepository(this._apiServices);
  @override
  Future<void> login(UserEntity task) async {}

  @override
  Future<void> signUp(UserEntity task) async {}
}
