import 'package:flutter/material.dart';
import 'package:proyecto_currys/widgets/formulario/lenguajes_programacion.dart';

class LenguajesProgramacionScreen extends StatelessWidget {
  const LenguajesProgramacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crea Tu curriculum'),
          centerTitle: true,
          shadowColor: Colors.blue[700],
          backgroundColor: Colors.blue[700],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [],
              )),
        ));
  }
}