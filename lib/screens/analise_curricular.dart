import 'package:flutter/material.dart';

class AnaliseCurricularPage extends StatelessWidget {
  const AnaliseCurricularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Análise Curricular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progresso do Curso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Barra de progresso do curso
            const LinearProgressIndicator(
              value: 0.75, // Exemplo de progresso (75%)
              backgroundColor: Colors.grey,
              color: Color(0xFF004CBD),
              minHeight: 10,
            ),
            const SizedBox(height: 16),
            const Text(
              'Disciplinas Concluídas e Pendentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Lista de disciplinas
            ListView.builder(
              itemCount: 5,  // Exemplo, substitua pelo número real de disciplinas
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: const Text('Disciplina X'),
                    subtitle: const Text('Status: Concluída'),
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
