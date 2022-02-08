import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/app_config.dart';
import 'package:mytakafulkeluarga/global_bloc_observer.dart';
import 'package:mytakafulkeluarga/main.dart';

// import 'utils/notification_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();

  // initialNotification();
  Constants.setEnvironment(Environment.DEV);
  runApp(MyApp());
}
