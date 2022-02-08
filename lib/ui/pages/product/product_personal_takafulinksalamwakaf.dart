import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulinkSalamWakaf extends StatefulWidget {
  @override
  _ProductPersonalTakafulinkSalamWakafState createState() =>
      _ProductPersonalTakafulinkSalamWakafState();
}

class _ProductPersonalTakafulinkSalamWakafState
    extends State<ProductPersonalTakafulinkSalamWakaf> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takafulink Salam Wakaf ${DateTime.now()}'
      ..text = 'Takaful Keluarga Takafulink Salam Wakaf'
      ..html =
          "<h1>Takaful Keluarga</h1><p>Takafulink Salam Wakaf</p>";

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
                                        'image/wakaf-398x170.jpeg'),
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
                      "Takafulink Salam Wakaf",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "“Apabila manusia meninggal dunia, maka terputuslah amalnya kecuali tiga perkara: sedekah jariyah (wakaf), ilmu yang diambil manfaatnya, serta anak shalih yang mendo’akannya” (HR. Muslim).\n\nWakaf bukan hanya sedekah biasa. Pahala pewakaf (orang yang berwakaf) akan senantiasa mengalir sepanjang harta yang diwakafkannya terus bermanfaat, meskipun pewakaf telah meninggal dunia. Dengan demikian, wakaf merupakan kesempatan untuk berinvestasi kebaikan di dunia untuk memetik kebahagiaan di akhirat kelak.\n\nTakafulink Salam Wakaf merupakan produk asuransi jiwa yang dikaitkan dengan investasi (unit link) dan dikelola berdasarkan prinsip-prinsip syariah. Di samping menghadirkan manfaat proteksi finansial atas risiko hidup dan dana investasi, Takafulink Salam Wakaf merupakan saran yang tepat untuk mempersiapkan dana wakaf yang diambil prosentase tertentu dari dana investasi dan/atau Manfaat Takaful untuk disalurkan kepada badan pengelola wakaf (Nazhir Wakaf).",
                      style: googlePoppinsRegular.copyWith(
                          fontWeight: FontWeight.w400),
                    ),
                  ),
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
                    food: 'MANFAAT MENINGGAL DUNIA',
                    place:
                        'Minimum 55% Manfaat Takaful Dasar dan 77% Nilai Dana Investasi yang terbentuk akan dibayarkan kepada ahli waris yang ditunjuk jika Peserta meninggal dunia dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/ambulance.png',
                    food: 'MANFAAT WAKAF',
                    place:
                        'Maksimum 45% Manfaat Takaful Dasar dan 33% Nilai Dana Investasi yang terbentuk akan diwakafkan melalui badan pengelola wakaf (Nazhir) yang ditunjuk jika Peserta meninggal dunia dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/barchart.png',
                    food: 'MANFAAT INVESTASI',
                    place:
                        'Minimum 77% Nilai Dana Investasi yang terbentuk dibayarkan kepada Peserta dan maksimum 33% Nilai Dana Investasi diserahkan kepada badan pengelola wakaf (nazhir) jika Peserta hidup hingga tanggal berakhirnya Polis.',
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
                        Navigator.pushNamed(context, RouteName.BookNowPageSalamWakaf);
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
