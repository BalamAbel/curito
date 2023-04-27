// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class secciones extends StatelessWidget {
  const secciones( {
    required this.texto,
    required this.icono,
    required this.onTap,
    super.key,
  });

  final String texto;
  final IconData icono;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey[300],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          onTap();
        },
        splashColor:  const Color.fromARGB(255,57,73,171),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    icono,
                    size: 25.0,
                    color:  const Color.fromARGB(255,57,73,171),
                  )),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  texto,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255,57,73,171),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
