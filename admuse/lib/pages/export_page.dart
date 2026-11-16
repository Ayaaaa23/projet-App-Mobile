import 'package:flutter/material.dart';

class ExportPage extends StatelessWidget {
  const ExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aperçu et Export'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Fausse pochette de musique
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                ),
                child: Icon(
                  Icons.music_video, 
                  size: 80, 
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              const SizedBox(height: 32),
              
              // Faux lecteur audio
              const Slider(value: 0.3, onChanged: null),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('00:08', style: TextStyle(color: Colors.grey)),
                  Text('00:30', style: TextStyle(color: Colors.grey)),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Bouton Play
              IconButton(
                iconSize: 64,
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.play_circle_fill),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lecture simulée de la publicité...')),
                  );
                },
              ),
              
              const SizedBox(height: 32),
              const Text(
                'Votre publicité est prête !',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Boutons d'export
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Téléchargement du MP3...')),
                        );
                      },
                      label: const Text('Exporter MP3'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Partage vers les réseaux sociaux...')),
                        );
                      },
                      label: const Text('Partager'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              
              // Retour à l'accueil
              TextButton(
                onPressed: () {
                  // Retourne à la toute première page (Login) et efface l'historique
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Terminer et revenir à l\'accueil'),
              )
            ],
          ),
        ),
      ),
    );
  }
}