// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class cardHome extends StatelessWidget {
  const cardHome({
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
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(25),
      child: InkWell(
        onTap: () {
          onTap();
        },
        splashColor:  const Color.fromARGB(255,57,73,171),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  icono,
                  size: 60.0,
                  color:  const Color.fromARGB(255,57,73,171),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:  const Color.fromARGB(255,57,73,171),
                    fontSize: 24,
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
