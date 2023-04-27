// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/configuracion.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/ver_curriculums.dart';
import 'package:proyecto_currys/widgets/skills_seletion.dart';
import 'package:proyecto_currys/widgets/widgets_home/card_home.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class cardsHome extends StatelessWidget {
  const cardsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const innecesario(),
          const SizedBox(
            height: 20,
          ),
          cardHome(
            texto: 'Crear Curriculum',
            icono: Icons.edit_document,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const SecondRoute())),
            ),
          ),
          cardHome(
            texto: 'Ver Curriculums',
            icono: Icons.remove_red_eye_sharp,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DatosPersonalesScreen())),
            ),
          ),
        ],
      ),
    );
  }
}

class innecesario extends StatelessWidget {
  const innecesario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Bienvedid@ a",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Curry's",
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 73, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DatosPersonalesScreen extends StatefulWidget {
  @override
  _DatosPersonalesScreenState createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {
  int _id = 14;
  late Future<Map<String, dynamic>> _datosPersonalesFuture;

  @override
  void initState() {
    super.initState();
    _datosPersonalesFuture = getDatosPersonales(_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mira tu CV'),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 57, 73, 171),
        backgroundColor: const Color.fromARGB(255, 57, 73, 171),
        elevation: 0,

      ),
      
      body: Center(
        
        child: FutureBuilder<Map<String, dynamic>>(
          future: _datosPersonalesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Map<String, dynamic> datosPersonales = snapshot.data!;
              return Card(
                 elevation: 20,
                 color: Color.fromARGB(255, 237, 234, 234),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Currículum Vitae',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${datosPersonales['nombre']} ${datosPersonales['apellidos']}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Email: ${datosPersonales['email']}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  'Número telefónico: ${datosPersonales['numeroTelefonico']}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  'Dirección: ${datosPersonales['direccion']}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 16.0),
                                  Text(
                                  '${datosPersonales['resumen']}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'Educación:',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                ...datosPersonales['educaciones']
                                    .map((educacion) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${educacion['titulo']}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${educacion['institucion']} - ${educacion['fechaInicio']} - ${educacion['fechaFin']}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      SizedBox(height: 8.0),
                                    ],
                                  );
                                }).toList(),
                                SizedBox(height: 16.0),
                                Text(
                                  'Experiencia:',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                ...datosPersonales['experiencias']
                                    .map((experiencia) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${experiencia['puesto']}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${experiencia['company']} - ${experiencia['fechaInicio']} - ${experiencia['fechaFin']}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      SizedBox(height: 8.0),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Image.network(
                                  'http://www.saramusico.com/wp-content/uploads/2016/11/book-profesional-fotos-profesionales0025.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> getDatosPersonales(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  final response = await http.get(
      Uri.parse('http://currysapi.somee.com/api/DatosPersonales/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

  if (response.statusCode == 200) {
    Map<String, dynamic> datosPersonales = jsonDecode(response.body);
    return datosPersonales;
  } else {
    throw Exception('Failed to load data');
  }
}









//  Card(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Nombre: ${datosPersonales['nombre']}'),
//       Text('Apellidos: ${datosPersonales['apellidos']}'),
//       Text('Email: ${datosPersonales['email']}'),
//       Text('Número telefónico: ${datosPersonales['numeroTelefonico']}'),
//       Text('Dirección: ${datosPersonales['direccion']}'),
//       Text('Resumen: ${datosPersonales['resumen']}'),
//       Text('Educación:'),
//       ...datosPersonales['educaciones'].map((educacion) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Institución: ${educacion['institucion']}'),
//             Text('Título: ${educacion['titulo']}'),
//             Text('Área de estudio: ${educacion['areaDeEstudio']}'),
//             Text('Fecha de inicio: ${educacion['fechaInicio']}'),
//             Text('Fecha de fin: ${educacion['fechaFin']}'),
//             Divider(),
//           ],
//         );
//       }).toList(),
//       Text('Experiencia:'),
//       ...datosPersonales['experiencias'].map((experiencia) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Empresa: ${experiencia['company']}'),
//             Text('Puesto: ${experiencia['puesto']}'),
//             Text('Fecha de inicio: ${experiencia['fechaInicio']}'),
//             Text('Fecha de fin: ${experiencia['fechaFin']}'),
//             Divider(),
//           ],
//         );
//       }).toList(),
//     ],
//   ),
// );