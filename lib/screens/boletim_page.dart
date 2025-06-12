import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/boletim_service.dart';  // Certifique-se de importar o serviço

class BoletimPage extends StatefulWidget {
  const BoletimPage({super.key});

  @override
  State<BoletimPage> createState() => _BoletimPageState();
}

class _BoletimPageState extends State<BoletimPage> {
  late Future<List<dynamic>> boletins;

  @override
  void initState() {
    super.initState();
    boletins = BoletimService().fetchBoletins();  // Consumir a API para obter os boletins
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004CBD),
        title: const Text('Boletim - Semestre Atual'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: boletins,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final boletins = snapshot.data;

          return ListView.builder(
            itemCount: boletins?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(boletins![index]['nome']),
                  subtitle: Text(
                    'Nota: ${boletins[index]['nota']} | Frequência: ${boletins[index]['frequencia']}% | Status: ${boletins[index]['status']}',
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
