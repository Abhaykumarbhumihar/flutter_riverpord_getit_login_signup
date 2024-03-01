import 'user_enitity.dart';

abstract class AuthRepository {
  Future<void> login(UserEntity userEntity);
  Future<void> signUp(UserEntity userEntity);
}
