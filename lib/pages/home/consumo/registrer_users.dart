// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';
import 'package:proyecto_currys/providers/users_providers.dart';

class RegistrerUsers extends StatefulWidget {
  const RegistrerUsers({super.key});

  @override
  State<RegistrerUsers> createState() => _RegistrerUsersState();
}

class _RegistrerUsersState extends State<RegistrerUsers> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    // final name_Controller = TextEditingController();
    final email_Controller = TextEditingController();
    final password_Controller = TextEditingController();
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(top: 20),
              ),
              // ignore: prefer_const_constructors
              Text(
                'Registrate',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: (Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     suffixIcon:
                      //         const Icon(Icons.person_2, color: Colors.grey),
                      //     labelText: 'Nombre Completo',
                      //     labelStyle: TextStyle(color: Colors.grey[700]),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       borderSide: const BorderSide(color: Colors.grey),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       borderSide: BorderSide(
                      //           color: const Color.fromARGB(255, 57, 73, 171)),
                      //     ),
                      //   ),
                      //   controller: name_Controller,
                      //   enableInteractiveSelection: false,
                      //   autofocus: false,
                      //   autocorrect: false,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Este campo es requerido';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.email, color: Colors.grey),
                          labelText: 'Correo Electronico',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 57, 73, 171)),
                          ),
                        ),
                        controller: email_Controller,
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
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.key, color: Colors.grey),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 57, 73, 171)),
                          ),
                        ),
                        controller: password_Controller,
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
                      const SizedBox(height: 200),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<UserProviders>().registrerUser(
                                  // name_Controller.text,
                                  email_Controller.text,
                                  password_Controller.text,
                                  context,
                                );
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: const Text('Registrate'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF494FBF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                          elevation: 5,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "¿Ya tienes una cuenta?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push((MaterialPageRoute(
                              builder: (context) => const LoginPage())));
                        },
                        child: const Text("Inicia Sesion",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 57, 73, 171))),
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
