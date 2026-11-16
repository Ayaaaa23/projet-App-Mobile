import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Le même fond dégradé
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.5,
                colors: [
                  Color(0xFF3D0915),
                  AppColors.darkBackground,
                ],
                stops: [0.0, 0.7],
              ),
            ),
          ),
          
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bouton retour
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    
                    const Icon(Icons.graphic_eq, size: 50, color: AppColors.primaryPink),
                    const SizedBox(height: 12),
                    const Text(
                      'AdMuse',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
                    const Text(
                      'Générateur de publicités audio IA',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 48),

                    const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Entrez votre adresse e-mail pour recevoir un lien de réinitialisation.',
                      textAlign: TextAlign.center,
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
                    const SizedBox(height: 32),

                    // Bouton Envoyer
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // On simule l'envoi et on affiche un message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Un lien de réinitialisation a été envoyé !'),
                              backgroundColor: AppColors.primaryPink,
                            ),
                          );
                          // On retourne à la page de connexion
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Envoyer le lien'),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 48),
                    
                    // Illustration (Enveloppe)
                    Icon(
                      Icons.mark_email_read_outlined, 
                      size: 100, 
                      color: AppColors.primaryPink.withOpacity(0.8),
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
}