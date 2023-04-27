// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/dtos/request/curriculum_request_dto.dart';
import 'package:proyecto_currys/dtos/request/user_login_dto.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_currys/dtos/response/curriculums_responseDto.dart';
import 'package:proyecto_currys/dtos/response/currys_response_dto.dart';
import 'package:proyecto_currys/dtos/response/user_response_registrer.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProviders extends ChangeNotifier {
  final logger = Logger();
  UserLoginDto? _user;
  UserRegistrerResponseDto? _userRegistrerResponseDto;
  bool isLoading = true;
  bool userFound = false;
  UserRegistrerResponseDto? get userRegistrerResponseDto =>
      _userRegistrerResponseDto;
  UserLoginDto? get user => _user;

  List<CurrysResponseDto>? _curriculums;
  List<CurrysResponseDto>? get curriculums => _curriculums;

  Future registrerUser(
      String email, String passwod, BuildContext context) async {
    final registrer_user =
        UserRegistrerResponseDto(email: email, password: passwod);
    final response = await http.post(
        Uri.parse('http://currysapi.somee.com/Currys/Account/Register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(registrer_user));
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (context.mounted) {
        userFound = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Haz creado tu cuenta'),
              content: const Text('Inicia sesion para acceder  Curr`ys CV'),
              actions: [
                TextButton(
                  child: const Text('Entendido'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
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
                title: const Text('Error al registrarse'),
                content: const Text('Error al crear la cuenta'),
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

  Future loginUser(String email, String password, BuildContext context) async {
    final user = UserLoginDto(email: email, password: password);

    final response = await http.post(
      Uri.parse('http://currysapi.somee.com/Currys/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Agregar el token en el encabezado de la solicitud
        'Authorization': 'Bearer ${await getToken()}'
      },
      body: jsonEncode(user),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Obtener el token del cuerpo de la respuesta
      final token = jsonDecode(response.body)['token'];
      print(token); // Imprimir el token en la consola
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      if (context.mounted) {
        userFound = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Iniciado secion con exito')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => homePage()),
        );
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error de inicio de sesión'),
              content: const Text(
                  'La dirección de correo electrónico y/o la contraseña son incorrectos. Inténtalo de nuevo.'),
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

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    return token;
  }

  Future getCurriculums() async {
    final response = await http.get(
      Uri.parse("http://currysapi.somee.com/api/DatosPersonales/14"),
      headers: {
        // Agregar el token en el encabezado de la solicitud
        'Authorization': 'Bearer ${await getToken()}'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      _curriculums = data.map((e) => CurrysResponseDto.fromJson(e)).toList();
      logger.d(_curriculums);
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('fallo la ejecucion');
    }
  }
}
