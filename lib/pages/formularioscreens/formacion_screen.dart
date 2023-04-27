// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_currys/widgets/formulario/formacion.dart';

class FormacionScreen extends StatelessWidget {
  const FormacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Educacion'),
          centerTitle: true,
          shadowColor:  Color.fromARGB(255,57,73,171),
          backgroundColor:Color.fromARGB(255,57,73,171),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [const Formacion()],
              )),
        ));
  }
}
