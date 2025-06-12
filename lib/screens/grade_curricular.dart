import 'package:flutter/material.dart';
import '../services/grade_curricular_service.dart';  // Certifique-se de importar o serviço de Grade Curricular

class GradeCurricularPage extends StatefulWidget {
  const GradeCurricularPage({super.key});

  @override
  State<GradeCurricularPage> createState() => _GradeCurricularPageState();
}

class _GradeCurricularPageState extends State<GradeCurricularPage> {
  late Future<List<dynamic>> gradeCurricular;

  @override
  void initState() {
    super.initState();
    gradeCurricular = GradeCurricularService().fetchGradeCurricular();  // Consumindo a API para obter a grade curricular
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Grade Curricular'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: gradeCurricular,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final grade = snapshot.data;

          return ListView.builder(
            itemCount: grade?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text('Curso: ${grade![index]['curso']}'),
                  subtitle: Text(
                    'Período: ${grade[index]['periodo']}',
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
