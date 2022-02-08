import 'package:dio/dio.dart';
import 'package:mytakafulkeluarga/utils/logging_interceptor.dart';

Dio dioClient() {
  final options = BaseOptions(
    // baseUrl: 'https://api.quran.sutanlab.id/',
    connectTimeout: 5000,//120000,
    receiveTimeout: 3000, //120000,
    contentType: 'application/json',
  );

  var dio = Dio(options);
  dio.interceptors.add(LogginInterceptors());
  // dio.interceptors.add(alice.getDioInterceptor());

  return dio;
}