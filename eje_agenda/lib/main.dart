import 'package:eje_agenda/paginas/home_page.dart';
import 'package:eje_agenda/paginas/inicio.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/start' : (context) => HomePage(),
      },
    );
  }
}