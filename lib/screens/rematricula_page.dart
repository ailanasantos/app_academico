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
      body: const Center(
        child: Text(
          'Aqui estarão as informações de Rematrícula',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
