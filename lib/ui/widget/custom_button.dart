// import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key key,
    String this.title,
    this.width = double.infinity,
    this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
        child: Text(
          title,
          style: googlePoppinsRegular.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: whiteColor
          ),
        ),
      ),
    );
  }
}
