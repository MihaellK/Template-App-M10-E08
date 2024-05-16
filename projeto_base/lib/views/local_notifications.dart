// local_notifications.dart
// Construção de uma tela que permite realizar agendamentos de tempo para notificações locais.

import 'package:flutter/material.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({Key? key}) : super(key: key);

  @override
  State<LocalNotifications> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  TextEditingController _timeController = TextEditingController();
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
                // Navegar para a tela de agendamento de notificações locais
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