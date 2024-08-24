import 'package:flutter/material.dart';
import 'chant_detail_screen.dart';
import 'search_screen.dart';

class ChantsListScreen extends StatelessWidget {
  final List<dynamic> chants;

  ChantsListScreen({super.key, required this.chants});

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
          print("type de _chants2");
          print(_chants2.runtimeType.toString());
          return ListTile(
              leading: Text(_chants2["Numero"].toString()),
              title: Text(_chants2["Numero"].toString()),
              subtitle: Text(_chants2["Titre"].toString()),
              trailing: Icon(Icons.arrow_right),
              onTap: ()=> {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => ChantDetailScreen(chant: chants[index]),
          ),
          ),
          });
        });
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des chants'),
        ),
        body: new Center(child: builder));
  }
}
