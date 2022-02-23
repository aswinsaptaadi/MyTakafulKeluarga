import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/ui/widget/custome_page.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';

class ProductTakafulBancassurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return CustomePage(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        scaffold: Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: sy(210),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: sy(150),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'image/takafulBancas.jpeg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  // color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                ),
                                child: Container(
                                  height: sy(244),
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
                                        top: 20,
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: whiteColor,
                                                  size: 24,
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.more_vert,
                                              //   color: whiteColor,
                                              //   size: 24,
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // children: [
                                      //   Text(
                                      //     'Product Individu',
                                      //     style: googlePoppinsMedium.copyWith(
                                      //       color: whiteColor,
                                      //       letterSpacing: 0.3,
                                      //       fontSize: 24,
                                      //     ),
                                      //   ),
                                      // ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    // Text(
                                    //   'Jadwal Sholat Hari Ini',
                                    //   style: googlePoppinsMedium.copyWith(
                                    //     color: whiteColor,
                                    //     letterSpacing: 0.3,
                                    //     fontSize: 24,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    // Text(
                                    //   'Sholat Subuh 6 jam 7 menit lagi',
                                    //   style: googlePoppinsMedium.copyWith(
                                    //     color: whiteColor.withOpacity(0.8),
                                    //     letterSpacing: 0.3,
                                    //     fontSize: 14,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: sy(20),
                      left: sy(20),
                      right: sy(20),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: sy(58),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.arrow_back_ios,
                            //   size: 24,
                            //   color: blueColor2,
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Takaful Bancassurance',
                                  style: googlePoppinsMedium.copyWith(
                                    letterSpacing: 0.3,
                                    fontSize: 20,
                                    color: blackColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                // Text(
                                //   'arg.time',
                                //   style: GoogleFonts.poppins(
                                //     fontSize: 10,
                                //     fontWeight: FontWeight.w300,
                                //     color: blackColor1.withOpacity(
                                //       0.6,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            // Icon(
                            //   Icons.arrow_forward_ios,
                            //   size: 24,
                            //   color: blueColor2,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.ProductBancassuranceTakafulPembiayaan);
                      },
                      child: buildTimeShalat(
                        nameShalat: 'Takaful Pembiayaan',  
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.ProductPersonalTakafulKeluargaAsuransiJiwaSyariahHijrahCendekia);
                      },
                      child: buildTimeShalat(
                        nameShalat: 'Takaful Jiwa Syariah Hijrah Cendekia',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildTimeShalat({
    @required String nameShalat,
    // @required String timeShalat,
  }) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: double.infinity,
          height: sy(54),
          decoration: BoxDecoration(
            color: greyColor1,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 16,
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nameShalat,
                style: googlePoppinsMedium.copyWith(
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: primaryColor,
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(
              //       timeShalat,
              //       style: googlePoppinsMedium.copyWith(
              //         fontSize: 16,
              //         letterSpacing: 0.3,
              //         color: blackColor1,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 22,
              //     ),
              //     Container(
              //       height: sy(36),
              //       width: sy(36),
              //       decoration: BoxDecoration(
              //         color: whiteColor,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Icon(
              //         Icons.notifications_none,
              //         color: blueColor,
              //         size: 18,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      },
    );
  }
}
