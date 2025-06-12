import 'dart:convert';
import 'package:http/http.dart' as http;

class BoletimService {
  final String baseUrl = 'http://xxx.xxx.x.x:8000/api/boletins/';  // URL da API Django para boletins

  // Função para buscar os boletins
  Future<List<dynamic>> fetchBoletins() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);  // Retorna a lista de boletins
    } else {
      throw Exception('Falha ao carregar boletins');
    }
  }
}
