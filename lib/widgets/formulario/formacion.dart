// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element, unused_import, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Formacion extends StatefulWidget {
  const Formacion({super.key});

  @override
  State<Formacion> createState() => _FormacionState();
}

class _FormacionState extends State<Formacion> {
  @override
  final formkey = GlobalKey<FormState>();
  final List<TextEditingController> institucion_cotroller = [
    TextEditingController()
  ];
  final List<TextEditingController> grado_controller = [
    TextEditingController()
  ];
  final List<TextEditingController> campo_Estudio_Controller = [
    TextEditingController()
  ];
  final List<TextEditingController> fechaInicio_Controller = [
    TextEditingController()
  ];
  final List<TextEditingController> fechaFin_Controller = [
    TextEditingController()
  ];

  @override
  void initState() {
    super.initState();
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> institucion =
        institucion_cotroller.map((controller) => controller.text).toList();
    List<String> grado =
        grado_controller.map((controller) => controller.text).toList();
    List<String> campoEstudio =
        campo_Estudio_Controller.map((controller) => controller.text).toList();
    List<String> fechaInicioo =
        fechaInicio_Controller.map((controller) => controller.text).toList();
    List<String> fechafiin =
        fechaFin_Controller.map((controller) => controller.text).toList();

    await prefs.setStringList('institucion', institucion);
    await prefs.setStringList('grado', grado);
    await prefs.setStringList('campoEstudio', campoEstudio);
    await prefs.setStringList('fechaInicio2', fechaInicioo);
    await prefs.setStringList('fechafiin2', fechafiin);
  }

  Future<void> datos(BuildContext context) async {
    print("entro");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? institucion = prefs.getStringList('institucion');
    List<String>? grado = prefs.getStringList('grado');
    List<String>? campoEstudio = prefs.getStringList('campoEstudio');
    List<String>? fechaInicioo = prefs.getStringList('fechaInicio');
    List<String>? fechafiin = prefs.getStringList('fechafiin');
    // Imprimir los valores
    print('institucion: $institucion');
    print('localidad: $grado');
    print('campoEstudio: $campoEstudio');
    print('inicio: $fechaInicioo');
    print('fiin: $fechafiin');
  }

  Future<void> clearUserData() async {
    print("eliminooo");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('formacion');
    await prefs.remove('institucion');
    await prefs.remove('localidad');
    await prefs.remove('inicio');
    await prefs.remove('fin');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ...institucion_cotroller.map((isntitucioncontroller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.school, color: Colors.grey),
                      labelText: 'Institucion',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: isntitucioncontroller,
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
                );
              }).toList(),
              SizedBox(
                height: 20,
              ),
              ...grado_controller.map((gradocontroller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.grade, color: Colors.grey),
                      labelText: 'Grado',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: gradocontroller,
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
                );
              }).toList(),
              const SizedBox(
                height: 20,
              ),
              ...campo_Estudio_Controller.map((campoestudiocontroller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon:
                          const Icon(Icons.school_outlined, color: Colors.grey),
                      labelText: 'Campo de Estudio',
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: campoestudiocontroller,
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
                );
              }).toList(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inicio',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...fechaInicio_Controller.map((fechainicioncontroller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                              controller: fechainicioncontroller,
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
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fin',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...fechaFin_Controller.map((fechafincontroller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                              controller: fechafincontroller,
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
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
                      // ignore: deprecated_member_use
                      primary: Color(0xFF494FBF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        institucion_cotroller.add(TextEditingController());
                        grado_controller.add(TextEditingController());
                        campo_Estudio_Controller.add(TextEditingController());
                        fechaInicio_Controller.add(TextEditingController());
                        fechaFin_Controller.add(TextEditingController());
                      });
                    },
                    child: Text("Agregar institución",
                        style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF494FBF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    // ignore: duplicate_ignore
                    onPressed: () {
                      // Borrar los datos en los campos de entrada de texto
                      institucion_cotroller
                          .forEach((controller) => controller.clear());
                      grado_controller
                          .forEach((controller) => controller.clear());
                      campo_Estudio_Controller
                          .forEach((controller) => controller.clear());
                      fechaInicio_Controller
                          .forEach((controller) => controller.clear());
                      fechaFin_Controller
                          .forEach((controller) => controller.clear());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Los datos han sido eliminados')),
                      );

                      // Llamar a la función para eliminar los datos de tu aplicación
                      clearUserData();
                    },
                    child: Text("Eliminar", style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Color(0xFF494FBF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}