import 'package:app_academico/models/app_item.dart';
import 'package:flutter/material.dart';
import 'detalhes_app_page.dart';  // Certifique-se de importar a tela de detalhes
import '../services/api_service.dart';  // Importando o serviço API

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> apps;

  @override
  void initState() {
    super.initState();
    apps = ApiService().fetchAppItems();  // Consumindo a API para obter a lista de aplicativos
  }

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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF004CBD)),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apps,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final apps = snapshot.data;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Aplicativos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: apps!
                        .map(
                          (app) => SizedBox(
                            width: double.infinity,
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
                                      app['titulo'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(app['descricao']),
                                    const SizedBox(height: 12),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {
                                          // Aqui estamos navegando para a página de detalhes
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => DetalhesAppPage(
                                                app: AppItem(
                                                  titulo: app['titulo'],
                                                  descricao: app['descricao'],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('Acessar'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
