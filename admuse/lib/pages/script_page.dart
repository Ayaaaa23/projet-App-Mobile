import 'package:flutter/material.dart';
import 'audio_page.dart'; // La page suivante qu'on créera après

class ScriptPage extends StatefulWidget {
  const ScriptPage({super.key});

  @override
  State<ScriptPage> createState() => _ScriptPageState();
}

class _ScriptPageState extends State<ScriptPage> {
  // On simule des données générées par l'IA
  final List<String> _slogans = [
    'L\'excellence à portée de main.',
    'Votre satisfaction, notre priorité.',
    'Vivez l\'expérience AdMuse.',
  ];

  int _selectedSloganIndex = 0;
  String _selectedDuration = '30 secondes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Script IA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Slogans proposés',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Liste des slogans
            ...List.generate(_slogans.length, (index) {
              return Card(
                color: _selectedSloganIndex == index 
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1) 
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: _selectedSloganIndex == index 
                        ? Theme.of(context).colorScheme.primary 
                        : Colors.transparent,
                  ),
                ),
                child: RadioListTile<int>(
                  title: Text(_slogans[index]),
                  value: index,
                  groupValue: _selectedSloganIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedSloganIndex = value!;
                    });
                  },
                ),
              );
            }),

            const SizedBox(height: 24),
            const Text(
              'Durée de la publicité',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedDuration,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              items: ['15 secondes', '30 secondes', '1 minute'].map((String duration) {
                return DropdownMenuItem(value: duration, child: Text(duration));
              }).toList(),
              onChanged: (newValue) {
                setState(() { _selectedDuration = newValue!; });
              },
            ),

            const SizedBox(height: 24),
            const Text(
              'Aperçu du script',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                "[Musique énergique en fond]\n\n"
                "Voix off : Envie de découvrir une nouvelle adresse incontournable ?\n\n"
                "Notre entreprise vous accueille avec le sourire et vous propose des produits d'exception. "
                "Ne ratez pas nos offres exceptionnelles cette semaine !\n\n"
                "Passez nous voir dès aujourd'hui. L'excellence à portée de main !\n\n"
                "[Fin de la musique]",
                style: TextStyle(fontSize: 16, height: 1.5, fontStyle: FontStyle.italic),
              ),
            ),
            
            const SizedBox(height: 32),

            // Bouton suivant
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.mic),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AudioPage()),
                  );
                },
                label: const Text(
                  'Choisir la voix et la musique',
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