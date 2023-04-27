import 'package:flutter/material.dart';
import 'package:proyecto_currys/widgets/widgets_home/widget_perfil.dart';

class perfiles_page extends StatelessWidget {
  const perfiles_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Text("Perfil",),  
        shadowColor: const Color.fromARGB(255,57,73,171),
        backgroundColor:   const Color.fromARGB(255,57,73,171),
        centerTitle: true,
      ),

        body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const PerfilWidget(),
        ],
        //
      )
    );
  }
}