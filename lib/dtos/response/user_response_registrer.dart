// To parse this JSON data, do
//
//     final userRegistrerResponseDto = userRegistrerResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserRegistrerResponseDto userRegistrerResponseDtoFromJson(String str) =>
    UserRegistrerResponseDto.fromJson(json.decode(str));

String userRegistrerResponseDtoToJson(UserRegistrerResponseDto data) =>
    json.encode(data.toJson());

class UserRegistrerResponseDto {
  UserRegistrerResponseDto({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory UserRegistrerResponseDto.fromJson(Map<String, dynamic> json) =>
      UserRegistrerResponseDto(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
