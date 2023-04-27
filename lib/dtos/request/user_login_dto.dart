// To parse this JSON data, do
//
//     final userLoginDto = userLoginDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserLoginDto userLoginDtoFromJson(String str) =>
    UserLoginDto.fromJson(json.decode(str));

String userLoginDtoToJson(UserLoginDto data) => json.encode(data.toJson());

class UserLoginDto {
  UserLoginDto({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory UserLoginDto.fromJson(Map<String, dynamic> json) => UserLoginDto(
        email: json["email"],
        password: json["password"],
        
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}