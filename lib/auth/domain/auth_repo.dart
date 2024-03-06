import 'package:dartz/dartz.dart';

import '../model/user_enitity.dart';
import '../../core/error/faliure.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> login(UserEntity userEntity);
  Future<Either<String, int>> signUp(UserEntity userEntity);
  Future<Either<String, List<UserEntity>>> getAllUser();


}
