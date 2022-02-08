import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/screens/quizz_screen.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/shared/color.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Center(
              child: Text(
                "Kuis Islami",
                style: 
                googlePoppinsMedium.copyWith(
                  color: Colors.white,
                  fontSize: 38,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Text(
                "Takaful Keluarga",
                textAlign: TextAlign.center,
                style: googlePoppinsMedium.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 50,),
            // Expanded(
              // child: 
              Center(
                child: RawMaterialButton(
                  onPressed: () {
                    //Navigating the the Quizz Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizzScreen(),
                        ));
                  },
                  shape: StadiumBorder(),
                  fillColor: AppColor.secondaryColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      "Mulai Kuis",
                      style: googlePoppinsMedium.copyWith(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                ),
              ),
            // ),
            SizedBox(height: 70,),
            // Expanded(
              // child: 
             
            // ),
          ],
        ),
      ),
    );
  }
}
