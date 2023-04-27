// To parse this JSON data, do
//
//     final currysResponseDto = currysResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurrysResponseDto currysResponseDtoFromJson(String str) => CurrysResponseDto.fromJson(json.decode(str));

String currysResponseDtoToJson(CurrysResponseDto data) => json.encode(data.toJson());

class CurrysResponseDto {
    CurrysResponseDto({
        required this.nombre,
        required this.apellidos,
        required this.email,
        required this.numeroTelefonico,
        required this.direccion,
        required this.resumen,
        required this.educaciones,
        required this.experiencias,
    });

    final String nombre;
    final String apellidos;
    final String email;
    final String numeroTelefonico;
    final String direccion;
    final String resumen;
    final List<Educacione> educaciones;
    final List<Experiencia> experiencias;

    factory CurrysResponseDto.fromJson(Map<String, dynamic> json) => CurrysResponseDto(
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        email: json["email"],
        numeroTelefonico: json["numeroTelefonico"],
        direccion: json["direccion"],
        resumen: json["resumen"],
        educaciones: List<Educacione>.from(json["educaciones"].map((x) => Educacione.fromJson(x))),
        experiencias: List<Experiencia>.from(json["experiencias"].map((x) => Experiencia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidos": apellidos,
        "email": email,
        "numeroTelefonico": numeroTelefonico,
        "direccion": direccion,
        "resumen": resumen,
        "educaciones": List<dynamic>.from(educaciones.map((x) => x.toJson())),
        "experiencias": List<dynamic>.from(experiencias.map((x) => x.toJson())),
    };
}

class Educacione {
    Educacione({
     
        required this.institucion,
        required this.titulo,
        required this.areaDeEstudio,
        required this.fechaInicio,
        required this.fechaFin,
    });

    
    final String institucion;
    final String titulo;
    final String areaDeEstudio;
    final DateTime fechaInicio;
    final DateTime fechaFin;

    factory Educacione.fromJson(Map<String, dynamic> json) => Educacione(
        
        institucion: json["institucion"],
        titulo: json["titulo"],
        areaDeEstudio: json["areaDeEstudio"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
    );

    Map<String, dynamic> toJson() => {
       
        "institucion": institucion,
        "titulo": titulo,
        "areaDeEstudio": areaDeEstudio,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
    };
}

class Experiencia {
    Experiencia({
        
        required this.company,
        required this.puesto,
        required this.fechaInicio,
        required this.fechaFin,
    });

    
    final String company;
    final String puesto;
    final DateTime fechaInicio;
    final DateTime fechaFin;

    factory Experiencia.fromJson(Map<String, dynamic> json) => Experiencia(
       
        company: json["company"],
        puesto: json["puesto"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
    );

    Map<String, dynamic> toJson() => {
       
        "company": company,
        "puesto": puesto,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
    };
}
