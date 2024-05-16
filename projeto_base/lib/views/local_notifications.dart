// local_notifications.dart
// Construção de uma tela que permite realizar agendamentos de tempo para notificações locais.

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({Key? key}) : super(key: key);

  @override
  State<LocalNotifications> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  final TextEditingController _timeController = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    // Inicializar o plugin de notificações
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  Future<void> _showNotification(String time) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alerta_id',
      'alerta_name',
      channelDescription: 'alerta_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Tempo Definido',
      'O tempo definido foi de $time segundos',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Notificação"),
        content: Text("O tempo definido foi de: ${notificationResponse.payload} segundos"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: const Text('Agendamento de Notificações'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Agendamento de Notificações",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _timeController,
                decoration: const InputDecoration(
                  hintText: 'Digite o tempo em segundos',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                String time = _timeController.text;
                _showNotification(time);
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/tomato.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
