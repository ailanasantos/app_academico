import 'package:flutter/material.dart';
import '../models/app_item.dart'; // Certifique-se de que AppItem está importado

class DetalhesAppPage extends StatelessWidget {
  final AppItem app;

  const DetalhesAppPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: Text(app.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.titulo,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004CBD),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  app.descricao,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                // Aqui você pode adicionar mais detalhes ou informações sobre o app
                // Exemplo: Text("Detalhes adicionais do aplicativo..."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
