// remove_background.dart
// Tela da aplicação que permite o usuário escolher uma imagem, tirar ela com a camera. Enviar essa imagem para o servidor, remover o background e exibir a imagem sem o background. O usuário poderá compartilhar a imagem sem o background.

import 'package:flutter/material.dart';

class RemoveBackground extends StatelessWidget {
  const RemoveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: const Text('Remover de Fundo de Imagens'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Remover de Fundo de Imagens",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            
          ],
        ),
      ),
    );
  }
}