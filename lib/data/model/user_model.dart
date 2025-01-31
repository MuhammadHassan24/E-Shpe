import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String username;
  final String number;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
    required this.username,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      number: map['number'] as String,
      username: map['username'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (number != null) {
      result.addAll({'number': number});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
