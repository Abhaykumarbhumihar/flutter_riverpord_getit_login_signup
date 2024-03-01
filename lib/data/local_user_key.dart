import 'package:flutter/foundation.dart' show immutable;

@immutable
class LocalAuth {
  const LocalAuth._();
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
}
