import 'package:flutter/material.dart';
import 'package:proyecto_currys/widgets/formulario/idiomas_form.dart';

class Idiomas extends StatelessWidget {
  const Idiomas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Idioma'),
          centerTitle: true,
          shadowColor: const Color.fromARGB(255, 57, 73, 171),
          backgroundColor: const Color.fromARGB(255, 57, 73, 171),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [const IdiomasForm()],
              )),
        ));
  }
}
