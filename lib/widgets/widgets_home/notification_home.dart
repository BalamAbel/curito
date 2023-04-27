import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/notification.dart';

class notification_home extends StatelessWidget {
  const notification_home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            // Lógica para compartir
            
          },
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            // Lógica para descargar
          },
        ),
      ],
    );
  }
}
