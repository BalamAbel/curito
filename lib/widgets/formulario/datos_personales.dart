// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_local_variable, annotate_overrides, no_leading_underscores_for_local_identifiers, avoid_print, deprecated_member_use, unused_element, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPostCurriculum extends StatefulWidget {
  const FormPostCurriculum({
    super.key,
  });

  @override
  State<FormPostCurriculum> createState() => _FormPostCurriculumState();
}

class _FormPostCurriculumState extends State<FormPostCurriculum> {
  Widget build(BuildContext context) {
    final logger = Logger();
    final formkey = GlobalKey<FormState>();
    final nombresCompleto_ = TextEditingController();
    final apellidosController = TextEditingController();
    final emailPostalController_ = TextEditingController();
    final telefonoController_ = TextEditingController();
    final direccionController_ = TextEditingController();
    // final emailPostalController_ = TextEditingController();
    // final localidadController_ = TextEditingController();
    final descripcionController = TextEditingController();

    final String nombreCompleto = "";
    final String apellidos = "";
    late String email = "";
    late String telefono = "";
    late String direccion = "";
    // late String codigoPostal = "";
    // late String localidaad = "";
    late String descripcion = "";

    @override
    void initState() {
      super.initState();
    }

    Future<void> _checkLoggedIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('nombres', nombresCompleto_.text);
      await prefs.setString('apellidos', apellidosController.text);
      await prefs.setString('telefono', telefonoController_.text);
      await prefs.setString('email', emailPostalController_.text);
      await prefs.setString('direccion', direccionController_.text);
      await prefs.setString('descripcionn', descripcionController.text);
      // Si se encuentra un token, redirigir al usuario a la página de inicio correspondiente
    }

    Future<void> datos(BuildContext context) async {
      print("seccion de datos personales");
      // Leer el token almacenado en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? nombres = prefs.getString('nombres');
      String? apellidos = prefs.getString('apellidos');
      String? email = prefs.getString('email');
      String? telefono = prefs.getString('telefono');
      String? direccion = prefs.getString('direccion');
      // String? codigoPostal = prefs.getString('codigoPostal');
      // String? localidaad = prefs.getString('localidaad');
      String? descripcionn = prefs.getString('descripcionn');

      // Imprimir los valores
      print('nombre: $nombres');
      print('apellidos: $apellidos');
      print('email: $email');
      print('telefono: $telefono');
      print('direccion $direccion');
      // print('codigopostal: $codigoPostal');
      // print('localidad: $localidaad');
      print('Descripcion:$descripcionn');

      // Si se encuentra un token, redirigir al usuario a la página de inicio correspondiente
    }

    Future<void> clearUserData() async {
      print("eliminooo");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('nombres');
      await prefs.remove('apellidos');
      await prefs.remove('telefono');
      await prefs.remove('email');
      await prefs.remove('direccion');
      // await prefs.remove('codigoPostal');
      // await prefs.remove('localidaad');
      await prefs.remove('descripcionn');
    }

    return Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon:
                      const Icon(Icons.person_4_sharp, color: Colors.grey),
                  labelText: 'Nombres',
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
                controller: nombresCompleto_,
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
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon:
                      const Icon(Icons.person_4_sharp, color: Colors.grey),
                  labelText: 'Apellidos',
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
                controller: apellidosController,
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
                height: 20,
              ),
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
                controller: emailPostalController_,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        labelText: 'Telefono',
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 57, 73, 171),
                          ),
                        ),
                      ),
                      controller: telefonoController_,
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
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.directions,
                          color: Colors.grey,
                        ),
                        labelText: 'Direccion',
                        labelStyle: TextStyle(color: Colors.grey[700]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      controller: direccionController_,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //           suffixIcon: const Icon(
              //             Icons.numbers,
              //             color: Colors.grey,
              //           ),
              //           labelText: 'C.Postal',
              //           labelStyle: TextStyle(color: Colors.grey[700]),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: BorderSide(color: Colors.grey),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: BorderSide(
              //               color: const Color.fromARGB(255, 57, 73, 171),
              //             ),
              //           ),
              //         ),
              //         controller: codigoPostalController_,
              //         enableInteractiveSelection: false,
              //         autofocus: false,
              //         autocorrect: false,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Este campo es requerido';
              //           }
              //           return null;
              //         },
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     Expanded(
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //           suffixIcon: const Icon(
              //             Icons.location_city,
              //             color: Colors.grey,
              //           ),
              //           labelText: 'Localidad',
              //           labelStyle: TextStyle(color: Colors.grey[700]),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: BorderSide(color: Colors.grey),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: BorderSide(
              //               color: const Color.fromARGB(255, 57, 73, 171),
              //             ),
              //           ),
              //         ),
              //         controller: localidadController_,
              //         enableInteractiveSelection: false,
              //         autofocus: false,
              //         autocorrect: false,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Este campo es requerido';
              //           }
              //           return null;
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.description, color: Colors.grey),
                  labelText: 'Descripcion',
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                ),
                controller: descripcionController,
                enableInteractiveSelection: false,
                autofocus: false,
                autocorrect: false,
                maxLines: 5, // permite múltiples líneas
                textInputAction: TextInputAction
                    .newline, // agrega un salto de línea al presionar enter
                textAlignVertical: TextAlignVertical.top,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        _checkLoggedIn();
                        datos(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Formulario guardado')),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SecondRoute()));
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error al guardar '),
                                content:
                                    const Text('debes llenar todos los datos'),
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
                    },
                    child: Text("Salvar", style: TextStyle(fontSize: 15)),
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
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      nombresCompleto_.clear();
                      apellidosController.clear();
                      emailPostalController_.clear();
                      telefonoController_.clear();
                      direccionController_.clear();
                      descripcionController.clear();
                      clearUserData();
                      final snackBar = SnackBar(
                        content: Text('Los datos se eliminaron correctamente.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text("Eliminar", style: TextStyle(fontSize: 15)),
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
                ],
              )
            ]),
          ),
        ));
  }
}