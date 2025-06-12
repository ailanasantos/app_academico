import 'dart:convert';
import 'package:http/http.dart' as http;

class AnaliseCurricularService {
  final String baseUrl = 'http://xxx.xxx.xx.x/api/analise-curricular/';  // Substitua pelo IP da sua máquina

  // Função para buscar os dados da análise curricular
  Future<List<dynamic>> fetchAnaliseCurricular() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);  // Retorna a lista de análise curricular
    } else {
      throw Exception('Falha ao carregar a análise curricular');
    }
  }
}
