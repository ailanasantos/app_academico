import 'package:flutter/material.dart';
import '../services/analise_curricular_service.dart';  // Certifique-se de importar o serviço de Análise Curricular

class AnaliseCurricularPage extends StatefulWidget {
  const AnaliseCurricularPage({super.key});

  @override
  State<AnaliseCurricularPage> createState() => _AnaliseCurricularPageState();
}

class _AnaliseCurricularPageState extends State<AnaliseCurricularPage> {
  late Future<List<dynamic>> analiseCurricular;

  @override
  void initState() {
    super.initState();
    analiseCurricular = AnaliseCurricularService().fetchAnaliseCurricular();  // Consumindo a API para obter a análise curricular
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Análise Curricular'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: analiseCurricular,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final analises = snapshot.data;

          return ListView.builder(
            itemCount: analises?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text('Aluno: ${analises![index]['aluno']}'),
                  subtitle: Text(
                    'Curso: ${analises[index]['curso']} | Progresso: ${analises[index]['progresso']}%',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
