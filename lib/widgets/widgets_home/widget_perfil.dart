// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                color: Colors.white12,
                height:180,
                width:double.infinity,
              ),
              // Image.asset(
              //   'assets/images/fondoAvatar.jpg',
              //   fit: BoxFit.cover,
              //   height: 180,
              //   width: double.infinity,
              // ),
              Positioned(
                bottom: -50.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      'http://www.saramusico.com/wp-content/uploads/2016/11/book-profesional-fotos-profesionales0025.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Column(
            children: [
             ListTile(
                title: const Text(
                  'Cuenta',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading:  Icon(
                  Icons.person_2,
                  size: 30,
                  color: Color.fromARGB(255,57,73,171),
                ),
              ),
              ListTile(
                title: const Text(
                  'cuenta1@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading:  Icon(
                  Icons.mail,
                  size: 30,
                  color: Color.fromARGB(255,57,73,171),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 160),
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   icon: const Icon(Icons.edit, size: 15),
          //   label: const Text(
          //     'Editar Perfil',
          //     style: TextStyle(fontSize: 15),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20),
              
          //     ),
             
          //     padding: const EdgeInsets.symmetric(
          //       vertical: 15,
          //       horizontal: 15,
          //     ),
          //     elevation: 5,
          //   ),
          // ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

