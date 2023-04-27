import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/home_page.dart';

class config extends StatelessWidget {
  const config({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Configuracion"),
        shadowColor: Colors.blue[700],
        backgroundColor: Colors.blue[700],
       elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(15),
            child: SizedBox(
                width: 150,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: const Icon(Icons.privacy_tip,
                          size: 48.0,
                          color: Color.fromARGB(255, 111, 167, 213)),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: const Text(
                            "Condiciones y privacidad",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                  ],
                )),
          ),
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: const EdgeInsets.all(15),
            child: SizedBox(
                width: 150,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: const Icon(Icons.password,
                          size: 48.0,
                          color: Color.fromARGB(255, 111, 167, 213)),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: const Text(
                            "Cambiar Contraseña",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                  ],
                )),
          ),
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: const EdgeInsets.all(15),
            child: SizedBox(
                width: 150,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: const Icon(Icons.phone,
                          size: 48.0,
                          color: Color.fromARGB(255, 111, 167, 213)),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: const Text(
                            "Cambiar telefono",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                  ],
                )),
          ),
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: const EdgeInsets.all(15),
            child: SizedBox(
                width: 150,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: const Icon(Icons.email,
                          size: 48, color: Color.fromARGB(255, 111, 167, 213)),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          child: const Text(
                            "Cambiar correo",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
