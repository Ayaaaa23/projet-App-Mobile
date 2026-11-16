import 'package:flutter/material.dart';
import 'script_page.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  @override
  State<CreateAdPage> createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  
  // Valeurs par défaut pour les menus déroulants
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

            // Nom de l'entreprise
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom de l\'entreprise',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.store),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            TextField(
              controller: _descController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description (que faites-vous ?)',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),

            // Secteur d'activité
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
            ),
            const SizedBox(height: 16),

            // Ton souhaité
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
            ),
            const SizedBox(height: 32),

            // Bouton pour générer
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
                  // Pour l'instant, on navigue vers la page de script (à créer)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ScriptPage()),
                  );
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
    );
  }
}