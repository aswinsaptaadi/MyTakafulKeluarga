import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/cart_list.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulinkFalahSaving extends StatefulWidget {
  @override
  _ProductPersonalTakafulinkFalahSavingState createState() =>
      _ProductPersonalTakafulinkFalahSavingState();
}

class _ProductPersonalTakafulinkFalahSavingState
    extends State<ProductPersonalTakafulinkFalahSaving> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takaful Falah Saving ${DateTime.now()}'
      ..text = 'Takaful Keluarga - Takaful Falah Saving'
      ..html =
          "<h1>Takaful Keluarga</h1><p>Takaful Falah Saving</p>";

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
                                        'image/falah-02-398x170.jpeg'),
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
                      "Takaful Falah Saving",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Kebahagiaan dan kesejahteraan finansial dapat diraih dengan persiapan dan perencanaan keuangan yang baik. Menabung sedari dini adalah langkah bijak untuk persiapan kebutuhan di kemudian hari.\n\nTetapi memiliki tabungan saja belum cukup. Risiko hidup dan kesehatan di masa depan perlu diantisipasi dengan produk proteksi yang tepat. Sehingga jika terjadi musibah, uang tabungan yang sudah dikumpulkan bertahun-tahun tetap utuh dan tak perlu dikorbankan untuk biaya pengobatan atau dana darurat akibat hilangnya sumber penghasilan.\n\nTakaful Falah Saving merupakan produk asuransi jiwa yang dikaitkan dengan investasi (non-unit link) dengan periode akad minimum 10 tahun yang dikelola berdasarkan prinsip-prinsip syariah. Di samping menghadirkan manfaat utama berupa proteksi finansial atas risiko hidup serta santunan biaya kesehatan, Takaful Falah Saving dirancang khusus agar Anda dapat berinvestasi secara optimal untuk berbagai kebutuhan yang ingin Anda raih di masa depan.",
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
                    food: 'MANFAAT CACAT TETAP TOTAL',
                    place:
                        '100% Manfaat Takaful Dasar dan Nilai Dana Investasi yang terbentuk akan dibayarkan jika Peserta mengalami Cacat Tetap Total dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/heartbeat.png',
                    food: 'SANTUNAN PENYAKIT KRITIS',
                    place:
                        '100% Manfaat Takaful Dasar dan Nilai Dana Investasi yang terbentuk akan dibayarkan jika Peserta terdiagnosa salah satu dari 49 penyakit kritis dalam masa berlakunya Polis.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/stethoscope.png',
                    food: 'SANTUNAN RAWAT INAP',
                    place:
                        'Memberikan santunan harian jika Peserta menjalani rawat inap di Rumah Sakit dengan besaran santunan yang dapat disesuaikan dengan kebutuhan.',
                  ),
                  SizedBox(height: 10),
                  CartList(
                    imageUrl: 'image/barchart.png',
                    food: 'MANFAAT INVESTASI',
                    place:
                        'Nilai Dana Investasi yang terbentuk akan dibayarkan jika Peserta hidup hingga tanggal berakhirnya Polis.',
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
                        Navigator.pushNamed(context, RouteName.BookNowPageFalahSaving);
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
