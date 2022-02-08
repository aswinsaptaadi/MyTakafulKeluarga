import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytakafulkeluarga/constants.dart';
import 'package:mytakafulkeluarga/ui/pages/screens/quiz/quiz_screen.dart';
// import 'package:mytakafulkeluarga/theme/theme_color.dart';
// import 'package:mytakafulkeluarga/theme/theme_text.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('image/bg.png',
          fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,),
          // SvgPicture.asset("image/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1), //2/6
                  Text(
                    "Ayo Main Kuis,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // Text("Enter your informations below"),
                  // Spacer(), // 1/6
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Color(0xFF1C2341),
                  //     hintText: "Full Name",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  // Spacer(), // 1/6
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Ayo Mulai Kuis",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
