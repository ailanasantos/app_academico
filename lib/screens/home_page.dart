import 'package:app_academico/screens/analise_curricular.dart';
import 'package:app_academico/screens/grade_curricular.dart';
import 'package:app_academico/screens/situacao_academica.dart';
import 'package:flutter/material.dart';
import 'boletim_page.dart';  // Importando a tela de Boletim
import 'rematricula_page.dart'; // Tela de Rematrícula

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: Row(
          children: [
            Image.network(
              'https://www.unitins.br/uniPerfil/Logomarca/Imagem/09997c779523a61bd01bb69b0a789242',
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text('Portal do Aluno'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Aplicativos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  // Boletim
                  _buildCard(
                    context,
                    title: 'Boletim (Semestre Atual)',
                    description: 'Desempenho nas disciplinas do semestre atual.',
                    onTap: () {
                      // Navegar para a tela de boletim
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BoletimPage()),
                      );
                    },
                  ),
                  // Análise Curricular
                  _buildCard(
                    context,
                    title: 'Análise Curricular',
                    description: 'Análise curricular completa.',
                    onTap: () {
                      // Navegar para a tela de Análise Curricular
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AnaliseCurricularPage()),
                      );
                    },
                  ),
                  // Situação Acadêmica
                  _buildCard(
                    context,
                    title: 'Situação Acadêmica',
                    description: 'Situação acadêmica atual, incluindo pendências.',
                    onTap: () {
                      // Navegar para a tela de Situação Acadêmica
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SituacaoAcademicaPage()),
                      );
                    },
                  ),
                  // Rematrícula
                  _buildCard(
                    context,
                    title: 'Rematrícula Online',
                    description: 'Realize sua rematrícula online de forma rápida.',
                    onTap: () {
                      // Navegar para a tela de Rematrícula
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RematriculaPage()),
                      );
                    },
                  ),
                  // Grade Curricular
                  _buildCard(
                    context,
                    title: 'Grade Curricular',
                    description: 'Consulte a grade curricular do seu curso.',
                    onTap: () {
                      // Navegar para a tela de Grade Curricular
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GradeCurricularPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para construir os cards
  Widget _buildCard(BuildContext context, {required String title, required String description, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border(
            left: BorderSide(
              color: const Color(0xFF004CBD),
              width: 5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(description),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: onTap,
                  child: const Text('Acessar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
