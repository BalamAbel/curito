// To parse this JSON data, do
//
//     final curriculumRequestDto = curriculumRequestDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurriculumRequestDto curriculumRequestDtoFromJson(String str) =>
    CurriculumRequestDto.fromJson(json.decode(str));

String curriculumRequestDtoToJson(CurriculumRequestDto data) =>
    json.encode(data.toJson());

class CurriculumRequestDto {
  CurriculumRequestDto({
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.numeroTelefonico,
    required this.direccion,
    required this.resumen,
    required this.education,
    required this.experience,
  });

  final String nombre;
  final String apellidos;
  final String email;
  final String numeroTelefonico;
  final String direccion;
  final String resumen;
  final List<Education> education;
  final List<Experience> experience;

  factory CurriculumRequestDto.fromJson(Map<String, dynamic> json) =>
      CurriculumRequestDto(
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        numeroTelefonico: json["numeroTelefonico"],
        direccion: json["direccion"],
        resumen: json["resumen"],
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "numeroTelefonico": numeroTelefonico,
        "direccion": direccion,
        "resumen": resumen,
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
      };
}

class Education {
  Education({
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
  });

  final String institution;
  final String degree;
  final String fieldOfStudy;
  final String startDate;
  final String endDate;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        institution: json["institution"],
        degree: json["degree"],
        fieldOfStudy: json["fieldOfStudy"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "institution": institution,
        "degree": degree,
        "fieldOfStudy": fieldOfStudy,
        "startDate": startDate,
        "endDate": endDate,
      };
}

class Experience {
  Experience({
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
  });

  final String company;
  final String position;
  final String startDate;
  final String endDate;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        position: json["position"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "position": position,
        "startDate": startDate,
        "endDate": endDate,
      };
}
