import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulAlKhairatPlus extends StatefulWidget {
  @override
  _ProductPersonalTakafulAlKhairatPlusState createState() =>
      _ProductPersonalTakafulAlKhairatPlusState();
}

class _ProductPersonalTakafulAlKhairatPlusState
    extends State<ProductPersonalTakafulAlKhairatPlus> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takaful Al Khairat Plus ${DateTime.now()}'
      ..text = 'Takaful Al Khairat Plus'
      ..html =
          "<h1>Takaful Al Khairat Plus</h1>";

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
                                        'image/heart-762564_1920-398x170.jpeg'),
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
                      "Takaful Al Khairat Plus",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Kebahagiaan tidak hadir begitu saja tanpa usaha dan perencanaan yang baik untuk mencapainya. Sebagaimana perlunya mempersiapkan payung di musim hujan, dengan asuransi syariah kita dapat meminimalisir dampak finansial akibat terjadinya risiko hidup dan kesehatan di masa depan. Asuransi syariah juga mewujudkan hubungan tolong-menolong di antara peserta. Setiap peserta berperan membantu meringankan beban finansial atas musibah yang dialami peserta lainnya. Takaful Al Khairat Plus merupakan produk asuransi jiwa syariah yang memberikan manfaat berupa pembayaran santunan kepada penerima manfaat (ahli waris) apabila peserta meninggal dunia dalam masa perjanjian dengan pilihan tambahan manfaat asuransi kesehatan bagi peserta.",
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
                    food: 'SANTUNAN MENINGGAL DUNIA',
                    place:
                        '100% Manfaat Takaful Dasar akan dibayarkan jika Peserta meninggal dunia dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/hospital.png',
                    food: 'RIDER FAMILY HOSPITAL PLAN',
                    place:
                        'Manfaat tambahan berupa penggantian biaya yang timbul dari pelayanan dan perawatan peserta (rawat inap dan rawat jalan) yang diperlukan secara medis dengan biaya yang wajar dan dengan maksimum penggantian biaya.',
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
                        Navigator.pushNamed(context, RouteName.BookNowPageTakafulAlKhairatPlus);
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
