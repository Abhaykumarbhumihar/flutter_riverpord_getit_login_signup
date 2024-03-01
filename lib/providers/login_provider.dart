import 'package:flutter/material.dart';
import 'package:flutter_rivierpord_loginsignup/data/auth_usecae.dart';

import 'package:flutter_rivierpord_loginsignup/data/user_enitity.dart';
import 'package:flutter_rivierpord_loginsignup/services/service_locator.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/auth_repo.dart';
part 'login_provider.g.dart';

@riverpod
class LoginProvider extends _$LoginProvider {
  final AuthUseCase _authUseCase;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  LoginProvider() : _authUseCase = AuthUseCase(locator<AuthRepository>());

  @override
  UserEntity build() {
    return UserEntity();
  }

  setEmail() {
    state = state.copyWith(email: _emailController.text.toString());
  }

  setPassword() {
    state = state.copyWith(password: _passwordController.text.toString());
  }

  login() {
    var email = emailController.text.toString();
    var password = passwordController.text.toString();
    state = state.copyWith(createdAt: "testing");
    state = state.copyWith(updatedAt: "testing");
    state = state.copyWith(name: "testing");
    print("USER INPUT IS $email $password");
    _authUseCase.login(state);
    signUp();
  }

  signUp() {
    // var email = emailController.text.toString();
    // var password = passwordController.text.toString();
    // state = state.copyWith(createdAt: "testing");
    // state = state.copyWith(updatedAt: "testing");
    // state = state.copyWith(name: "testing");
    // print("USER INPUT IS $email $password");
    _authUseCase.getLocalData();
  }
}
