import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';

class KalenderPuasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Builder(builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1d76bb),
                Colors.white,
              ],
            )
          ),
            child: Stack(
              children: [
                // new Image.asset(
                //   'image/bg.png',
                // ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      // Text(
                      //   "Mari Kita Bersedekah",
                      //   style: TextStyle(fontSize: 25, color: Colors.white),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: new Card(
                            color: Colors.white,
                            elevation: 2.0,
                            margin: EdgeInsets.only(right: 15.0, left: 15.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        // Image.asset("image/info_new.jpg"),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        Image.asset("image/kalenderpuasa.jpeg"),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  color: Colors.white,
                                  child: Icon(Icons.arrow_back)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Container(
                                height: 60,
                                color: Colors.transparent,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
