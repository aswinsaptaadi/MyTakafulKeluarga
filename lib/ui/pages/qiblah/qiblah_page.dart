import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/ui/widget/loading_indicator.dart';
import 'package:mytakafulkeluarga/ui/widget/qiblah_compas.dart';
import 'package:mytakafulkeluarga/ui/widget/qiblah_maps.dart';

class PageQiblat extends StatelessWidget {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Qiblat"),
        elevation: 0,
        backgroundColor: Color(0xFF1d76bb), //Color(0xff29286C),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.home);
          },
          child: Icon(Icons.arrow_back // add custom icons also
              ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color(0xff29286C),
                // Color(0xffE69ED8),
                Color(0xFF1d76bb),
                Colors.white,
              ],
            ),
          ),
          child: FutureBuilder(
            future: _deviceSupport,
            builder: (_, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();
              if (snapshot.hasError)
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );

              if (snapshot.data)
                return QiblahCompass();
              else
                return QiblahMaps();
            },
          ),
        ),
      ),
    );
  }
}
