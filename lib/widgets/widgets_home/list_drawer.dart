// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/configuracion.dart';

import 'package:proyecto_currys/pages/home/consumo/login_page.dart';

class listDrawer extends StatelessWidget {
  const listDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            title: const Text('Configuracion'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).push(
                  (MaterialPageRoute(builder: (context) => const config())));
            },
          ),
          ListTile(
            title: const Text('Ayuda'),
            leading: const Icon(Icons.question_answer_rounded),
            onTap: () {
              Navigator.of(context).push(
                  (MaterialPageRoute(builder: (context) => const config())));
            },
          ),
          ListTile(
            title: const Text('Cerrar Sesion'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).push(
                  (MaterialPageRoute(builder: (context) => const LoginPage())));
            },
          ),
        ],
      ),
    );
  }
}
