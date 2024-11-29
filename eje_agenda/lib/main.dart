import 'package:eje_agenda/paginas/home_page.dart';
import 'package:eje_agenda/paginas/inicio.dart';
// import 'package:eje_agenda/paginas/inicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/start' : (context) => const HomePage(),
      },
    );
  }
}