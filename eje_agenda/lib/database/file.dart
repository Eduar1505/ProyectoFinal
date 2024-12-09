import 'package:eje_agenda/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> programarNotificacion({
  required int id,
  required String titulo,
  required String cuerpo,
  required DateTime fechaHora,
}) async {
  const androidDetails = AndroidNotificationDetails(
    'canal_tareas', // ID del canal
    'Tareas', // Nombre del canal
    channelDescription: 'Recordatorios de tareas',
    importance: Importance.high,
    priority: Priority.high,
  );
  var platformDetails = const NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    titulo,
    cuerpo,
    tz.TZDateTime.from(fechaHora, tz.local),
    platformDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
