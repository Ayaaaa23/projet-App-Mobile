import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/login_page.dart'; // On importe la page de connexion

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdMuse',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginPage(), // C'est la première page qui s'affiche !
    );
  }
}