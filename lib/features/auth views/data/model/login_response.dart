import 'package:insaf/features/auth%20views/data/model/login_model.dart';

class LoginResponse {
  final String message;
  final String token;
  final User user;

  LoginResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? 'Login successful',
      token: json['token'] ?? '',
      user: User.fromJson(json['user']),
    );
  }
}
