import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mytakafulkeluarga/bloc/b_alquran/alquran_bloc.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/surah/surah_bottom_sheet_view.dart';
import 'package:mytakafulkeluarga/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class SurahDetailView extends StatefulWidget {
  final String nameSurah;
  final String idSurah;

  const SurahDetailView({
    Key key,
    @required this.nameSurah,
    @required this.idSurah,
  }) : super(key: key);
  @override
  _SurahDetailViewState createState() => _SurahDetailViewState();
}

class _SurahDetailViewState extends State<SurahDetailView> {
  AudioPlayer audioPlayer;
  // Refresh
  Completer<void> _refreshCompleter;

  // Bloc
  AlQuranBloc _alQuranBloc;

  @override
  void initState() {
    _alQuranBloc = BlocProvider.of<AlQuranBloc>(context);
    _refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  void dispose() {
    _alQuranBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          scaffold: Scaffold(
            // floatingActionButton: FloatingActionButton(onPressed: (){}),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: whiteColor,
              elevation: 0.0,
              title: Text(
                "Al-Quran",
                style: googlePoppinsMedium.copyWith(
                  fontSize: 20,
                  color: blackColor1,
                  letterSpacing: 0.3,
                ),
              ),
              iconTheme: IconThemeData(
                color: blackColor,
                size: 24,
              ),
              // actions: <Widget>[
              //   IconButton(
              //     icon: Icon(
              //       Icons.search,
              //       color: blackColor1,
              //       size: 24,
              //     ),
              //     onPressed: () {},
              //   ),
              //   IconButton(
              //     icon: Icon(
              //       Icons.more_vert,
              //       color: blackColor1,
              //       size: 24,
              //     ),
              //     onPressed: () {},
              //   ),
              // ],
            ),
            body: BlocListener<AlQuranBloc, AlQuranState>(
              listener: (context, state) {
                if (state is DetailSurahLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              child: BlocBuilder<AlQuranBloc, AlQuranState>(
                bloc: _alQuranBloc,
                builder: (context, state) {
                  if (state is DetailSurahLoadInProgress) {
                    return Column(
                      children: [
                        Container(
                          height: sy(32),
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 18,
                          ),
                          width: double.infinity,
                          color: blueColor,
                        ),
                        Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is DetailSurahLoadedSuccess) {
                    // print(state.modelDetailSurah.data.verses);
                    var juz = state.modelDetailSurah.data.verses.first;
                    return RefreshIndicator(
                      onRefresh: () {
                        _alQuranBloc
                          ..add(
                            GetDetailSurahFromApi(
                              idSurah: widget.idSurah,
                            ),
                          );
                        return _refreshCompleter.future;
                      },
                      child: Column(
                        children: [
                          Container(
                            height: sy(32),
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 18,
                            ),
                            width: double.infinity,
                            color: primaryColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${state.modelDetailSurah.data.number}. ${state.modelDetailSurah.data.name.transliteration.id}',
                                  style: googlePoppinsMedium.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.3,
                                    color: whiteColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Juz ${juz.meta.juz}',
                                      style: googlePoppinsMedium.copyWith(
                                        fontSize: 16,
                                        letterSpacing: 0.3,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                children: [
                                  state.modelDetailSurah.data.number == 1
                                      ? Container()
                                      : Container(
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          height: sy(54),
                                          width: double.infinity,
                                          child: Text(
                                            '???????????? ?????????????? ???????????????????????? ??????????????????',
                                            style: arabicFont.copyWith(
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state
                                        .modelDetailSurah.data.verses.length,
                                    itemBuilder: (context, int index) {
                                      // print(state.modelDetailSurah.data.verses[index].audio.primary); 
                                      return GestureDetector(
                                        onTap: () =>
                                            showMaterialModalBottomSheet(
                                          context: context,
                                          expand: false,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                          builder: (context) =>
                                              SurahBottomSheetView(
                                            nameSurah: widget.nameSurah,
                                            ayatSurahAsli: state
                                                .modelDetailSurah
                                                .data
                                                .verses[index]
                                                .number
                                                .inSurah
                                                .toString(),
                                            ayatSurah:  widget.idSurah,
                                            indexAudio: index,
                                            urlAudio: state
                                                .modelDetailSurah
                                                .data
                                                .verses[index]
                                                .audio
                                                .primary,
                                            textarab: state.modelDetailSurah
                                                .data.verses[index].text.arab,
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            top: 12,
                                            left: 20,
                                            right: 20,
                                            bottom: 16,
                                          ),
                                          color: index % 2 == 0
                                              ? Color(0xFFF0F5FC)
                                              : Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      '${state.modelDetailSurah.data.verses[index].number.inSurah.toString()}.',
                                                      //  '${state.modelDetailSurah.data.verses[index].audio.primary}.',
                                                      style: GoogleFonts
                                                          .robotoMono(
                                                        fontSize: sy(12),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 7,
                                                    child: Text(
                                                      state
                                                          .modelDetailSurah
                                                          .data
                                                          .verses[index]
                                                          .text
                                                          .arab,
                                                      style:
                                                          arabicFont.copyWith(
                                                        fontSize: 30,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                state
                                                    .modelDetailSurah
                                                    .data
                                                    .verses[index]
                                                    .translation
                                                    .id,
                                                style: googlePoppinsRegular
                                                    .copyWith(
                                                  letterSpacing: 0.3,
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is DetailSurahLoadedError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _alQuranBloc
                                ..add(
                                  GetDetailSurahFromApi(
                                      idSurah: widget.idSurah),
                                );
                            },
                            child: Text(
                              'Refresh',
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
