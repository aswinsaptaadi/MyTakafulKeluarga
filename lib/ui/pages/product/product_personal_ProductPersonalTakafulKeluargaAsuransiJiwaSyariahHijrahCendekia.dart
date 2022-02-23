import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekia extends StatefulWidget {
  @override
  _ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekiaState createState() =>
      _ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekiaState();
}

class _ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekiaState
    extends State<ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekia> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Takaful Al Khairat Kumpulan ${DateTime.now()}'
      ..text = 'Takaful Al Khairat Kumpulan'
      ..html =
          "<h1>Takaful Al Khairat Kumpulan</h1>";

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
                                        'image/ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekia.jpeg'),
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
                      "Takaful Keluarga Asuransi Jiwa Syariah Hijrah Cendekia",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Produk Asuransi Jiwa Syariah Hijrah Cendekia adalah suatu program Asuransi dan Tabungan yang menyediakan pola penarikan dana disesuaikan dengan kebutuhan dana terkait biaya pendidikan anak (Penerima Hibah) serta memberikan manfaat berupa pembayaran santunan kepada ahli waris apabila Peserta ditakdirkan Meninggal Dunia atau Cacat Tetap Total dalam periode akad. Merupakan produk asuransi jiwa syariah hasil kolaborasi Takaful Keluarga dengan Bank Muamalat Indonesia yang dirancang khusus untuk perencanaan dana pendidikan anak. Asuransi Hijrah Cendekia dapat diperoleh di kantor cabang Bank Muamalat seluruh Indonesia.",
                      style: googlePoppinsRegular.copyWith(
                          fontWeight: FontWeight.w400),
                    ),
                  ),
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
                        Navigator.pushNamed(context, RouteName.BookNowPageProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekia);
                        // print("CLIK");
                        // sendMail();
                        // context
                        // .bloc<PageBloc>()
                        // .add(GoToSelectSchedulePage(movieDetail));
                      }),
                  //             ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: primaryColor,
                  //     textStyle: googlePoppinsMedium.copyWith(
                  //       color: whiteColor,
                  //       letterSpacing: 0.3,
                  //       fontSize: 14,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: new BorderRadius.circular(
                  //         8.0,
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     'BOOK NOW',
                  //   ),
                  // ),
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
