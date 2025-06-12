import 'package:flutter/material.dart';

class RematriculaPage extends StatelessWidget {
  const RematriculaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Rematrícula Online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleção de Disciplinas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Lista de disciplinas para a rematrícula
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
                    trailing: Checkbox(
                      value: false, // Marcar as disciplinas
                      onChanged: (bool? value) {},
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Confirmar Matrícula'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004CBD),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
