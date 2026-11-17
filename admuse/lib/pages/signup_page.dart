import 'package:flutter/material.dart';
import 'home_page.dart';
import '../theme/app_theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // La clé du formulaire
  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.5,
                colors: [Color(0xFF3D0915), AppColors.darkBackground],
                stops: [0.0, 0.7],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form( // <-- ON AJOUTE LE FORMULAIRE ICI
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Icon(Icons.graphic_eq, size: 50, color: AppColors.primaryPink),
                      const SizedBox(height: 12),
                      const Text('AdMuse', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      const Text('Générateur de publicités audio IA', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 32),
                      const Text('Créer un compte', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 32),

                      // 1. Champ Nom (Obligatoire)
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Nom complet',
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Veuillez entrer votre nom.';
                          }
                          if (value.trim().length < 3) {
                            return 'Le nom doit contenir au moins 3 caractères.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 2. Champ E-mail (Format valide)
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Adresse e-mail',
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre e-mail.';
                          }
                          // Expression régulière pour valider l'email
                          final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!emailRegex.hasMatch(value)) {
                            return 'Format d\'e-mail invalide.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 3. Champ Mot de passe (Maj, Min, Chiffre, Spécial, Taille)
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un mot de passe.';
                          }
                          if (value.length < 8) {
                            return 'Le mot de passe doit faire au moins 8 caractères.';
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Il faut au moins une majuscule.';
                          }
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Il faut au moins une minuscule.';
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Il faut au moins un chiffre.';
                          }
                          if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
                            return 'Il faut au moins un caractère spécial (!@#\$&*~).';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // 4. Champ Confirmer Mot de passe (Doit être identique)
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Confirmer le mot de passe',
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                            onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                          ),
                        ),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Les mots de passe ne correspondent pas.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),

                      // Bouton S'inscrire avec vérification
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // ON VERIFIE SI LE FORMULAIRE EST VALIDE
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const HomePage()),
                                (Route<dynamic> route) => false, 
                              );
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('S\'inscrire'),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Vous avez déjà un compte ?', style: TextStyle(color: Colors.grey)),
                          TextButton(
                            onPressed: () => Navigator.pop(context), 
                            child: const Text('Se connecter', style: TextStyle(color: AppColors.primaryPink, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
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