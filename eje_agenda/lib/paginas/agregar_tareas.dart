import 'package:flutter/material.dart';

class AgregarTareas extends StatefulWidget {
  const AgregarTareas({super.key});

  @override
  State<AgregarTareas> createState() => _AgregarTareasState();
}

class _AgregarTareasState extends State<AgregarTareas> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      
      // Color de fondo 
      backgroundColor: Colors.black,

      appBar: AppBar(title: const Text('Agregar Tarea' ),centerTitle: true, /*backgroundColor: Colors.black*/ ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero), 
                  label: Text('Nombre'),
                  
                  ),
              ),
              const SizedBox(height: 20,),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero), 
                  label: Text('Descripcion'),
                  ),

              )
            ],

          ),
        ),
    );
  }
}