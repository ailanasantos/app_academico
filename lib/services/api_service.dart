import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api/app-items/';  // URL da API Django para listar os aplicativos

  // Função para buscar os aplicativos
  Future<List<dynamic>> fetchAppItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);  // Retorna a lista de aplicativos
    } else {
      throw Exception('Falha ao carregar aplicativos');
    }
  }
}
