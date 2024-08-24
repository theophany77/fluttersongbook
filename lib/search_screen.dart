import 'package:flutter/material.dart';
import 'package:songbook20241/chant_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<dynamic> chants;

  SearchScreen({required this.chants});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController numchantController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController parolesController = TextEditingController();
  final TextEditingController tonaliteController = TextEditingController();
  final TextEditingController sorteController = TextEditingController();
  final TextEditingController vitesseController = TextEditingController();
  final TextEditingController auteurController = TextEditingController();
  final TextEditingController diversController = TextEditingController();

  List<dynamic> searchResults = [];

  void performSearch() {
    String numchant = numchantController.text.toLowerCase();
    String title = titleController.text.toLowerCase();
    String paroles = parolesController.text.toLowerCase();
    String tonalite = tonaliteController.text.toLowerCase();
    String sorte = sorteController.text.toLowerCase();
    String vitesse = vitesseController.text.toLowerCase();
    String auteur = auteurController.text.toLowerCase();
    String divers = diversController.text.toLowerCase();

    setState(() {
      print('Recherche chants length: '+widget.chants.length.toString());
      print('Recherche chants données: '+widget.chants.toString());
/*      searchResults = widget.chants.where((chant) {
        return  (numchant.isEmpty || (chant['Numero'] ?? '').toLowerCase().contains(numchant)) &&
            (title.isEmpty || (chant['Titre'] ?? '').toLowerCase().contains(title)) &&
            (paroles.isEmpty || (chant['Paroles'] ?? '').toLowerCase().contains(paroles)) &&
            (tonalite.isEmpty || (chant['Tonalité'] ?? '').toLowerCase().contains(tonalite)) &&
            (sorte.isEmpty || (chant['Sorte'] ?? '').toLowerCase().contains(sorte)) &&
            (vitesse.isEmpty || (chant['Vitesse'] ?? '').toLowerCase().contains(vitesse)) &&
            (auteur.isEmpty || (chant['Auteur'] ?? '').toLowerCase().contains(auteur)) &&
            (divers.isEmpty || (chant['Divers'] ?? '').toLowerCase().contains(divers));
      }).toList();*/

      searchResults = widget.chants;

      // Afficher un message indiquant le nombre de résultats trouvés
      String message = searchResults.isEmpty
          ? 'Aucun chant trouvé'
          : '${searchResults.length} chant(s) trouvé(s)';

      // Utiliser un SnackBar pour afficher le message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      print('Titre recherché: $title');
      print('Chants trouvés: ${searchResults.map((e) => e['Titre']).toList()}');
      print('Fin recherche');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Chants trouvés: ${searchResults.map((e) => e['Titre']).toList()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche multiple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numchantController,
              decoration: InputDecoration(labelText: 'Numéro'),
            ),
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
              decoration: InputDecoration(labelText: 'Tonalité'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: performSearch,
              child: Text('Rechercher'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]['Titre'] ?? 'Sans titre'),
                    subtitle: Text(searchResults[index]['Tonalité'] ?? 'Sans tonalité'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChantDetailScreen(chant: searchResults[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
