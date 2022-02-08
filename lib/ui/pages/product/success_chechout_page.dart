// import 'package:airplane/cubit/page_cubit.dart';
// import 'package:airplane/shared/theme.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'image/logoatk-color.png',
                  ),
                ),
              ),
            ),
            Text(
              'Terima Kasih',
              style: googlePoppinsMedium.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Customer Services Kami akan segera menghubungi anda.',
              style: googlePoppinsRegular.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'Kembali Ke Halaman Utama',
              onPressed: () {
                Navigator.pushNamed(context, RouteName.home);
              },
              width: 320,
              margin: EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
