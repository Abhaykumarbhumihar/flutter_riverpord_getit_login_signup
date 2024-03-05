import 'package:flutter_rivierpord_loginsignup/data/auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/data/local_auth.dart';
import 'package:flutter_rivierpord_loginsignup/data/user_enitity.dart';

import '../services/api_services.dart';

class ImplAuthRepository implements AuthRepository {
  final ApiServices _apiServices;
  final LocalAuthsource _localAuthsource;
  ImplAuthRepository(this._apiServices, this._localAuthsource);
  @override
  Future<void> login(UserEntity task) async {
    var id = await _localAuthsource.addTask(task);
    print("ADDED DATA IN LOCAL $id");
  }

  @override
  Future<void> signUp(UserEntity task) async {
    var data = await _localAuthsource.addTaskk(task);
    print(data);
    var datad = _localAuthsource.getAllUser();
  }
}
