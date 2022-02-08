import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/model/data_care.dart';
import 'package:mytakafulkeluarga/model/model_careonline.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
// import 'package:mytakafulkeluarga/theme/theme_text.dart';
// import 'package:mytakafulkeluarga/ui/widget/custome_contact.dart';
import 'package:mytakafulkeluarga/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return CustomePage(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        scaffold: Scaffold(
          backgroundColor: greyColor1,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 16,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: sy(250),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('image/gedung takaful keluarga.jpg'),
                            fit: BoxFit.cover,
                          ),
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                        child: Container(
                          height: sy(250),
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.61),
                                  Colors.black.withOpacity(0)
                                ]),
                          ),
                          child: SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: sy(250),
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 20,
                                top: 150,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Container(
                                      height: sy(65),
                                      width: sx(245),
                                      child: Image.asset(
                                        'image/logoatk-color.png',
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                // SingleChildScrollView(
                  // child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Card(
                        color: Colors.white,
                        elevation: 6.0,
                        margin: EdgeInsets.only(right: 15.0, left: 15.0),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Layanan Peserta",
                                style: TextStyle(fontSize: 19),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    child: ListView.builder(
                                        padding: EdgeInsets.only(top: 2, left: 1),
                                        shrinkWrap: true,
                                        itemCount: DataCare.itemCount,
                                        itemBuilder: (context, index) {
                                          ModelCareOnline care =
                                              DataCare.getItemCare(index);
                                          return ListTile(
                                            onTap: () {
                                              if (care.nama == "CALL CENTRE") {
                                                print("benarnih");
                                                _launchURL(care);
                                              } 
                                              else if (care.nama == "LAYANAN EMAIL"){
                                                _launchURLEmail();
                                              }
                                              else if (care.nama == "SMS"){
                                                _textMe();
                                              }
                                              else {
                                                print("benarwa");
                                                _launchWA(care.detail);
                                              }
                                            },
                                            title: Text(care.nama, style: TextStyle(color: Color(0xFF1d76bb)),),
                                            subtitle: Text(care.detail),
                                            leading: Image.asset(care.gambar),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                // )
                // Padding(
                //   padding: EdgeInsets.only(left: 24),
                //   child: Text(
                //     'Layanan Peserta',
                //     style: googlePoppinsRegular.copyWith(
                //       color: Color(
                //         0xFF1d76bb,
                //       ),
                //       fontSize: 24,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //     top: 16,
                //   ),
                //   child: CustomeContact(
                //     imageUrl: 'image/call-centre.png',
                //     textTitle: 'CALL CENTRE',
                //     textSubtile: '021-79190005',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //     top: 16,
                //   ),
                //   child: CustomeContact(
                //     imageUrl: 'image/wayes.png',
                //     textTitle: 'LAYANAN WHATSAPP',
                //     textSubtile: '081574774444',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //     top: 16,
                //   ),
                //   child: CustomeContact(
                //     imageUrl: 'image/email.png',
                //     textTitle: 'LAYANAN EMAIL',
                //     textSubtile: 'cs_atk@takaful.com',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //     top: 16,
                //   ),
                //   child: CustomeContact(
                //     imageUrl: 'image/sms.png',
                //     textTitle: 'SMS',
                //     textSubtile: '08118206531',
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 30,
                //     top: 16,
                //   ),
                //   child: CustomeContact(
                //     imageUrl: 'image/wayes.png',
                //     textTitle: 'INFORMASI KHUSUS PRODUK',
                //     textSubtile: '085774420942',
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _launchURL(ModelCareOnline care) async {
    String url = 'tel:${care.detail}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWA(String detail) async {
    //String urlwa = "whatsapp://wa.me/+628118206531/?text=${Uri.parse("sdsds")}";
    String urlwa = "https://api.whatsapp.com/send?phone=+628118206531";
    if (await canLaunch(urlwa)) {
      await launch(urlwa);
    } else {
      throw 'Could not launch $urlwa';
    }
  }

  void _launchURLEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'cs_atk@takaful.com',
    );
    String  url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print( 'Could not launch $url');
    }
  }

  void _textMe() async {
    // Android
    const uri = 'sms:+62 811 820 6531?body=TakafulKeluarga';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:0062-811-820-6531?body=TakafulKeluarga';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}
