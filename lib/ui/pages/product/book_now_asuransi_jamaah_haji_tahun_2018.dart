import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
// import 'package:provider/provider.dart';
// import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
// import 'package:shamo/providers/auth_provider.dart';
// import 'package:shamo/theme.dart';
// import 'package:shamo/widgets/loading_button.dart';
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class BookNowPageAsuransiJamaahHajiTahun2018 extends StatefulWidget {
  @override
  _BookNowPageAsuransiJamaahHajiTahun2018State createState() => _BookNowPageAsuransiJamaahHajiTahun2018State();
}

class _BookNowPageAsuransiJamaahHajiTahun2018State extends State<BookNowPageAsuransiJamaahHajiTahun2018> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nomorhpController = TextEditingController(text: '');
  TextEditingController perusahaanController = TextEditingController(text: '');

  

  bool isLoading = false;

  sendMail() async {
    String username = 'it.takafulkeluarga@gmail.com';
    String password = 'T@kaful123';

    final smtpServer = gmail('it.takafulkeluarga@gmail.com', 'T@kaful123');
    final message = Message()
      ..from = Address(username)
      ..recipients.add('aswinsaptaadi.kmi@gmail.com')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'MyApp Takaful Keluarga" ${DateTime.now()}'
      ..text = ''
      ..html = 
          // "<p>Nama = ${nameController.text}</p><p>Nomor HP = ${nomorhpController.text}</p>";
          "<h2>Dear Customer Care,</h2> <p><strong>Assalamualaikum Warahmatullahi Wabarakatuh</strong></p> <p>Mohon hubungi kontak berikut :</p> <table style='border-collapse: collapse;'><tbody><tr><td style='width: 18.9781%;'><strong>Nama</strong></td><td><strong>:</strong></td><td><strong>${nameController.text}</strong></td></tr><tr><td style='width: 18.9781%;'><strong>Nomor HP</strong></td><td><strong>:</strong></td><td><strong>${nomorhpController.text}</strong></td></tr><tr><td style='width: 18.9781%;'><strong>Nama</strong></td><td><strong>:</strong></td><td><strong>${perusahaanController.text}</strong></td></tr><tr><td style='width: 18.9781%;'><strong>Product</strong></td><td><strong>:</strong></td><td><strong>Asuransi Jamaah Haji Tahun 2018</strong></td></tr></tbody></table> <p>Terima Kasih</p> <p>Myapp Takaful Keluarga</p>";

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
    

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Register',
            //   style: googlePoppinsRegular.copyWith(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // SizedBox(
            //   height: 2,
            // ),
            // Text(
            //   'Register',
            //   // style: subtitleTextStyle,
            // ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: googlePoppinsRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: greyColor1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        // style: primaryTextStyle,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                        hintText: 'Nama Lengkap Anda',
                          // hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
   
    Widget nomorhpInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor HP',
              style: googlePoppinsRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
               color: greyColor1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.call_rounded),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        // style: primaryTextStyle,
                        // obscureText: true,
                        controller: nomorhpController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nomor HP Anda',
                          // hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget perusahaanInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Perusahaan',
              style: googlePoppinsRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: greyColor1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        // style: primaryTextStyle,
                        controller: perusahaanController,
                        decoration: InputDecoration.collapsed(
                        hintText: 'Nama Perusahaan Anda',
                          // hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: GestureDetector(onTap: (){
            sendMail();
            Navigator.pushNamed(context, RouteName.SuccessCheckoutPage);
          },
            child: Text(
              'KLIK BILA BERMINAT',
              style: googlePoppinsRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: whiteColor,
              ),
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: googlePoppinsRegular.copyWith(
                fontSize: 12,
              ),
            ),
             Text(
                'Sign In',
                style: googlePoppinsRegular.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              nameInput(),
              nomorhpInput(),
              perusahaanInput(),
              // isLoading ? LoadingButton() : signUpButton(),
              signUpButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
