import 'package:mytakafulkeluarga/model/model_careonline.dart';

class DataCare {
  static var itemCare = [
    ModelCareOnline("CALL CENTRE", "021 - 79190005",
        "image/call-centre.png"),
    ModelCareOnline("LAYANAN WHATSAPP", "021 - 79190005",
        "image/wayes.png"),
    ModelCareOnline("LAYANAN EMAIL", "cs_atk@takaful.com",
        "image/email.png"),
    // ModelCareOnline("SMS", "08118206531",
    //     "image/sms.png"),
    // ModelCareOnline("INFORMASI KHUSUS PRODUK", "085774420942",
    //     "image/wayes.png"),
  ];

//untuk mengetahui total data yg akan ditampilkan
  static var itemCount = itemCare.length;

  //get item sesuai urutan index
  static ModelCareOnline getItemCare(int index) {
    return itemCare[index];
  }
}