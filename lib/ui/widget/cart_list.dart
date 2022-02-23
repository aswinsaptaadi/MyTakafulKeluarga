import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartList extends StatelessWidget {
  String imageUrl;
  // String iconOne;
  // String amount;
  // String iconTwo;
  String food;
  String place;
  // String pricing;

  CartList(
      {this.imageUrl,
      // this.iconOne,
      // this.amount,
      // this.iconTwo,
      this.food,
      this.place//,
      // this.pricing
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 275,
      decoration: BoxDecoration(
        color: Color(0xFFEDF3F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imageUrl,
                  width: 40,
                  color: Color(0xFF1d76bb),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  food,
                  style: GoogleFonts.poppins(
                    color: Color(0xff191919),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  place,
                  style: GoogleFonts.poppins(
                    color: Color(0xffA3A8B8),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
