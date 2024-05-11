import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  var tfgirdi = TextEditingController();
  
  Future<void> veriyazma() async{

    var ad = await getApplicationDocumentsDirectory(); // dosya sistemine erişiyoruz

     var uygulamadosyalamayolu = await ad.path; // uygulamada dosyalama nerede yapıılacaksa oraya aktarılsın

     var dosya =  File("$uygulamadosyalamayolu/dosyam.txt"); // belirtilen dosya yoluna belitilen isimde dosya ouşturuldu

    dosya.writeAsStringSync(tfgirdi.text); // textfileddaki bilgiyi alıp dosyaya yazılacak
    tfgirdi.text = "";
  }

  Future<void> veriokuma() async{

    var ad = await getApplicationCacheDirectory();
    try{
      var uygulamadosyalamayolu = await ad.path;
      var dosya = File("$uygulamadosyalamayolu/dosyam.txt");
      String okunanveri = await dosya.readAsString(); // dosyadaki veriyi okur

      tfgirdi.text = okunanveri;
    }catch(e){
      print(e);
    }
  }

  Future<void> verisil() async{

    var ad = await getApplicationDocumentsDirectory();
    var uygulamadosyalamayolu = await ad.path;
    var dosya =  File("$uygulamadosyalamayolu/dosyam.txt");

    if(dosya.existsSync()){ // dosya versa bu blok çalışıcak
      dosya.delete(); // dosya silme
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding : const EdgeInsets.all(8.0),
              child : TextField(
                controller: tfgirdi,
                decoration : InputDecoration(
                  hintText: "metin giriniz",
                ),
              )
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children :[
                ElevatedButton(
                  child : Text("yaz"),
                  onPressed :(){
                    veriyazma();
                    },
                ),
                
                ElevatedButton(onPressed: (){
                  veriokuma();
                },
                    child: Text("Oku")
                ),
                
                ElevatedButton(onPressed: (){
                    verisil();
                },
                    child: Text("Sil"))
                
                
              ]
                
            )

          ],
        ),
      ),

    );
  }
}
