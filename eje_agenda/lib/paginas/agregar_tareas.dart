import 'package:eje_agenda/database/db_helper.dart';
import 'package:eje_agenda/paginas/tarea.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgregarTareas extends StatefulWidget {
  const AgregarTareas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgregarTareasState createState() => _AgregarTareasState();
}

class _AgregarTareasState extends State<AgregarTareas> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  DateTime? _fechaSeleccionada;
  TimeOfDay? _horaSeleccionada;
  bool _esFavorito = false;
  bool _conNotificacion = false;

  void _seleccionarFecha() async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (fecha != null) {
      setState(() {
        _fechaSeleccionada = fecha;
      });
    }
  }

  void _seleccionarHora() async {
    TimeOfDay? hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (hora != null) {
      setState(() {
        _horaSeleccionada = hora;
      });
    }
  }

  void _guardarTarea() async {
    String nombre = _nombreController.text.trim();
    String descripcion = _descripcionController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre de la tarea es obligatorio')),
      );
      return;
    }

    if (_fechaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una fecha')),
      );
      return;
    }

    if (_horaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una hora')),
      );
      return;
    }

    final nuevaTarea = Tarea(
      nombre: nombre,
      descripcion: descripcion,
      fecha: _fechaSeleccionada!,
      hora: _horaSeleccionada!,
      esFavorito: _esFavorito,
      conNotificacion: _conNotificacion,
    );

    await DatabaseHelper().insertTarea(nuevaTarea);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarea guardada con éxito')),
    );
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Agregar Tarea')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la tarea',
                border: OutlineInputBorder(),
              ),
              maxLength: 30,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
             Container(
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black), 
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    _fechaSeleccionada == null
                        ? 'Seleccionar fecha'
                        : DateFormat.yMMMd().format(_fechaSeleccionada!),
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(Icons.calendar_today, color: Colors.black),
                  onTap: _seleccionarFecha,
                ),
                ListTile(
                  title: Text(
                    _horaSeleccionada == null
                        ? 'Seleccionar hora'
                        : _horaSeleccionada!.format(context),
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(Icons.access_time, color: Colors.black),
                  onTap: _seleccionarHora,
                ),
                SwitchListTile(
                  title: const Text('Favorito', style: TextStyle(color: Colors.black)),
                  value: _esFavorito,
                  onChanged: (value) {
                    setState(() {
                      _esFavorito = value;
                    });
                  },
                  activeColor: Colors.black,
                ),
                SwitchListTile(
                  title: const Text('Notificaciones', style: TextStyle(color: Colors.black)),
                  value: _conNotificacion,
                  onChanged: (value) {
                    setState(() {
                      _conNotificacion = value;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _guardarTarea,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Guardar Tarea',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}