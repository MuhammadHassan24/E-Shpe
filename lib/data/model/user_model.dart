class UserModel {
  final String name;
  final String email;
  final String password;
  final String username;
  final int number;

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
      number: map['number'] as int,
      username: map['username'] as String,
    );
  }
}
