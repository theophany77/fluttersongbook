import 'package:flutter/material.dart';
import 'chant_detail_screen.dart';
import 'search_screen.dart';

class ChantsListScreen extends StatelessWidget {
  final List<dynamic> chants;

  //const ChantsListScreen({super.key, required this.chants});

  ChantsListScreen({super.key, required this.chants});

  //Iterable _chants = chants.map(('Titre'));

  /*[
    {
      "Numero": "1",
      "Titre": "A Dieu soit la gloire",
      "Paroles": "A Dieu soit la gloire (x3), pour les choses qu'Il a faites",
      "Tonalite": "D",
      "Sorte": "Louange",
      "Vitesse": "Lent",
      "Auteur": "USA",
      "Divers": "ras"
    },
    {
      "Numero": "2",
      "Titre": "Jesus Iye",
      "Paroles": "Jesus Iye, you have do it again, Jesus Iye, in your special way. What was impossible, mama, you made possible, Jesus Iye",
      "Tonalite": "D",
      "Sorte": "Louange",
      "Vitesse": "Lent",
      "Auteur": "Nathaniel Bassey",
      "Divers": "ras"
    }
  ];
*/

  //String chants2='Test de ligne pour voir';
  //List<Map<String, String>> chants2=[];
  //chants2=chants.length;

  @override
  Widget build(BuildContext context) {
    print("========= debut print dans chants_list_screen==================");
    print(this.chants);
    this.chants.forEach(print);
    print("========= fin   print dans chants_list_screen==================");

    ListView builder = ListView.builder(
        itemCount: chants.length,
        itemBuilder: (context, index) {
          print('invoking itemBuilder for row ${index}');
          var _chants2 = chants[index];
          return ListTile(
              leading: Text(_chants2["Numero"].toString()),
              title: Text(_chants2["Numero"].toString()),
              subtitle: Text(_chants2["Titre"].toString()),
              trailing: Icon(Icons.arrow_right));
        });
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des chants'),
        ),
        body: new Center(child: builder));
  }
}
