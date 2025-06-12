import 'package:flutter/material.dart';

class BoletimPage extends StatelessWidget {
  const BoletimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Boletim - Semestre Atual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lista de Disciplinas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Lista de disciplinas
            ListView.builder(
              itemCount: 5,  // Exemplo, substitua pelo número de disciplinas
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: const Text('Disciplina X'),
                    subtitle: const Text('Nota: 9.0 | Frequência: 85% | Status: Aprovado'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
