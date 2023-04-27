// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/perfiles.dart';
import 'package:proyecto_currys/widgets/widgets_home/list_drawer.dart';

class headerWidgetHome extends StatelessWidget {
  const headerWidgetHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InkWell(
                splashColor: const Color.fromARGB(255, 57, 73, 171),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push((MaterialPageRoute(
                      builder: (context) => const perfiles_page())));
                },
                child: Container(
                  color: const Color.fromARGB(255, 57, 73, 171),
                  width: double.infinity,
                  height: 220,
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 110,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                  'http://www.saramusico.com/wp-content/uploads/2016/11/book-profesional-fotos-profesionales0025.jpg'),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        'Jeremi Alonzo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Ver Perfil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white30),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              listDrawer()
            ],
          ),
        ),
      ),
    );
  }
}
