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
      // backgroundColor: Colors.black,

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
              ),
              
              const SizedBox(height: 20,),

              _buildSectionContainer(
                items: [
                  _buildSettingItem(
                    icon: Icons.date_range_outlined,
                    title: 'Fecha: ',
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 18),
                    ),

                  _buildSettingItem(
                    icon: Icons.hourglass_bottom_outlined,
                    title: 'Hora: ',
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 18),
                  ),

                  _buildSettingItem(
                    icon: Icons.heart_broken_outlined,
                    title: 'Favoritos: ',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                  
                ]
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildSectionContainer({required List<Widget> items}){
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(26, 190, 189, 189),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ] 
        ),
        child: Column(children: items),
    );
  }

  Widget _buildSettingItem({required IconData icon, required String title, required Widget trailing}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey,),
              const SizedBox(width: 15,),
              Text(
                title, 
                style: const TextStyle(fontSize: 16, color: Colors.black),

              )
            ],
          ),
          trailing,
        ],
      ),
      );
  }
}