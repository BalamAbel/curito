import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';
import 'package:proyecto_currys/providers/users_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProviders>(
          create: (context) => UserProviders()..getCurriculums(),
        )
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              splash: SizedBox(
                // ignore: sort_child_properties_last
                child: Image.asset(
                  'assets/images/login_splash.png',
                  fit: BoxFit.cover,
                ),
                height: 170,
                width: 160,
              ),
              duration: 3100,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: const LoginPage()),
        );
      },
    );
  }
}
