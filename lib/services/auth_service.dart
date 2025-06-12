import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api/login/';  // URL da API Django para login

  // Função de login para enviar as credenciais e receber o token JWT
  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'];  // Retorna o token JWT
    } else {
      return null;  // Retorna null se as credenciais forem inválidas
    }
  }
}
