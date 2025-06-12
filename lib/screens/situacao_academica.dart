import 'package:flutter/material.dart';

class SituacaoAcademicaPage extends StatelessWidget {
  const SituacaoAcademicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Situação Acadêmica'),
      ),
      body: const Center(
        child: Text(
          'Aqui estarão as informações da Situação Acadêmica',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
