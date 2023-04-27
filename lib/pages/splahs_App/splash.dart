import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/perfiles.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

// ignore: camel_case_types
class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1900), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const  LoginPage(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
