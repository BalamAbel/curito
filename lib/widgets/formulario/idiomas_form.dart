// ignore_for_file: unused_local_variable, prefer_const_constructors, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdiomasForm extends StatefulWidget {
  const IdiomasForm({super.key});

  @override
  State<IdiomasForm> createState() => _IdiomasFormState();
}

class _IdiomasFormState extends State<IdiomasForm> {
  @override
  final formkey = GlobalKey<FormState>();
  final List<TextEditingController> idiomasControllers = [
    TextEditingController()
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> idiomas =
        idiomasControllers.map((controller) => controller.text).toList();
    await prefs.setStringList('idiomas', idiomas);
  }

  Future<void> datos(BuildContext context) async {
    // ignore: avoid_print
    print("seccion de idiomas");
// Leer el token almacenado en SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? idiomas = prefs.getStringList('idiomas');
    // ignore: avoid_print
    print('idiomas:$idiomas');
  }

  Future<void> clearUserData() async {
    // ignore: avoid_print
    print("eliminooo");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('idiomas');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          ...idiomasControllers.map((idiomaController) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon:
                      const Icon(Icons.speaker_notes, color: Colors.grey),
                  labelText: 'Inserta un idioma',
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
                controller: idiomaController,
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
          const SizedBox(height: 35),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SecondRoute()));
                  } else {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error al guardar '),
                            content: const Text('debes llenar todos los datos'),
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
                    horizontal: 15,
                  ),
                  elevation: 5,
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    idiomasControllers.add(TextEditingController());
                  });
                },
                child: Text("Agregar idioma", style: TextStyle(fontSize: 15)),
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
                onPressed: () {
                  // Borrar los datos en los campos de entrada de texto
                  idiomasControllers
                      .forEach((controller) => controller.clear());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Los datos han sido eliminados')),
                  );

                  // Llamar a la función para eliminar los datos de tu aplicación
                  clearUserData();
                },
                child: Text("Eliminar", style: TextStyle(fontSize: 15)),
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
            ],
          )
        ]),
      ),
    );
  }
}
