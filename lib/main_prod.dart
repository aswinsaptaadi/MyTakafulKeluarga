import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytakafulkeluarga/config/app_config.dart';
import 'package:mytakafulkeluarga/global_bloc_observer.dart';
import 'package:mytakafulkeluarga/main.dart';
// import 'package:mytakafulkeluarga/utils/notification_handler.dart';

void main() {
  Constants.setEnvironment(Environment.PROD);
  Bloc.observer = GlobalBlocObserver();

  // initialNotification();
  runApp(MyApp());
}
