// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/dtos/request/curriculum_request_dto.dart';
import 'package:proyecto_currys/dtos/request/datos_personales_request.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurriculumsProviders extends ChangeNotifier {
  final logger = Logger();
  bool isloading = true;
  bool userFound = true;
  CurriculumRequestDto? _CurriculumRequestDto;
  // CurriculumResponseDto? get curriculumResponseDto => _CurriculumResponseDto;
  List<CurriculumRequestDto>? _curriculums;
  Future createCurriculum(
      String nombre,
      String apellidos,
      String email,
      String numeroTelefonico,
      String direccion,
      String resumen,
      List<Education> educacion,
      List<Experience> experiencia,
      BuildContext context) async {
    print("entrooo");
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final curriculum = CurriculumRequestDto(
        nombre: nombre,
        apellidos: apellidos,
        email: email,
        numeroTelefonico: numeroTelefonico,
        direccion: direccion,
        resumen: resumen,
        education: educacion,
        experience: experiencia);
    final response = await http.post(
        Uri.parse('http://currysapi.somee.com/api/DatosPersonales/agregar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(curriculum));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (context.mounted) {
        userFound = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Haz creado tu Curriculum Vitae'),
              content:
                  const Text('ya puedes Consultar tu curriculum desde la web'),
              actions: [
                TextButton(
                  child: const Text('Entendido'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SecondRoute()));
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error al crear'),
                content: const Text('no se pudo crear tu Curriculum Vitae'),
                actions: [
                  TextButton(
                    child: const Text('Entendido'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }
}
