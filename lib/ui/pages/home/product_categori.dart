import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/model/product_categori.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class ProductCategori extends StatelessWidget {
  // final String imageURL;
  // final String title;

  // ProductCategori({this.imageURL, this.title});

  final ProductCategoriModel productCategoriModel;

  ProductCategori(this.productCategoriModel);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return GestureDetector(
        onTap: (){
          if(productCategoriModel.id == 1){
            Navigator.pushNamed(
                    context,
                    RouteName.ProductPersonal,
                  );
          } else if(productCategoriModel.id == 2){
            Navigator.pushNamed(
                    context,
                    RouteName.ProductKorporat,
            );
          } else {
            Navigator.pushNamed(
                    context,
                    RouteName.ProductTakafulBancassurance,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Container(
            height: sy(100),
            width: sy(225),
            decoration: BoxDecoration(
              color: whiteColor,
              image: DecorationImage(
                  image: AssetImage(productCategoriModel.picturePath),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            child: Container(
              height: sy(100),
              width: sy(225),
              // padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.61),
                      Colors.black.withOpacity(0)
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    minLeadingWidth: sy(2),
                    title: Text(
                      productCategoriModel.name,
                      style: textFontWeight00.copyWith(
                        fontSize: 18,
                        color: whiteColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                    // subtitle: Text(
                    //   '11 - 20 Desember 2021',
                    //   style: googlePoppinsRegular.copyWith(
                    //     fontSize: 10,
                    //     letterSpacing: 0.3,
                    //     color: blackColor2,
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 24,
                    ),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
