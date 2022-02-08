import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductKorporatTakafulMedicareGold extends StatefulWidget {
  @override
  _ProductKorporatTakafulMedicareGoldState createState() =>
      _ProductKorporatTakafulMedicareGoldState();
}

class _ProductKorporatTakafulMedicareGoldState
    extends State<ProductKorporatTakafulMedicareGold> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Fulmedicare Gold ${DateTime.now()}'
      ..text = 'Fulmedicare Gold'
      ..html =
          "<h1>Fulmedicare Gold</h1>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Toast.show("Email sent", context,
          duration: 3, gravity: Toast.CENTER);
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
                                        'image/pexels-photo-1289902-398x170.jpeg'),
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
                      "Fulmedicare Gold",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Produk Takaful Kesehatan Kumpulan Fulmedicare Gold adalah suatu program asuransi kesehatan kumpulan (Group Health Insurance) yang merupakan proteksi ekonomi bagi Perusahaan dalam kewajibannya memberikan jaminan kesehatan bagi para karyawan beserta keluarganya sehingga dapat membantu Perusahaan dalam mengendalikan biaya jaminan kesehatan.\n\nDengan konsep syariah yang berdasarkan prinsip ta’awun (tolong menolong), Fulmedicare dapat dirancang sesuai dengan kebutuhan pelanggan dengan memperhatikan batas-batas asuransi.",
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
                    food: 'RAWAT INAP DAN PEMBEDAHAN',
                    place:
                        'Penggantian biaya rawat inap dan pembedahan (in patient) yang mencakup biaya kamar, biaya aneka perawatan, biaya konsultasi dokter, biaya operasi, serta biaya ICU/ICCU.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/ambulance.png',
                    food: 'SANTUNAN RAWAT JALAN',
                    place:
                        'Biaya rawat jalan (out patient) mencakup biaya pemeriksaan dokter umum, biaya pemeriksaan dokter spesialis, biaya pembelian obat-obatan, serta biaya laboratorium dan X-Ray.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/wheelchair.png',
                    food: 'SANTUNAN PERSALINAN',
                    place:
                        'Mencakup biaya kehamilan normal, biaya kehamilan dengan komplikasi, biaya kamar ibu dan bayi, biaya kamar bersalin, biaya melahirkan normal, serta biaya melahirkan dengan operasi.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/heartbeat.png',
                    food: 'SANTUNAN RAWAT GIGI',
                    place:
                        'Mencakup biaya perawatan dokter gigi dengan maksimum penggantian biaya yang dapat disesuaikan dengan kebutuhan.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/stethoscope.png',
                    food: 'SANTUNAN KACAMATA',
                    place:
                        'Mencakup biaya frame dan lensa per tahun dengan maksimum penggantian biaya yang dapat disesuaikan dengan kebutuhan.',
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
                        Navigator.pushNamed(context, RouteName.BookNowPageFulmedicareGold);
                      }),
                  SizedBox(height: 30)
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
