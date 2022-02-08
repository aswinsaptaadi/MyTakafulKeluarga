import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mytakafulkeluarga/model/product_categori.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/home/home_menu_layanan.dart';
import 'package:mytakafulkeluarga/ui/pages/home/peduliLindungi.dart';
import 'package:mytakafulkeluarga/ui/pages/home/product_categori.dart';
import 'package:mytakafulkeluarga/ui/pages/home/promo.dart';
import 'package:mytakafulkeluarga/ui/widget/custome_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytakafulkeluarga/utils/indonesia_locale.dart';
import 'package:mytakafulkeluarga/ui/pages/home/home_menu.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // String title = "Title";
  // String content = "Content";

  double latitude;
  double longitude;
  String nameCity;
  String nameKecamatan;

  // Fungsi untuk mencari poisisi saat ini
  // Kondisi akan muncul ketika dibuka pertama kali
  // atau ketika menekan tombol refresh
  getLocation() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        getCityLocation(cityLatitude: latitude, cityLongitude: longitude);
        // print(latitude);
        // print(longitude);
        // print("aswin");
      });
    });
  }

  // Fungsi untuk mencari nama kota atau kecamatan
  // berdasarkan latlong yang ada di fungsi getLocation
  getCityLocation({
    double cityLatitude,
    double cityLongitude,
  }) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      cityLatitude,
      cityLongitude,
    );

    Placemark place = placeMarks[0];

    // print(placeMarks);

    setState(() {
      nameCity = place.subAdministrativeArea;
      nameKecamatan = place.locality;
      // print(nameCity);
      // print('aswin');
    });
  }

  // Tanggal
  DateTime now;
  var _hijriTime = HijriCalendar.now();
  String dateNowFormated;

  @override
  void initState() {
    getLocation();
    now = DateTime.now();
    dateNowFormated = DateFormat('yyyy-MM-dd').format(now);
    super.initState();

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      setState(() {
        // title = notification.payload.title;
        // content = notification.payload.body;
      });
    });

    OneSignal.shared.setNotificationOpenedHandler(
        (OSNotificationOpenedResult openedResult) {
      // print("Notifikasi di tab");
    });
  }

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
                      height: sy(150),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: SafeArea(
                        child: Container(
                          width: double.infinity,
                          height: sy(250),
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Container(
                                  height: sy(35),
                                  width: sx(245),
                                  child: Image.asset(
                                    'image/logoatk-color.png',
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              // Container(
                              //   child: Row(
                              //     children: [
                              //       Text(title),
                              //       SizedBox(width: 10,),
                              //       Text(content),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$nameCity',
                                              style:
                                                  googlePoppinsMedium.copyWith(
                                                color: greenColor,
                                                letterSpacing: 0.3,
                                                fontSize: 8,
                                              ),
                                            ),
                                            Text(
                                              '$nameKecamatan',
                                              style:
                                                  googlePoppinsRegular.copyWith(
                                                color: whiteColor,
                                                letterSpacing: 0.3,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        GestureDetector(
                                          onTap: getLocation,
                                          child: Icon(
                                            Icons.refresh,
                                            color: whiteColor,
                                            size: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${_hijriTime.hDay} ${_hijriTime.longMonthName} ${_hijriTime.hYear}',
                                              style:
                                                  googlePoppinsMedium.copyWith(
                                                color: greenColor,
                                                letterSpacing: 0.3,
                                                fontSize: 8,
                                              ),
                                            ),
                                            Text(
                                              formatDate(
                                                now,
                                                [
                                                  DD,
                                                  ', ',
                                                  dd,
                                                  ' ',
                                                  M,
                                                  ' ',
                                                  yyyy
                                                ],
                                                locale: IndonesiaLocale(),
                                              ),
                                              style:
                                                  googlePoppinsRegular.copyWith(
                                                color: whiteColor,
                                                letterSpacing: 0.3,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: sy(5),
                      left: sy(115),
                      child: Container(
                        height: sy(220),
                        width: sy(220),
                        child: Image.asset(
                          'image/segitiga.png',
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: sy(60),
                      right: sy(190),
                      child: Container(
                        height: sy(117),
                        width: sy(113),
                        child: Image.asset(
                          'image/lingkaran.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                PeduliLindungi(),
                Container(
                  // margin: EdgeInsets.only(
                  //   bottom: 16,
                  // ),
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  height: sy(27),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Layanan Islami',
                        style: googlePoppinsMedium.copyWith(
                          fontSize: 16,
                          color: blackColor2,
                        ),
                      ),
                      // Text(
                      //   'Link PeduliLindungi',
                      //   style: googlePoppinsMedium.copyWith(
                      //     fontSize: 14,
                      //     color: blackColor2,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                HomeMenu(
                  nameCity: nameCity,
                  dateTime: dateNowFormated,
                  dateTimeHijri:
                      '${_hijriTime.hDay} ${_hijriTime.longMonthName} ${_hijriTime.hYear}',
                  time: formatDate(
                    now,
                    [DD, ', ', dd, ' ', M, ' ', yyyy],
                    locale: IndonesiaLocale(),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //     bottom: 16,
                //   ),
                //   padding: EdgeInsets.only(
                //     left: 20,
                //   ),
                //   // height: sy(27),
                //   width: double.infinity,
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Link PeduliLindungi',
                //     style: googlePoppinsMedium.copyWith(
                //       fontSize: 18,
                //       color: primaryColor,
                //     ),
                //   ),
                // ),
                // HomeMenuLayanan(
                //   nameCity: nameCity,
                //   dateTime: dateNowFormated,
                //   dateTimeHijri:
                //       '${_hijriTime.hDay} ${_hijriTime.longMonthName} ${_hijriTime.hYear}',
                //   time: formatDate(
                //     now,
                //     [DD, ', ', dd, ' ', M, ' ', yyyy],
                //     locale: IndonesiaLocale(),
                //   ),
                // ),
                
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 16,
                      ),
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      height: sy(27),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ketegori Produk',
                        style: googlePoppinsMedium.copyWith(
                          fontSize: 16,
                          color: blackColor2,
                        ),
                      ),
                    ),
                    Container(
                      height: sy(100),
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: //[

                            mockProductCategoriModels
                                .map((e) => ProductCategori(e))
                                .toList(),

                        // ProductCategori(
                        //   mockProductCategoriModel
                        // ),

                        // ProductCategori(
                        //   imageURL: 'image/takafulCorporate.jpeg',
                        //   title: 'Takaful Korporat',
                        // ),
                        // ProductCategori(
                        //   imageURL: 'image/takafulBancas.jpeg',
                        //   title: 'Takaful Bancessurance',
                        // ),
                        //],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      height: sy(27),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Promo',
                        style: googlePoppinsMedium.copyWith(
                          fontSize: 16,
                          color: blackColor2,
                        ),
                      ),
                    ),
                    Container(
                      height: sy(100),
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Promo(
                            imageURL: "image/promo2.jpeg",
                            title:
                                "Takaful Keluarga Persiapan\n Bulan Ramadhan",
                            tgl: "12 Desember 2021",
                          ),
                          Promo(
                            imageURL: "image/heart-762564_1920-398x170.jpeg",
                            title: "Takaful Keluarga Kesehatan\n Save 20%",
                            tgl: "22 Desember 2021",
                          ),
                          Promo(
                            imageURL: "image/Mecca-2_xL-398x170.jpeg",
                            title: "Takaful Keluarga Persiapan\n Haji",
                            tgl: "30 Desember 2021",
                          ),
                          // Promo(),
                          // Promo(),
                        ],
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
}
