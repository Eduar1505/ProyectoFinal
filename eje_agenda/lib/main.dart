import 'package:flutter/material.dart';

import 'package:eje_agenda/paginas/home_page.dart';
import 'package:eje_agenda/paginas/inicio.dart';
import 'package:eje_agenda/paginas/splash.dart';

  void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/start': (context) => const inicio(),
        '/start2': (context) => const HomePage(),
      },
    );
  }
}

