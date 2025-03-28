
import 'package:clockify/features/auth/data/models/user_model.dart';

class LoginUserResponse {
  final String status;
  final String? message;
  final UserModel? user;
  final String? token;
  final Map<String, ErrorDetail>? errors;

  LoginUserResponse({
    required this.status,
    this.message,
    this.user,
    this.token,
    this.errors
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] == "success") {
      return LoginUserResponse(
        status: json['status'],
        message: json['message'],
        user: json['user'] != null ? UserModel.fromJson(json: json['user']) : null,
        token: json.containsKey("token") ? json['token'] : "",
      );
    } else {
      return LoginUserResponse(
        status: json['status'],
        errors: (json['errors']['message'] != null)
          ? {'message': ErrorDetail.fromJson({'message': json['errors']['message']})}
          : null,
        user: null,
        token: null
      );
    }
  }
}

class LoginResult  {
  final UserModel user;
  final String message;
  final String token;

  LoginResult({
    required this.user,
    required this.message,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      user: UserModel.fromJson(json: json['user']),
      message: json['message'] ?? "",
      token: json["token"] ?? "", 
    );
  }
}
class ErrorDetail {
  final String message;
  ErrorDetail({
    required this.message
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      message: json['message']
    );
  }
}