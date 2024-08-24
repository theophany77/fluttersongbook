import 'package:flutter/material.dart';

class ChantDetailScreen extends StatelessWidget {
  final Map<String, String> chant;

  ChantDetailScreen({required this.chant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chant['Titre'] ?? 'Détail du chant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre: ${chant['Numero']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Titre: ${chant['Titre']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Paroles: ${chant['Paroles']}'),
            SizedBox(height: 10),
            Text('Tonalité: ${chant['Tonalite']}'),
            SizedBox(height: 10),
            Text('Sorte: ${chant['Sorte']}'),
            SizedBox(height: 10),
            Text('Vitesse: ${chant['Vitesse']}'),
            SizedBox(height: 10),
            Text('Auteur: ${chant['Auteur']}'),
            SizedBox(height: 10),
            Text('Divers: ${chant['Divers']}'),
          ],
        ),
      ),
    );
  }
}
