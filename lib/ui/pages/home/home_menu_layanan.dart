import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/shalat/shalat_arguments.dart';
import 'package:relative_scale/relative_scale.dart';

class HomeMenuLayanan extends StatelessWidget {
  final String nameCity;
  final String dateTime;
  final String time;
  final String dateTimeHijri;

  const HomeMenuLayanan({
    Key key,
    @required this.nameCity,
    @required this.dateTime,
    @required this.time,
    @required this.dateTimeHijri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(80),
          // margin: EdgeInsets.only(
          //   top: 24,
          // ),
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.only(
              left: 20,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              menuButton(
                image: 'image/Peduli.png',
                titleName: "PeduliLindungi",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.WelcomeScreen,
                  );
                },
              ),
            ],
          ),   
        );
      }
    );
  }
}


Widget menuButton({
    String image,
    String titleName,
    VoidCallback onTap,
  }) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Padding(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      width: sy(31),//sy(72),
                      height: sy(31),//sy(72),
                    ),
                    Image.asset(
                      image,
                      width: sy(30),
                      height: sy(30),
                    ),
                  ],
                ),
              ),
              // ),
              Container(
                padding: EdgeInsets.only(
                  top: 4,
                ),
                height: sy(32),
                child: Text(
                  titleName,
                  style: googlePoppinsRegular.copyWith(
                    fontSize: 10,
                    color: blackColor2,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }