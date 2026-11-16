import 'package:flutter/material.dart';
import 'export_page.dart'; 

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  String _selectedLanguage = 'Français';
  String _selectedVoice = 'Féminine';
  String _selectedMusic = 'Énergétique';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voix et Musique'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Personnalisez l\'audio',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Choix de la langue
            DropdownButtonFormField<String>(
              value: _selectedLanguage,
              decoration: const InputDecoration(
                labelText: 'Langue',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.language),
              ),
              items: ['Français', 'Anglais', 'Arabe'].map((String lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: (val) => setState(() => _selectedLanguage = val!),
            ),
            const SizedBox(height: 24),

            // Choix de la voix
            const Text('Type de voix', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Féminine'),
                    value: 'Féminine',
                    groupValue: _selectedVoice,
                    onChanged: (val) => setState(() => _selectedVoice = val!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Masculine'),
                    value: 'Masculine',
                    groupValue: _selectedVoice,
                    onChanged: (val) => setState(() => _selectedVoice = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Choix de la musique
            DropdownButtonFormField<String>(
              value: _selectedMusic,
              decoration: const InputDecoration(
                labelText: 'Ambiance musicale',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.music_note),
              ),
              items: ['Énergétique', 'Calme', 'Professionnelle', 'Corporate'].map((String music) {
                return DropdownMenuItem(value: music, child: Text(music));
              }).toList(),
              onChanged: (val) => setState(() => _selectedMusic = val!),
            ),
            
            const SizedBox(height: 48),

            // Bouton pour générer l'audio
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.graphic_eq),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // On simule la génération en allant vers la page d'export
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ExportPage()),
                  );
                },
                label: const Text(
                  'Générer la publicité audio',
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