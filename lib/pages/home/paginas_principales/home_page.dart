// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_currys/pages/home/consumo/cardscurrys.dart';
import 'package:proyecto_currys/providers/users_providers.dart';
import 'package:proyecto_currys/widgets/widgets_home/cards_home.dart';
import 'package:proyecto_currys/widgets/widgets_home/home_drawer.dart';
import 'package:proyecto_currys/widgets/widgets_home/notification_home.dart';

class homePage extends StatefulWidget {
  homeState createState() => homeState();
}

class homeState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
               "Curry's",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              'CV Profesional',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            )
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[ 
          // notification_home(),
        ],
        shadowColor:  const Color.fromARGB(255,57,73,171),
        backgroundColor:  const Color.fromARGB(255,57,73,171),
        elevation: 0,
      ),
      drawer: headerWidgetHome(),
      body: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            cardsHome(),
            
          ]
          //
          ),
    );
  }
}
