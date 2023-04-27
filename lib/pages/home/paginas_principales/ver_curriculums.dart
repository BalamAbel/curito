import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proyecto_currys/pages/home/consumo/cardscurrys.dart';
import 'package:proyecto_currys/providers/users_providers.dart';

class Ver_curriculum extends StatelessWidget {
  const Ver_curriculum({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca tu CV'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Mis Curriculums",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Consumer<UserProviders>(
            builder: (context, userProviders, child) => userProviders.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                  
                    child: ListView.builder(
                    itemCount: userProviders.curriculums?.length,
                    itemBuilder: (context, index) {
                      final curriculum = userProviders.curriculums![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.grey[300],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "${curriculum.nombre} ${curriculum.apellidos}"),
                                subtitle: Text("${curriculum.numeroTelefonico} "),

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeCurriculums(
                                        curriculums: curriculum,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Lógica para editar
                                    },
                                    icon: const Icon(Icons.remove_red_eye),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
          )
        ],
      ),
    );
  }
}
