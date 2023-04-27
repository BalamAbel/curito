// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:proyecto_currys/dtos/response/curriculums_responseDto.dart';
import 'package:proyecto_currys/dtos/response/currys_response_dto.dart';
import 'package:proyecto_currys/widgets/widgets_home/notification_home.dart';

class HomeCurriculums extends StatelessWidget {
  final CurrysResponseDto curriculums;
  const HomeCurriculums({super.key, required this.curriculums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Curry`s',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              'Cv Profesional',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            )
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          const notification_home(),
        ],
        shadowColor: Colors.blue[700],
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            alignment: Alignment.topCenter,
            child: Card(
              color: Color.fromARGB(255, 245, 245, 245),
              child: Row(
                mainAxisSize: MainAxisSize.max, // Ajustar el tamaño de la Row
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Centrar verticalmente
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${curriculums.apellidos} ${curriculums.nombre}',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(curriculums.nombre),
                          Text(curriculums.apellidos),
                          Text(curriculums.email),
                          SizedBox(height: 20),
                          Text(
                            curriculums.direccion,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 20),
                          Text(curriculums.educaciones.toString())
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.network(
                        'http://www.saramusico.com/wp-content/uploads/2016/11/book-profesional-fotos-profesionales0025.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 10,
            ),
          ),
        ),
      ),
    );
  }
}
