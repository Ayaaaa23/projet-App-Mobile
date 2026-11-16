import 'package:flutter/material.dart';
import 'home_page.dart';
import '../theme/app_theme.dart';
import 'signup_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Un Stack permet de superposer le fond dégradé et le contenu
      body: Stack(
        children: [
          // 1. Le fond dégradé (simule les vagues de lumière)
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.5,
                colors: [
                  Color(0xFF3D0915), // Rouge sombre en haut
                  AppColors.darkBackground, // Noir en bas
                ],
                stops: [0.0, 0.7],
              ),
            ),
          ),
          
          // 2. Le contenu (Formulaire)
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icône Audio (remplace le logo)
                    const Icon(Icons.graphic_eq, size: 64, color: AppColors.primaryPink),
                    const SizedBox(height: 16),
                    
                    // Titres
                    const Text(
                      'AdMuse',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Générateur de publicités audio IA',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 48),

                    // Sous-titre
                    const Text(
                      'Connexion',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Accédez à votre espace AdMuse',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),

                    // Champ E-mail
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Adresse e-mail',
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Champ Mot de passe
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    
                    // Mot de passe oublié
                    Align(
                      alignment: Alignment.centerRight,
                      child:TextButton(
                       onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                             );
                               },
                               child: const Text(
                               'Mot de passe oublié ?',
                             style: TextStyle(color: AppColors.primaryPink),
                          ),
                            ),
                      ),
                    
                    const SizedBox(height: 24),

                    // Bouton Se connecter
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Se connecter'),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Séparateur "ou continuer avec"
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade800)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text('ou continuer avec', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade800)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Boutons Sociaux (Google / Apple)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(Icons.g_mobiledata, () {}),
                        const SizedBox(width: 16),
                        _buildSocialButton(Icons.apple, () {}),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Lien S'inscrire
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Vous n\'avez pas de compte ?', style: TextStyle(color: Colors.grey)),
                        TextButton(
                         onPressed: () {
                          Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => const SignupPage()),
                              );
                                   },
                            child: const Text(
                            'S\'inscrire',
                            style: TextStyle(color: AppColors.primaryPink, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Un petit widget réutilisable pour les boutons sociaux
  Widget _buildSocialButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}