import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/kalender/kalenderpuasa.dart';

class KalenderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kalender Puasa',
          style: googlePoppinsMedium.copyWith(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.home);
          },
          child: Icon(
            Icons.arrow_back, color: Colors.black, // add custom icons also
          ),
        ),
      ),
      body: 
      // SizedBox(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        // child: 
        CarouselSlider.builder(
            slideBuilder: (index) {
              return Image.asset(
                'image/atk-$index.jpg',
                fit: BoxFit.contain,
              );
            },
            unlimitedMode: true,
            slideTransform: const CubeTransform(),
            slideIndicator: CircularSlideIndicator(
                indicatorBackgroundColor: Colors.white,
                currentIndicatorColor: Colors.grey[800],
                indicatorBorderColor: Colors.grey[400],
                padding: const EdgeInsets.only(bottom: 32)),
            itemCount: 12),
      // ),

      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Kalender Puasa', style: googlePoppinsMedium.copyWith(fontSize: 16,),
      //   ),
      //   elevation: 0,
      //   backgroundColor: primaryColor,
      //   leading: GestureDetector(
      //       onTap: () {
      //         Navigator.pushNamed(context, RouteName.home);
      //       },
      //       child: Icon(Icons.arrow_back // add custom icons also
      //           ),
      //     ),
      // ),
      // body: new Image.asset(
      //   "image/kalenderpuasa.jpeg",
      //   fit: BoxFit.contain,
      //   height: double.infinity,
      //   width: double.infinity,
      //   alignment: Alignment.center,
      // ),
      // body: SingleChildScrollView(
      //   child: Builder(builder: (BuildContext context) {
      //     return Container(
      //       decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //         colors: [
      //           Color(0xFF1d76bb),
      //           Colors.white,
      //         ],
      //       )
      //     ),
      //       child: Stack(
      //         children: [
      //           // new Image.asset(
      //           //   'image/bg.png',
      //           // ),
      //           Center(
      //             child: Column(
      //               children: <Widget>[
      //                 SizedBox(
      //                   height: 50,
      //                 ),
      //                 // Text(
      //                 //   "Mari Kita Bersedekah",
      //                 //   style: TextStyle(fontSize: 25, color: Colors.white),
      //                 // ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(10.0),
      //                   child: Container(
      //                     child: new Card(
      //                       color: Colors.white,
      //                       elevation: 2.0,
      //                       margin: EdgeInsets.only(right: 15.0, left: 15.0),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(20.0),
      //                         child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: <Widget>[
      //                               Column(
      //                                 children: <Widget>[
      //                                   // Image.asset("image/info_new.jpg"),
      //                                   // SizedBox(
      //                                   //   height: 10,
      //                                   // ),
      //                                   Image.asset("image/kalenderpuasa.jpeg"),
      //                                 ],
      //                               ),
      //                             ]),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 23, right: 23),
      //                   child: Row(
      //                     children: <Widget>[
      //                       Container(
      //                         height: 30,
      //                         child: RaisedButton(
      //                             onPressed: () {
      //                               Navigator.pop(context);
      //                             },
      //                             shape: RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(12)),
      //                             color: Colors.white,
      //                             child: Icon(Icons.arrow_back)),
      //                       ),
      //                       SizedBox(
      //                         width: 20,
      //                       ),
      //                       Flexible(
      //                         child: Container(
      //                           height: 60,
      //                           color: Colors.transparent,
      //                           width: double.infinity,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
