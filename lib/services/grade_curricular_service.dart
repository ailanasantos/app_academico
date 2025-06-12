import 'dart:convert';
import 'package:http/http.dart' as http;

class GradeCurricularService {
  final String baseUrl = 'http://xxx.xxx.xx/api/grades/';  // Substitua pelo IP da sua máquina

  // Função para buscar a grade curricular
  Future<List<dynamic>> fetchGradeCurricular() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);  // Retorna a lista da grade curricular
    } else {
      throw Exception('Falha ao carregar a grade curricular');
    }
  }
}
