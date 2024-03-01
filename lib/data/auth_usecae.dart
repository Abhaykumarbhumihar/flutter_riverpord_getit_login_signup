import 'package:flutter_rivierpord_loginsignup/data/auth_repo.dart';
import 'package:flutter_rivierpord_loginsignup/data/user_enitity.dart';

class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future<void> login(UserEntity userEntity) async {
    return await _authRepository.login(userEntity);
  }
}
