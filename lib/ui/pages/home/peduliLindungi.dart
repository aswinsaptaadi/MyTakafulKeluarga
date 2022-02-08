import 'package:flutter/material.dart';
// import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:mytakafulkeluarga/model/product_categori.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
// import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class PeduliLindungi extends StatelessWidget {
  

  // final ProductCategoriModel productCategoriModel;

  // ProductCategori(this.productCategoriModel);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  _launchURL();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      width: sy(200),//sy(72),
                      height: sy(31),//sy(72),
                    ),
                    Image.asset(
                      'image/126093607.png',
                      color: whiteColor,
                      width: double.infinity,
                      height: sy(61),
                    ),
                  ],
                ),
              ),
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //     top: 4,
              //   ),
              //   height: sy(32),
              //   child: Text(
              //     'Aswin',
              //     style: googlePoppinsRegular.copyWith(
              //       fontSize: 10,
              //       color: blackColor2,
              //       letterSpacing: 0.3,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        );
    });
  }
}

_launchURL() async {
    const url = 'https://www.pedulilindungi.id/login';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }