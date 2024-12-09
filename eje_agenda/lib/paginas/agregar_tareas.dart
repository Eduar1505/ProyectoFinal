import 'package:flutter/material.dart';
import 'package:eje_agenda/database/db_helper.dart';
import 'package:eje_agenda/paginas/tarea.dart';
import 'package:intl/intl.dart';

class AgregarTareas extends StatefulWidget {
  final Tarea? tarea;

  const AgregarTareas({super.key, this.tarea});

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

  
}