import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// import 'crediantial.dart';

class ProductKorporatAsuransiJamaahHaji extends StatefulWidget {
  @override
  _ProductKorporatAsuransiJamaahHajiState createState() =>
      _ProductKorporatAsuransiJamaahHajiState();
}

class _ProductKorporatAsuransiJamaahHajiState
    extends State<ProductKorporatAsuransiJamaahHaji> {
  sendMail() async {
    String username = 'aswinsaptaadi.kmi@gmail.com';
    String password = 'We651tekm123';

    final smtpServer = gmail('aswinsaptaadi.kmi@gmail.com', 'We651tekm123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Asuransi Jamaah Haji Tahun 2018 ${DateTime.now()}'
      ..text = 'Asuransi Jamaah Haji Tahun 2018'
      ..html =
          "<h1>Asuransi Jamaah Haji Tahun 2018</h1>";

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
                                        'image/2855749f-738a-40f1-8357-209a5f833aaa-398x170.jpeg'),
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
                      "Asuransi Jamaah Haji Tahun 2018",
                      textAlign: TextAlign.center,
                      style: googlePoppinsMedium.copyWith(fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Text(
                      "Asuransi Haji menghadirkan perlindungan finansial terhadap jamaah haji atas musibah yang dapat terjadi selama menjalankan Ibadah Haji. Asuransi Haji telah diatur melalui fatwa Majelis Ulama Indonesia (MUI) nomor 39/DSN-MUI/X/2002 tentang asuransi haji. Dengan adanya Asuransi Haji, jamaah haji memperoleh ketenangan selama menjalankan ibadah haji di tanah suci dan keluarga yang ditinggalkan terhindar dari bencana finansial bilamana musibah datang menghampiri.",
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
                        Navigator.pushNamed(context, RouteName.BookNowPageAsuransiJamaahHajiTahun2018);
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
