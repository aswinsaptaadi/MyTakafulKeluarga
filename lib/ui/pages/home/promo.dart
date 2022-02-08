import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class Promo extends StatelessWidget {
  final String imageURL;
  final String title;
  final String tgl;

  Promo({this.imageURL, this.title, this.tgl});


  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.only(
          right: 16,
        ),
        child: Container(
          height: sy(100),
          width: sy(185),
          // padding: EdgeInsets.only(
          //   left: 16,
          // ),
          decoration: BoxDecoration(
            color: whiteColor,
            image: DecorationImage(
                  image: AssetImage(imageURL),
                  fit: BoxFit.cover),
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
          ),
          child: Container(
            height: sy(100),
              width: sy(185),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                // Container(
                //   height: sy(20),
                //   width: sy(80),
                //   decoration: BoxDecoration(
                //     color: Color(0xFF1d76bb),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(
                //         8.0,
                //       ),
                //     ),
                //   ),
                //   alignment: Alignment.center,
                //   child: Text(
                //     'BUY NOW',
                //     style: googlePoppinsMedium.copyWith(
                //       fontSize: 8,
                //       color: Color(0xFFFFFFFF),
                //     ),
                //   ),
                // ),
                
                Text(
                  title,
                  style: googlePoppinsMedium.copyWith(
                    fontSize: 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  tgl,
                  style: googlePoppinsRegular.copyWith(
                    fontSize: 10,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
      
    );
  }
}