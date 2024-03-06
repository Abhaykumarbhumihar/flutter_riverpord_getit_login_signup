import 'package:dartz/dartz.dart';
import 'package:flutter_rivierpord_loginsignup/auth/domain/auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/auth/domain/local_auth.dart';
import '../model/user_enitity.dart';
import '../../services/api_services.dart';

class ImplAuthRepository implements AuthRepository {
  final ApiServices _apiServices;
  final LocalAuthsource _localAuthsource;

  ImplAuthRepository(this._apiServices, this._localAuthsource);

  @override
  Future<Either<String, UserEntity>> login(UserEntity task) async {

    try{
      var data = await _localAuthsource.login(task);
      return data;
    }catch(err){
      return Left(err.toString());
    }
  }

  @override

  Future<Either<String, int>> signUp(UserEntity userEntity) async {
    try {
      var data = await _localAuthsource.addTaskk(userEntity);
      return data;
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<UserEntity>>> getAllUser()async {
    try{
      var data=await _localAuthsource.getAllUser();
      return data;
    }catch(e){
      return Left(e.toString());
    }

  }
}
