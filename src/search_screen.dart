import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController parolesController = TextEditingController();
  final TextEditingController tonaliteController = TextEditingController();
  final TextEditingController sorteController = TextEditingController();
  final TextEditingController vitesseController = TextEditingController();
  final TextEditingController auteurController = TextEditingController();
  final TextEditingController diversController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche multiple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: parolesController,
              decoration: InputDecoration(labelText: 'Paroles'),
            ),
            TextField(
              controller: tonaliteController,
              decoration: InputDecoration(labelText: 'Tonalite'),
            ),
            TextField(
              controller: sorteController,
              decoration: InputDecoration(labelText: 'Sorte'),
            ),
            TextField(
              controller: vitesseController,
              decoration: InputDecoration(labelText: 'Vitesse'),
            ),
            TextField(
              controller: auteurController,
              decoration: InputDecoration(labelText: 'Auteur'),
            ),
            TextField(
              controller: diversController,
              decoration: InputDecoration(labelText: 'Divers'),
            ),
            ElevatedButton(
              onPressed: () {
                // Effectuer la recherche et afficher les résultats
              },
              child: Text('Rechercher'),
            ),
          ],
        ),
      ),
    );
  }
}
