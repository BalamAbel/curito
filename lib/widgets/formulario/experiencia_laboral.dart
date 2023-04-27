// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Experiemncia extends StatefulWidget {
  const Experiemncia({super.key});

  @override
  State<Experiemncia> createState() => _ExperiemnciaState();
}

class _ExperiemnciaState extends State<Experiemncia> {
  final formkey = GlobalKey<FormState>();
  final List<TextEditingController> compania_cotroller = [
    TextEditingController()
  ];
  final List<TextEditingController> posicion_cotroller = [
    TextEditingController()
  ];
  final List<TextEditingController> fecha_inicioo_controller = [
    TextEditingController()
  ];
  final List<TextEditingController> fecha_fiin_Controller = [
    TextEditingController()
  ];
  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> compania =
        compania_cotroller.map((controller) => controller.text).toList();
    List<String> posicion =
        posicion_cotroller.map((controller) => controller.text).toList();
    List<String> fechainicioo =
        fecha_inicioo_controller.map((controller) => controller.text).toList();
    List<String> fechafiiin =
        fecha_fiin_Controller.map((controller) => controller.text).toList();

    await prefs.setStringList('compania', compania);
    await prefs.setStringList('posicion', posicion);
    await prefs.setStringList('fechainicioo1', fechainicioo);
    await prefs.setStringList('fechafiin', fechafiiin);
  }

  Future<void> datos(BuildContext context) async {
    print("entro");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? compania = prefs.getStringList('compania');
    List<String>? posicion = prefs.getStringList('posicion');
    List<String>? fechainicioo = prefs.getStringList('fechainicioo');
    List<String>? fechafiiin = prefs.getStringList('fechafiin');
    // Imprimir los valores
    print('compania: $compania');
    print('posicion: $posicion');
    print('fecha_inicioo: $fechainicioo');
    print('fecha_fiin: $fechafiiin');
  }

  Future<void> clearUserData() async {
    print("eliminooo");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('formacion');
    await prefs.remove('compania');
    await prefs.remove('posicion');
    await prefs.remove('fechainicioo');
    await prefs.remove('fechafiiin');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ...compania_cotroller.map((companiacontroller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon:
                          const Icon(Icons.work_history, color: Colors.grey),
                      labelText: 'compania',
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
                    controller: companiacontroller,
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
              ...posicion_cotroller.map((posicioncontroller) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.work, color: Colors.grey),
                      labelText: 'Posicion',
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
                    controller: posicioncontroller,
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
                          'Fecha inicio',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...fecha_inicioo_controller
                            .map((fechainicioocontroller) {
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
                              controller: fechainicioocontroller,
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
                          'Fecha fin',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ...fecha_fiin_Controller.map((fechafiiincontroller) {
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
                              controller: fechafiiincontroller,
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
                        compania_cotroller.add(TextEditingController());
                        posicion_cotroller.add(TextEditingController());
                        fecha_inicioo_controller.add(TextEditingController());
                        fecha_fiin_Controller.add(TextEditingController());
                      });
                    },
                    child: Text("Agregar Experiencia",
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
                      compania_cotroller
                          .forEach((controller) => controller.clear());
                      posicion_cotroller
                          .forEach((controller) => controller.clear());
                      fecha_inicioo_controller
                          .forEach((controller) => controller.clear());
                      fecha_fiin_Controller
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