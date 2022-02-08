import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/screens/main_menu.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/home/home.dart';
import 'package:mytakafulkeluarga/ui/pages/home/main_page.dart';
import 'package:mytakafulkeluarga/ui/shared/color.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Selamat",
              textAlign: TextAlign.center,
              style: googlePoppinsMedium.copyWith(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Text(
            "nilai kamu adalah",
            style: googlePoppinsRegular.copyWith(color: Colors.white, fontSize: 34.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "${widget.score}",
            style: googlePoppinsRegular.copyWith(
              color: Colors.orange,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenu(),
                  ));
            },
            shape: StadiumBorder(),
            color: AppColor.secondaryColor,
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Ulangi Kuis",
              style: googlePoppinsRegular.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height:30,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));
            },
            shape: StadiumBorder(),
            color: AppColor.secondaryColor,
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Kembali Ke Halaman Utama",
              style: googlePoppinsRegular.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
