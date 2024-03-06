import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rivierpord_loginsignup/auth/domain/auth_usecae.dart';

import 'package:flutter_rivierpord_loginsignup/services/service_locator.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/auth_repo.dart';
import '../../model/user_enitity.dart';

part 'login_provider.g.dart';




@riverpod
class LoginProvider extends _$LoginProvider {

  final AuthUseCase _authUseCase;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  LoginProvider() : _authUseCase = AuthUseCase(locator<AuthRepository>());
  List<UserEntity> list=[];
  @override
  UserEntity build() {
    getAllUsersFromDb();
    return UserEntity();
  }

  setEmail() {
    state = state.copyWith(email: _emailController.text.toString());
  }

  setPassword() {
    state = state.copyWith(password: _passwordController.text.toString());
  }

  login() async {
    state = state.copyWith(createdAt: "testing");
    state = state.copyWith(updatedAt: "testing");
    state = state.copyWith(name: "testing");
    setEmail();
    setPassword();

    final result = await _authUseCase.login(state);
    result.fold((left) {
      print("i am at login Error: $left");
    }, (right) {
      print("i am at login Success: $right");
    });
  }

  getAllUsersFromDb()async{
  await  _authUseCase.getAllUser().then((result) {
      result.fold(
            (left) {
          // Handle error
          print("Error: $left");
        },
            (right) {
          // Handle success
              list=right;

          print("Users: ${list.length}");
        },
      );
    });
  }

  signUp() async {
    state = state.copyWith(createdAt: "testing");
    state = state.copyWith(updatedAt: "testing");
    state = state.copyWith(name: "testing");
    setEmail();
    setPassword();
    final result = await _authUseCase.createAccount(state);
    result.fold(
      (left) {
        print("i am at herr Error: $left");
      },
      (right) {
        print("i am at herr Success: $right");
        getAllUsersFromDb();
      },
    );
  }
}
