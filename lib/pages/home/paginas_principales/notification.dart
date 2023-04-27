import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: 
        const Text("Notificaciones",),  
        shadowColor: const Color.fromARGB(255,57,73,171),
        backgroundColor:   const Color.fromARGB(255,57,73,171),
        centerTitle: true,
      ),

      body: Column(
        children: const [
          Text('Todos')
        ],
      ),

     
    );
  }
  
}
