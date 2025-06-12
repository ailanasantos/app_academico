import 'package:flutter/material.dart';
import 'screens/login_page.dart';  // Importando a tela de Login
// Importando a tela inicial (HomePage)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desativa o banner de debug no app
      title: 'Portal do Aluno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // A tela inicial será a LoginPage
      home: const LoginPage(),
    );
  }
}
