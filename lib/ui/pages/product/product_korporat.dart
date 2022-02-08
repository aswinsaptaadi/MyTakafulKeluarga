import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';


class ProductKorporat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: blackColor,
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                'Chair',
                style: googlePoppinsMedium.copyWith(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              // Image.asset(
              //   'assets/icon_search.png',
              //   width: 24,
              // ),
              // SizedBox(
              //   width: 18,
              // ),
              // Image.asset(
              //   'assets/icon_filter.png',
              //   width: 24,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}