import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_detail_surah.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_list_alquran.dart';
import 'package:mytakafulkeluarga/model/m_list_shalat.dart';


abstract class Repository {
  Future<ModelListAlQuran> getListAlQuran();

  Future<ModelDetailSurah> getDetailSurah({
    @required String idSurah,
  });
  Future<ModelListShalat> getListShalat({
    @required String nameCity,
    @required String dateTime,
  });
}