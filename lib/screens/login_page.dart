import 'package:flutter/material.dart';
import 'home_page.dart'; // Importando a HomePage
import 'package:shared_preferences/shared_preferences.dart';  // Para armazenar o token

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  // Função de login local
  Future<void> realizarLogin() async {
    final username = emailController.text;
    final password = senhaController.text;

    // Validação de e-mail (somente @unitins.br permitido)
    if (!username.endsWith('@unitins.br')) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('O e-mail deve ser @unitins.br'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Validação de senha fixa (exemplo: senha é '123456')
    if (password == '123456') {
      // Se o login for bem-sucedido, armazene o token e navegue para a HomePage
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', 'exemplo-de-token'); // Armazenando um token fictício

      // Exibir mensagem de sucesso
      print("Login bem-sucedido!");

      // Navegar para a HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      // Se o login falhar, exibe uma mensagem de erro
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('E-mail ou senha inválidos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.network(
              'https://www.plot.pt/wp-content/uploads/2020/07/imagemheader.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Sombra escura para contraste
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Conteúdo da tela
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Card(
                  elevation: 8,
                  color: Colors.white.withOpacity(0.95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://www.unitins.br/uniPerfil/Logomarca/Imagem/09997c779523a61bd01bb69b0a789242',
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Portal do Aluno',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Acesse utilizando seu e-mail institucional',
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'E-mail (@unitins.br)',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: senhaController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Preciso de Ajuda'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Esqueci minha senha'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF004CBD),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: realizarLogin,
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
