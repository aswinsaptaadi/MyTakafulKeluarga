import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: googlePoppinsMedium.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Masuk Untuk Melanjutkan',
              style: googlePoppinsMedium,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: googlePoppinsMedium.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/icon_email.png',
                    //   width: 17,
                    // ),
                    Icon(
                      Icons.email,
                      color: Color(0xff1D76BB),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: googlePoppinsMedium,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Alamat email anda ',
                          hintStyle: googlePoppinsRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: googlePoppinsMedium.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/icon_password.png',
                    //   width: 17,
                    // ),
                    Icon(
                      Icons.lock,
                      color: Color(0xff1D76BB),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: googlePoppinsMedium,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password Anda',
                          hintStyle: googlePoppinsRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            'Masuk',
            style: googlePoppinsMedium.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum Punya Akun? ',
              style: googlePoppinsMedium.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteName.SignUpPage);
              },
              child: Text(
                'Daftar',
                style: googlePoppinsMedium.copyWith(
                  fontSize: 12,
                  color: Colors.blue
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
