import 'package:flutter/material.dart';

class GradeCurricularPage extends StatelessWidget {
  const GradeCurricularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Grade Curricular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione o Curso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              items: [
                'Curso 1', 'Curso 2', 'Curso 3'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
              hint: const Text('Selecione o curso'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Períodos e Disciplinas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Lista de períodos e disciplinas
            ListView.builder(
              itemCount: 3,  // Exemplo, substitua pelo número de períodos
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: const Text('Período X'),
                    subtitle: const Text('Disciplinas: A, B, C'),
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
