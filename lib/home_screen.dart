import 'package:flutter/material.dart';
import 'chants_list_screen.dart';
import 'search_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var jsonData;
  bool isLoading = true;

  Future<void> loadChants() async {
    final String response = await rootBundle.loadString('assets/chants.json');
    var data = jsonDecode(response);
    print(data);
    print('Data length: '+data.length.toString());
    print('Data trouvées: '+data.toString());
    //I/flutter ( 5970): Data length: 1
    //I/flutter ( 5970): Data trouvées: {chant: [{Titre: A Dieu soit la gloire, Paroles: A Dieu soit la gloire (x3), pour les choses qu'Il a faites, Tonalite: D, Sorte: Louange, Vitesse: Lent, Auteur: USA, Divers: ras}, {Titre: Jesus Iye, Paroles: Jesus Iye, you have do it again, Jesus Iye, in your special way. What was impossible, mama, you made possible, Jesus Iye, Tonalite: D, Sorte: Louange, Vitesse: Lent, Auteur: Nathaniel Bassey, Divers: ras}, {Titre: Eze ebube, Paroles: Eze ebube, I'm so glad you made me worthy. I can say, I can tell and I know it's ypoiur grace., Tonalite: D, Sorte: Louange, Vitesse: Lent, Auteur: Africa, Divers: ras}, {Titre: Eze ebube, Paroles: Eze ebube, I'm so glad you made me worthy. I can say, I can tell and I know it's ypoiur grace., Tonalite: D, Sorte: Louange, Vitesse: Lent, Auteur: Africa, Divers: ras}, {Titre: Eze ebube, Paroles: Eze ebube, I'm so glad you made me worthy. I can say, I can tell and I know it's ypoiur grace., Tonalite: D, Sorte: Louange, Vitesse: Lent, Auteur: Africa, Divers: ras},

    setState(() {
      //chants = data.map((chant) {
      //return Map<String, String>.from(chant);
      //}).toList();
      jsonData = data;
      print("========== forEach de chants");
      //jsonData.forEach(print);
      isLoading = false;
    });

    print("========== forEach de chants après le setState");
    //jsonData.forEach(print);
  }

  @override
  void initState() {
    super.initState();
    loadChants();
    print('Fin loadChants()');
    //print('Chants trouvés: ${chants.map((e) => e['Titre']).toList()}');
    //print('Chants trouvés: '+jsonData.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("========== forEach de chants dans le Widget build");
    jsonData.forEach(print);
    print(jsonData.runtimeType.toString());
    print ("fin runtimeType");
    // je passe un type List<dynamic>
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChantsListScreen(chants: jsonData),
                      ),
                    );
                  },
                  child: Text('Liste des chants'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(chants: []), // chants sera chargé plus tard
                      ),
                    );
                  },
                  child: Text('Recherche multiple'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset(
                'assets/images/sword.png', // Assurez-vous que l'image est dans le dossier assets
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
