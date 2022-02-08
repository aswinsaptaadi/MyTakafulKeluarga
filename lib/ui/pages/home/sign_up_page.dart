import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar',
              style: googlePoppinsMedium.copyWith(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Daftar ke aplikasi',
              style: googlePoppinsRegular,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Lengkap',
              style: googlePoppinsRegular.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
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
                      Icons.person,
                      color: Color(0xff1D76BB),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: googlePoppinsRegular.copyWith(fontSize: 12),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nama lengkap anda',
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

    Widget userNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: googlePoppinsRegular.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
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
                      Icons.circle,
                      color: Color(0xff1D76BB),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: googlePoppinsRegular.copyWith(fontSize: 12),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Username anda',
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: googlePoppinsRegular.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
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
                        style: googlePoppinsRegular.copyWith(fontSize: 12),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Alamat email anda',
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

    Widget phoneInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Telp',
              style: googlePoppinsRegular.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
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
                      Icons.phone_android,
                      color: Color(0xff1D76BB),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: googlePoppinsRegular.copyWith(fontSize: 12),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nomor telp anda',
                          hintStyle: googlePoppinsRegular,
                        ),
                        keyboardType: TextInputType.phone,
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
              style: googlePoppinsRegular.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
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
                        style: googlePoppinsRegular.copyWith(fontSize: 12),
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password anda',
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

    Widget signUpButton() {
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
            'Daftar',
            style: googlePoppinsRegular.copyWith(
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
              'Sudah memiliki akun? ',
              style: googlePoppinsMedium.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                'Masuk',
                style: googlePoppinsMedium.copyWith(
                  fontSize: 12,
                  color: Color(0xFF1d76bb),
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
              nameInput(),
              userNameInput(),
              emailInput(),
              phoneInput(),
              passwordInput(),
              signUpButton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
