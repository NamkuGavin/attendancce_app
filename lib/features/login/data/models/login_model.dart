import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
    );
  }
}
