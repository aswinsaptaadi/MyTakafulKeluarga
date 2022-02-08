import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulDanaPendidikan extends StatefulWidget {
  @override
  _ProductPersonalTakafulDanaPendidikanState createState() =>
      _ProductPersonalTakafulDanaPendidikanState();
}

class _ProductPersonalTakafulDanaPendidikanState
    extends State<ProductPersonalTakafulDanaPendidikan> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takaful Dana Pendidikan" ${DateTime.now()}'
      ..text = 'Takaful Keluarga Takaful Dana Pendidikan'
      ..html =
          "<h1>Takaful Keluarga Takaful</h1><p>Takaful Dana Pendidikan</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Toast.show("Email sent", context, duration: 3, gravity: Toast.CENTER);
    } catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF1d76bb),
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      // note: BACKDROP
                      Stack(
                        children: [
                          Container(
                            height: 270,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'image/happy-kid-playing-with-toy-airplane-little-asian-boy-enjoy-travel-travel-and-adventure-concept_1384-16-398x170.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 271,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0, 1),
                                    end: Alignment(0, 0.06),
                                    colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0)
                                ])),
                          )
                        ],
                      ),

                      // note: BACK ICON
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 24),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(0.04)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  // note: JUDUL
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                    child: Text(
                      "Takaful Dana Pendidikan",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Kebahagiaan orangtua adalah ketika dapat mengantarkan buah hatinya meraih kesuksesan melalui perencanaan pendidikan yang baik. Biaya pendidikan yang semakin tinggi perlu diantisipasi dengan perencanaan keuangan yang baik supaya hak sang buah hati menikmati pendidikan berkualitas terjamin dan terpenuhi.\n\nTakaful Dana Pendidikan merupakan produk asuransi jiwa syariah yang dikaitkan dengan program tabungan dan dirancang khusus untuk membantu setiap orangtua dalam merencanakan dana pendidikan buah hatinya. Pola penarikan dana disesuaikan dengan kebutuhan biaya untuk setiap jenjang pendidikan mulai dari Taman Kanak-kanak hingga Perguruan Tinggi.\n\nTakaful Dana Pendidikan menghadirkan proteksi finansial bagi keberlangsungan pendidikan sang buah hati hingga Perguruan Tinggi bahkan bilamana orangtua tertimpa musibah meninggal dunia atau cacat tetap total dalam masa perjanjian.",
                      style: googlePoppinsRegular.copyWith(
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                // note: JUDUL
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                    child: Text(
                      "Manfaat",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                    CartList(
                      imageUrl: 'image/buddies.png',
                      food: 'DANA TAHAPAN PENDIDIKAN',
                      place:
                          'Dana tahapan pendidikan akan dibayarkan sesuai dengan kebutuhan untuk setiap jenjang pendidikan sejak Taman Kanak-kanak hingga lulus Perguruan Tinggi.',
                    ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/wheelchair.png',
                    food: 'MANFAAT MENINGGAL DUNIA',
                    place:
                        '100% Manfaat Takaful Dasar, Dana Tahapan Pendidikan, serta Beasiswa Perguruan Tinggi akan dibayarkan jika Peserta (orangtua) meninggal dunia karena kecelakaan.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/heartbeat.png',
                    food: 'MANFAAT CACAT TETAP TOTAL',
                    place:
                        '50% Manfaat Takaful Dasar, Dana Tahapan Pendidikan, serta Beasiswa Perguruan Tinggi akan dibayarkan jika Peserta (orangtua) mengalami cacat tetap total karena kecelakaan.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/barchart.png',                    
                    food: 'SANTUNAN ATAS WAFATNYA ANAK',
                    place:
                        '10% Uang Pertanggungan dan Dana Tabungan Pendidikan yang terbentuk akan dibayarkan jika penerima hibah (anak) meninggal dunia selama polis aktif.',
                  ),
                  SizedBox(height: 10),
                  // note: BUTTON
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: primaryColor,
                      child: Text(
                        "KLIK BILA BERMINAT",
                        style: googlePoppinsRegular.copyWith(
                            fontSize: 16, color: whiteColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.BookNowPage);
                      }),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
    // Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }
}
