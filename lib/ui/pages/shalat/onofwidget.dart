import 'package:flutter/material.dart';

class OnOfWidget extends StatelessWidget {
  // const OnOfWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(25)), 
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
      ),
    );
  }
}