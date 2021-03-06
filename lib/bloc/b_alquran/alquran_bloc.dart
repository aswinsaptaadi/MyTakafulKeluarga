import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_detail_surah.dart';
import 'package:mytakafulkeluarga/model/al-quran/m_list_alquran.dart';
import 'package:mytakafulkeluarga/network/api_repository.dart';
import 'package:mytakafulkeluarga/network/api_service.dart';

part 'alquran_event.dart';
part 'alquran_state.dart';

class AlQuranBloc extends Bloc<AlQuranEvent, AlQuranState> {
  AlQuranBloc() : super(AlQuranLoadInProgress());

  final Repository _repository = ApiService();
  ModelListAlQuran modelListAlQuran;
  ModelDetailSurah modelDetailSurah;

  @override
  Stream<AlQuranState> mapEventToState(
    AlQuranEvent event,
  ) async* {
    if (event is GetListAlQuranFromApi) {
      yield AlQuranLoadInProgress();
      try {
        modelListAlQuran = await _repository.getListAlQuran();

        yield AlQuranLoadedSuccess(
          modelListAlQuran: modelListAlQuran,
        );
      } catch (e) {
        yield AlQuranLoadedError(
          message: "$e",
        );
      }
    } else if (event is GetDetailSurahFromApi) {
      yield DetailSurahLoadInProgress();
      try {
        modelDetailSurah =
            await _repository.getDetailSurah(idSurah: event.idSurah);

        yield DetailSurahLoadedSuccess(
          modelDetailSurah: modelDetailSurah,
        );
        
      } catch (e) {
        yield DetailSurahLoadedError(
          message: "$e",
        );
      }
    }
  }
}
