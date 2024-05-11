


import 'package:veritabaniuygulama/Kisiler.dart';
import 'package:veritabaniuygulama/Veritabaniyardimcisi.dart';

class Kisilerdao{

  // veritabanındaki satır bilgileri Kisiler nesnesi olarak eşleştirmek
  Future<List<Kisiler>> tumkisiler() async{

    var db = await Veritabaniyardimcisi.veritabanierisim();
    
    List<Map<String , dynamic>> maps = await db.rawQuery("SELECT * FROM KİSİLER");  // sql sorrgusu yapılıp map değişkenine eklemir

    return List.generate(maps.length , (i){
      var satir = maps[i] ;
      return Kisiler(satir["kisi_id"] , satir["kisi_ad"] , satir["kisi_Ad"]);

    });

  }

}

