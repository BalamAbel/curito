// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_currys/widgets/formulario/datos_personales.dart';

class CurriculumsPost extends StatelessWidget {
  const CurriculumsPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Datos personales'),
          centerTitle: true,
          shadowColor:  Color.fromARGB(255,57,73,171),
          backgroundColor:Color.fromARGB(255,57,73,171),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
               
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FormPostCurriculum()],
             
              )
              ),
        ));
  }
}
