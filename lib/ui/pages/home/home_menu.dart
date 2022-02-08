import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/shalat/shalat_arguments.dart';
import 'package:relative_scale/relative_scale.dart';

class HomeMenu extends StatelessWidget {
  final String nameCity;
  final String dateTime;
  final String time;
  final String dateTimeHijri;

  const HomeMenu({
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
          height: sy(116),
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
                image: 'image/quran.svg',
                titleName: "Al-Qur'an &\nHadits",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.listAlQuran,
                  );
                },
              ),
              menuButton(
                image: 'image/praying.svg',
                titleName: "Jadwal\nSholat",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.listShalat,
                    arguments: ShalatArguments(
                      nameCity: nameCity,
                      dateTime: dateTime,
                      dateTimeHijri: dateTimeHijri,
                      time: time
                    ),
                  );
                },
              ),
              menuButton(
                image: 'image/doa.svg',
                titleName: "Doa-Doa",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.PageDoa,
                  );
                }
              ),
              menuButton(
                image: 'image/masjid.svg',
                titleName: "Arah Kiblat",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.Qiblah,
                  );
                },
              ),
              // menuButton(
              //   image: 'image/pedulilindungi.svg',
              //   titleName: "PeduliLindungi",
              //   onTap: () {
              //     Navigator.pushNamed(
              //     context,
              //     RouteName.WelcomeScreen,
              //     );
              //   },
              // ),
              menuButton(
                image: 'image/ic_chest.svg',
                titleName: "Zakat Penghasilan",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.ZakatProfesiPage,
                  );
                },
              ),
              menuButton(
                image: 'image/sedekah.svg',
                titleName: "Sedekah",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.HalamanSedekah,
                  );
                },
              ),
              menuButton(
                image: 'image/puasa3.svg',
                titleName: "kalender Puasa",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.KalenderImage,
                  );
                },
              ),
              menuButton(
                image: 'image/quiz.svg',
                titleName: "Kuis",
                onTap: () {
                  Navigator.pushNamed(
                  context,
                  RouteName.MainMenu,
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
                      width: sy(61),//sy(72),
                      height: sy(61),//sy(72),
                    ),
                    SvgPicture.asset(
                      image,
                      width: sy(52),
                      height: sy(52),
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