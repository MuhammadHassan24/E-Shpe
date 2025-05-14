import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String number;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      number: map['number'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
        {'name': name, 'email': email, 'password': password, 'number': number});

    return result;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
