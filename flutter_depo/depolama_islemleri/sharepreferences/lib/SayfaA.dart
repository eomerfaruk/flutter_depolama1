import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  Future<void> verioku() async{
    var sp = await SharedPreferences.getInstance();
    String ad = sp.getString("ad") ?? "isim yok" ; // sp'nin içinde tuttuğu ad isminde keyin değeri varsa değişkene atar yoksa isim yok stringini atar
    int yas = sp.getInt("yas") ?? 99;
    double boy = sp.getDouble("boy") ?? 9.99;
    bool bekarmi = sp.getBool("bekarmi") ?? false;

    var arkadasliste = sp.getStringList("arkadasliste") ?? null;

    print("ad : $ad");
    print("yaş : $yas");
    print("boy :  $boy");
    print("bekar mı :  $bekarmi");

    for (var a in arkadasliste!){
      print("arkdas : $a");
    }
  }
  Future<void> verisil() async{
    var sp = SharedPreferences.getInstance(); // SharedPreferences yapısına ulaşmak için değişken ürettik  bu yapıda key-value şeklinde tekil key olacak şekilde basit veri depoladık
  }


  // sayfa açldığında bu metot çalışır
  @override
  void initState() {
    super.initState();
    verioku();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



          ],
        ),
      ),

    );
  }
}
