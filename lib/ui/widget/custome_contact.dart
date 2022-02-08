import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';

class CustomeContact extends StatelessWidget {
  final String textTitle;
  final String textSubtile;
  final String imageUrl;

  CustomeContact({this.textTitle, this.textSubtile, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          width: 43,
          height: 45,
        ),
        SizedBox(
          width: 27,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textTitle,
              style: googlePoppinsMedium,
            ),
            Text(
              textSubtile,
              style: googlePoppinsRegular,
            ),
          ],
        ),
      ],
    );
  }
}
