// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_currys/pages/home/consumo/registrer_users.dart';
import 'package:proyecto_currys/providers/users_providers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final formkey = GlobalKey<FormState>();
    final _email_Controller = TextEditingController();
    final _password_Controller = TextEditingController();
    bool _obscureText = true;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/currys.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
              ),
              Text(
                'Inicia Sesion',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: (Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email, color: Colors.grey),
                          labelText: 'Correo',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 57, 73, 171)),
                          ),
                        ),
                        controller: _email_Controller,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        autocorrect: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es requerido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.key, color: Colors.grey),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 57, 73, 171)),
                          ),
                        ),
                        controller: _password_Controller,
                        enableInteractiveSelection: false,
                        autofocus: false,
                        autocorrect: false,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es requerido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<UserProviders>().loginUser(
                                  _email_Controller.text,
                                  _password_Controller.text,
                                  context,
                                );
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: const Text('Iniciar sesión'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF494FBF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "¿No tienes cuenta?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement((MaterialPageRoute(
                                builder: (context) => RegistrerUsers())));
                                
                          },
                          child: const Text(
                            "registrate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 57, 73, 171)),
                          ),
                        ),
                      )
                    ],
                  ),
                ))),
          ),
        ],
      ),
    )));
  }
}