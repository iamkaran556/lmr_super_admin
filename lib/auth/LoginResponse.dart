// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? userId;
  String? email;
  String? accessToken;

  LoginResponse({
    this.userId,
    this.email,
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    userId: json["userId"],
    email: json["email"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "email": email,
    "accessToken": accessToken,
  };
}
