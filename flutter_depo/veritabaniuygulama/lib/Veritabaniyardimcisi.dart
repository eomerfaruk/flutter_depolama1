import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Veritabaniyardimcisi{

  static final String veritabaniadi = "rehber.sqlite";

  static Future<Database> veritabanierisim()  async{

    // await bekletmemizi sağlar kontrolu yaptıktan sonra işlemler devam eder
    String veritabaniyolu = join(await getDatabasesPath() , veritabaniadi);

    if(await databaseExists(veritabaniyolu)){ // veritabani var olup olmadığını sorgular

      print("veritabani var kopayalamaya gerek yok");

    }else{

      ByteData data = await rootBundle.load("veritabani/$veritabaniadi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

      await File(veritabaniyolu as List<Object>).WriteAsBytes(bytes , flush : true);
    }
    return openDatabase(veritabaniyolu); // veritabanina erişip database türünde vericek
  }


}

