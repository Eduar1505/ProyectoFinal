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
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white),
        ))
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/start' : (context) => const SplashScreen(),
      },
    );
  }
}
