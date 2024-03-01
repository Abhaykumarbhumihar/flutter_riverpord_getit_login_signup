// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserEntity {
  final String? email;
  final String? password;

  UserEntity({this.email, this.password});

  UserEntity copyWith({
    String? email,
    String? password,
  }) {
    return UserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'] as String?,
      password: map['password'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserEntity(email: $email, password: $password)';

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
