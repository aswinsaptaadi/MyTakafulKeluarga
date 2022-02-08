import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/ui/pages/faq/faq_page.dart';
import 'package:mytakafulkeluarga/ui/pages/home/contact_page.dart';
import 'package:mytakafulkeluarga/ui/pages/home/home.dart';
import 'package:mytakafulkeluarga/ui/pages/home/sign_in_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget customeBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: primaryColor,
            fixedColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (value) {
              // print(value);
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: 
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    // bottom: 10,
                  ),
                  child: 
                  Icon(
                    Icons.home,
                    size: 21,
                    // color: currentIndex == 0 ? whiteColor : Color(0xff808191),
                  ),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: 
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    // bottom: 10,
                  ),
                  child: 
                  Icon(
                    Icons.library_books_outlined,
                    size: 20,
                    // color: currentIndex == 1 ? whiteColor : Color(0xff808191),
                  ),
                ),
                label: 'FAQ',
              ),
              BottomNavigationBarItem(
                icon: 
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    // bottom: 10,
                  ),
                  child: 
                  Icon(
                    Icons.contact_phone,
                    size: 20,
                    // color: currentIndex == 2 ? whiteColor : Color(0xff808191),
                  ),
                ),
                label: 'Kontak',
              ),
              BottomNavigationBarItem(
                icon: 
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    // bottom: 10,
                  ),
                  child: 
                  Icon(
                    Icons.person_rounded,
                    size: 18,
                    // color: currentIndex == 3 ? whiteColor : Color(0xff808191),
                  ),
                ),
                label: 'Akun',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePages();
          break;
        case 1:
          return FaqPage();
          break;
        case 2:
          return ContactPage();
          break;
        case 3:
          return SignInPage();
          break;
        default:
          return HomePages();
      }
    }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customeBottomNav(),
      body: body(),
    );
  }
}