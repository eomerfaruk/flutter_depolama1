import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SayfaA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> verikaydi() async{
    var sp = await SharedPreferences.getInstance();

    sp.setString("ad","ahmet");
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekarmi", true);

    var arkadasliste = <String>[];    // list
    arkadasliste.add("Ece");
    arkadasliste.add("Ali");

    sp.setStringList("arkadasliste", arkadasliste as List<String>);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child:Text("geciş yap"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            )

          ],
        ),
      ),

    );
  }
}
