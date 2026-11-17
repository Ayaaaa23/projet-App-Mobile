import 'package:flutter/material.dart';
import 'script_page.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  // 1. La clé du formulaire
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  
  String? _selectedSector;
  String? _selectedTone;

  final List<String> _sectors = ['Restauration', 'Commerce', 'Beauté', 'Santé', 'Technologie', 'Autre'];
  final List<String> _tones = ['Chaleureux', 'Humoristique', 'Professionnel', 'Énergique', 'Inspirant'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer ma publicité'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        // 2. On enveloppe avec Form
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Parlez-nous de votre marque',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Remplissez ces quelques informations pour que notre IA génère la publicité parfaite.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // 3. Nom de l'entreprise avec validation
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom de l\'entreprise',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.store),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez entrer le nom de votre entreprise.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description (optionnelle, pas besoin de validator strict)
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description (que faites-vous ?)',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 16),

              // 4. Secteur d'activité avec validation
              DropdownButtonFormField<String>(
                value: _selectedSector,
                decoration: const InputDecoration(
                  labelText: 'Secteur d\'activité',
                  border: OutlineInputBorder(),
                ),
                items: _sectors.map((String sector) {
                  return DropdownMenuItem(value: sector, child: Text(sector));
                }).toList(),
                onChanged: (newValue) {
                  setState(() { _selectedSector = newValue; });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez choisir un secteur.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 5. Ton souhaité avec validation
              DropdownButtonFormField<String>(
                value: _selectedTone,
                decoration: const InputDecoration(
                  labelText: 'Ton de la publicité',
                  border: OutlineInputBorder(),
                ),
                items: _tones.map((String tone) {
                  return DropdownMenuItem(value: tone, child: Text(tone));
                }).toList(),
                onChanged: (newValue) {
                  setState(() { _selectedTone = newValue; });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez choisir un ton.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // 6. Bouton avec vérification
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.auto_awesome),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // On vérifie que tout est rempli avant d'aller plus loin
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ScriptPage()),
                      );
                    }
                  },
                  label: const Text(
                    'Générer le script IA',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}