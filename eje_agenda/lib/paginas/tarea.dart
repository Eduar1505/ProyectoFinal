import 'package:flutter/material.dart';

class Tarea {
  int? id;
  String nombre;
  String descripcion;
  DateTime fecha;
  TimeOfDay hora;
  bool esFavorito;
  bool conNotificacion;
  
  Tarea({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.hora,
    this.esFavorito = false,
    this.conNotificacion = false,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'fecha': fecha.toIso8601String(), // ISO para fechas
      'hora': '${hora.hour.toString().padLeft(2, '0')}:${hora.minute.toString().padLeft(2, '0')}', // Formato HH:mm
      'esFavorito': esFavorito ? 1 : 0,
      'conNotificacion': conNotificacion ? 1 : 0,
    };
  }

  factory Tarea.fromMap(Map<String, dynamic> map) {
    List<String> horaParts = map['hora'].split(':');
    return Tarea(
      id: map['id'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      fecha: DateTime.parse(map['fecha']),
      hora: TimeOfDay(
        hour: int.parse(horaParts[0]),
        minute: int.parse(horaParts[1]),
      ),
      esFavorito: map['esFavorito'] == 1,
      conNotificacion: map['conNotificacion'] == 1,
    );
  }
}