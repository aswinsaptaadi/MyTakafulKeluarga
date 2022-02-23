import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_detail_surah.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_list_alquran.dart';
import 'package:mytakafulkeluarga/model/m_list_shalat.dart';
import 'package:mytakafulkeluarga/network/dio_client.dart';
import 'package:mytakafulkeluarga/network/api_repository.dart';
import 'package:mytakafulkeluarga/utils/extensions.dart';

class ApiService implements Repository {
  Response response;
  String baseUrlAlQuran = 'https://api.quran.sutanlab.id';
  String baseUrlShalat = 'https://api.pray.zone/v2/times';

  Dio get dio => dioClient();

  @override
  Future<ModelListAlQuran> getListAlQuran() async {
    try {
      response = await dio.get(
        '$baseUrlAlQuran/surah',
      );
      var models = new ModelListAlQuran();
      if(response.statusCode == 200){
        try{
          models = ModelListAlQuran.fromJson(
            response.data,
          );
        }catch(error){
          try{
            models = ModelListAlQuran.fromJson(
            json.decode(
              response.data,
              ),
            );
          }catch(error, stacktrace){
            throw showException(error, stacktrace);
          }
          
        }
      }
      return models;
      // return ModelListAlQuran.fromJson(
      //   // json.decode(
      //   response.data,
      //   // ),
      // );
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelDetailSurah> getDetailSurah({
    idSurah,
  }) async {
    try {
      response = await dio.get(
        '$baseUrlAlQuran/surah/$idSurah',
      );
      var models = new ModelDetailSurah();
      if(response.statusCode == 200){
        try{
          models = ModelDetailSurah.fromJson(
            response.data,
          );
        }catch(error){
          try{
            models = ModelDetailSurah.fromJson(
            json.decode(
              response.data,
              ),
            );
          }catch(error, stacktrace){
            throw showException(error, stacktrace);
          }
          
        }
      }
      return models;
      // if (idSurah == "2") {
      //   print("IDSURAH 2");
      //   return ModelDetailSurah.fromJson(
      //     // json.decode(
      //       response.data,
      //     // ),
      //   );
      // } else if (idSurah == "1") {
      //   print("IDSURAH 1");
      //   return ModelDetailSurah.fromJson(
      //     // json.decode(
      //     response.data,
      //     // ),
      //   );
      // } else if (idSurah == "36") {
      //   print("IDSURAH 36");
      //   return ModelDetailSurah.fromJson(
      //     json.decode(
      //     response.data,
      //     ),
      //   );
      // }
      
      // else {
      //   // print("INI RESPONSE");
      //   // print(response.data);
      //   print("IDSURAH BUKAN 2");
      //   return ModelDetailSurah.fromJson(
      //     // json.decode(
      //     response.data,
      //     // ),
      //   );
      // }
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }

  @override
  Future<ModelListShalat> getListShalat({
    nameCity,
    dateTime,
  }) async {
    try {
      response = await dio.get(
        '$baseUrlShalat/today.json?city=Jakarta&dat=$dateTime',
      );

      return ModelListShalat.fromJson(response.data);
    } on DioError catch (e) {
      throw e.getErrorMessage();
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}
