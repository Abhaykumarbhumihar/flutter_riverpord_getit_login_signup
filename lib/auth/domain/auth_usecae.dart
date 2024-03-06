import 'package:dartz/dartz.dart';
import 'package:flutter_rivierpord_loginsignup/auth/domain/auth_repo.dart';

import '../model/user_enitity.dart';
import '../../core/error/faliure.dart';

class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future<Either<String, UserEntity>> login(UserEntity userEntity) async {

    try{
      final data=await _authRepository.login(userEntity);
      return data;
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String, int>> createAccount(UserEntity userEntity) async {
    try {
      final data = await _authRepository.signUp(userEntity);
      return data;
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, List<UserEntity>>> getAllUser() async {
    try {
      final data = await _authRepository.getAllUser();
      return data;
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> getLocalData() async {
    _authRepository.signUp(UserEntity());
  }
}
