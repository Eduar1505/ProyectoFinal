import 'package:eje_agenda/componentes.dart/botones.dart';
import 'package:eje_agenda/paginas/home_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.event_note, size: 100, color: Colors.blue,),
            const SizedBox(height: 20,),
            const Text('eje agenda', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            const SizedBox(height: 50,),
            
            MyButton(
              onTap: (context) {
              Navigator.push(
               context,
                MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),

          ]
        ),
      ),
    );
  }
}