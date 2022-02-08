import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/ui/pages/home/home.dart';
import 'package:mytakafulkeluarga/config/route_config.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init("92582ac8-6be7-4e92-800b-a7be4342bbe5", iOSSettings: null);

  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      routes: RouteConfig.routes,
      title: 'My Takaful Keluarga',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePages(),
    );
  }
}