import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulinkSalamCendikia extends StatefulWidget {
  @override
  _ProductPersonalTakafulinkSalamCendikiaState createState() =>
      _ProductPersonalTakafulinkSalamCendikiaState();
}

class _ProductPersonalTakafulinkSalamCendikiaState
    extends State<ProductPersonalTakafulinkSalamCendikia> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takafulink Salam Cendekia ${DateTime.now()}'
      ..text = 'Takafulink Salam Cendekia'
      ..html =
          "<h1>Takaful Keluarga</h1><p>Takafulink Salam Cendekia</p>";

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
                                        'image/book-1760993-398x170.jpeg'),
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
                      "Takafulink Salam Cendekia",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Kebahagiaan orangtua adalah ketika dapat mengantarkan buah hatinya meraih kesuksesan melalui perencanaan pendidikan yang baik. Biaya pendidikan yang semakin tinggi perlu diantisipasi dengan perencanaan keuangan supaya hak sang buah hati menikmati pendidikan berkualitas terjamin dan terpenuhi.\n\nTakafulink Salam Cendekia merupakan produk asuransi jiwa syariah yang dikaitkan dengan investasi (unit link) dan dirancang khusus untuk mempersiapkan biaya pendidikan buah hati Anda. Hasil investasi yang optimal membuat Anda tak perlu risau dengan biaya pendidikan kemanapun sang buah hati berkeinginan untuk menjalani studi, baik di dalam atau di luar negeri.",
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
                        '100% Manfaat Takaful Dasar dan Nilai Dana Investasi yang terbentuk akan dibayarkan jika Peserta meninggal dunia dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/ambulance.png',
                    food: 'MANFAAT KECELAKAAN DIRI',
                    place:
                        '100% Manfaat Takaful Dasar dan Nilai Dana Investasi yang terbentuk akan dibayarkan jika Peserta meninggal dunia karena kecelakaan dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/wheelchair.png',
                    food: 'SANTUNAN BIAYA KESEHATAN',
                    place:
                        'Santunan biaya kesehatan akan dibayarkan senilai dengan plan yang dipilih jika Peserta (anak) menerima tindakan rawat inap di klinik atau rumah sakit.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/heartbeat.png',
                    food: 'PAYOR TERM UNTUK PEMEGANG POLIS',
                    place:
                        'Pembayaran kontribusi akan dilanjutkan Perusahaan sampai dengan masa pembayaran kontribusi berakhir jika Pemegang Polis (orangtua) meninggal dunia dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/stethoscope.png',
                    food: 'PAYOR TPD UNTUK PEMEGANG POLIS',
                    place:
                        'Pembayaran kontribusi akan dilanjutkan Perusahaan sampai dengan masa pembayaran kontribusi berakhir jika Pemegang Polis (orangtua) mengalami Cacat Tetap Total.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/barchart.png',
                    food: 'MANFAAT DANA TAHAPAN PENDIDIKAN',
                    place:
                        'Dana tahapan pendidikan yang diambil dari nilai dana investasi yang terbentuk akan dibayarkan jika Peserta (anak) hidup hingga tanggal berakhirnya Polis.',
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
                        Navigator.pushNamed(context, RouteName.BookNowPageSalamCendikia);
                        
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
