import 'dart:convert';


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurahBottomSheetView extends StatefulWidget {
  final String nameSurah;
  final String ayatSurahAsli;
  final String ayatSurah;
  final int indexAudio;
  final String urlAudio;
  final String textarab;

  const SurahBottomSheetView({
    Key key,
    this.nameSurah,
    this.ayatSurahAsli,
    this.ayatSurah,
    this.indexAudio,
    this.urlAudio,
    this.textarab,
  }) : super(key: key);

  @override
  _SurahBottomSheetViewState createState() => _SurahBottomSheetViewState();
}

class _SurahBottomSheetViewState extends State<SurahBottomSheetView> {
  AudioPlayer audioPlayer =
      AudioPlayer(); //VARIABLE YANG AKAN MENG-HANDLE AUDIO

  bool isBook = false;
  String namaSurahAsli = '';
  String namaSurah = '';
  String ayatSurah = '';

  void changeBook() {
    setState(() {
      isBook = !isBook;
    });
  }

  void fnamaSurah() {
    namaSurah = '${widget.nameSurah} Ayat ${widget.ayatSurahAsli}';
    namaSurahAsli = widget.nameSurah; 
    ayatSurah = widget.ayatSurah;
    setPreference();
  }

  // bool
  int _currentSelectedAyat = -1;

  void setPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      jembatan.clear();
    }

    final myData = json.encode({
      'namaSurah': namaSurah,
      'namaSurahAsli': namaSurahAsli,
      'ayatSurah' : ayatSurah,
    });

    jembatan.setString('myData', myData);
    setState(() {});
  }

  Future<void> getPreference() async {
    final jembatan = await SharedPreferences.getInstance();

    if (jembatan.containsKey('myData')) {
      final myData =
          json.decode(jembatan.getString('myData')) as Map<String, dynamic>;

      namaSurah = myData["namaSurah"] ?? "Tidak ada tanda bacaan terkahir";
      namaSurahAsli = myData["namaSurahAsli"] ?? "Kosong";
      ayatSurah = myData["ayatSurah"] ?? "0";
    }
  }

  @override
  void initState() {
    // ayatEnd();
    super.initState();
  }

  void ayatEnd() {
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _currentSelectedAyat = -1;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        // print(widget.urlAudio);
        return Container(
          height: sy(314),
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  bottom: 24,
                ),
                child: Text(
                  '${widget.nameSurah} : ${widget.ayatSurahAsli}',
                  style: googlePoppinsMedium.copyWith(
                    fontSize: 20,
                    color: blackColor1,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Column(
                children: [
                  buttonFunctionSurah(
                    icon: Icon(
                      _currentSelectedAyat != int.parse(widget.ayatSurah)
                          ? Icons.play_arrow_outlined
                          : Icons.pause_outlined,
                      size: sy(24),
                    ),
                    nameFunction: 'Putar Murotal',
                    onTap: () async {
                      if (_currentSelectedAyat == int.parse(widget.ayatSurah)) {
                        _currentSelectedAyat = -1;

                        if (_currentSelectedAyat == -1) {
                          await audioPlayer.pause();
                        }
                      } else {
                        var url =
                            "https://dl12.sura.pw/dl/reciter/25/32/001.mp3?h=Yh579X0_N4okXhqTVRI7CQ&expires=1642438025";
                        print(_currentSelectedAyat);
                        print(widget.indexAudio);
                        _currentSelectedAyat = int.parse(widget.ayatSurah);
                        // ketika _currentSelectedAyat sama dengan index
                        // Maka Ayat akan di jalankan
                        if (_currentSelectedAyat ==
                            int.parse(widget.ayatSurah)) {
                          print('---------------------------');
                          print(int.parse(widget.ayatSurahAsli));
                          print('---------------------------');
                          switch (int.parse(widget.ayatSurah)) {
                            case 1:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/001_Al-Fatihah_Misyari.mp3');
                              break;
                            case 2:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/002_Al-Baqarah_Misyari.mp3');
                              break;
                            case 3:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/003_Ali-Imran_Misyari.mp3');
                              break;
                            case 4:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/004_An-Nisa_Misyari.mp3');
                              break;
                            case 5:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/005_Al-Maidah_Misyari.mp3');
                              break;
                            case 6:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/006_Al-Anam_Misyari.mp3');
                              break;
                            case 7:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/007_Al-Araf_Misyari.mp3');
                              break;
                            case 8:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/008_Al-Anfal_Misyari.mp3');
                              break;
                            case 9:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/009_At-Taubah_Misyari.mp3');
                              break;
                            case 10:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/010_Yunus_Misyari.mp3');
                              break;
                            case 11:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/011_Hud_Misyari.mp3');
                              break;
                            case 12:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/012_Yusuf_Misyari.mp3');
                              break;
                            case 13:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/013_Ar-Rad_Misyari.mp3');
                              break;
                            case 14:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/014_Ibrahim_Misyari.mp3');
                              break;
                            case 15:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/015_Al-Hijr_Misyari.mp3');
                              break;
                            case 16:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/016_An-Nahl_Misyari.mp3');
                              break;
                            case 17:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/017_Al-Isra_Misyari.mp3');
                              break;
                            case 18:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/018_Al-Kahfi_Misyari.mp3');
                              break;
                            case 19:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/019_Maryam_Misyari.mp3');
                              break;
                            case 20:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/020_Tha-Ha_Misyari.mp3');
                              break;
                            case 21:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/021_Al-Anbiya_Misyari.mp3');
                              break;
                            case 22:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/022_Al-Hajj_Misyari.mp3');
                              break;
                            case 23:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/023_Al-Muminun_Misyari.mp3');
                              break;
                            case 24:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/024_An-Nur_Misyari.mp3');
                              break;
                            case 25:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/025_Al-Furqan_Misyari.mp3');
                              break;
                            case 26:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/026_Asy-Syuara_Misyari.mp3');
                              break;
                            case 27:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/027_An-Naml_Misyari.mp3');
                              break;
                            case 28:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/028_Al-Qashas_Misyari.mp3');
                              break;
                            case 29:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/029_Al-Ankabut_Misyari.mp3');
                              break;
                            case 30:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/030_Ar-Rum_Misyari.mp3');
                              break;
                            case 31:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/031_Luqman_Misyari.mp3');
                              break;
                            case 32:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/032_As-Sajdah_Misyari.mp3');
                              break;
                            case 33:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/033_Al-Ahzab_Misyari.mp3');
                              break;
                            case 34:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/034_Saba_Misyari.mp3');
                              break;
                            case 35:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/035_Fathir_Misyari.mp3');
                              break;
                            case 36:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/036_YaSin_Misyari.mp3');
                              break;
                            case 37:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/037_As-Shaffat_Misyari.mp3');
                              break;
                            case 38:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/038_Shad_Misyari.mp3');
                              break;
                            case 39:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/039_Az-Zumar_Misyari.mp3');
                              break;
                            case 40:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/040_Ghafir_Misyari.mp3');
                              break;
                            case 41:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/041_Fusshilat_Misyari.mp3');
                              break;
                            case 42:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/042_Asy-Syura_Misyari.mp3');
                              break;
                            case 43:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/043_Az-Zukhruf_Misyari.mp3');
                              break;
                            case 44:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/044_Ad-Dukhan_Misyari.mp3');
                              break;
                            case 45:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/045_Al-Jatsiyah_Misyari.mp3');
                              break;
                            case 46:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/046_Al-Ahqaf_Misyari.mp3');
                              break;
                            case 47:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/047_Muhammad_Misyari.mp3');
                              break;
                            case 48:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/048_Al-Fath_Misyari.mp3');
                              break;
                            case 49:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/049_Al-Hujurat_Misyari.mp3');
                              break;
                            case 50:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/050_Qaf_Misyari.mp3');
                              break;
                            case 51:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/051_Adz-Dzariyat_Misyari.mp3');
                              break;
                            case 52:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/052_At-Thur_Misyari.mp3');
                              break;
                            case 53:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/053_An-Najm_Misyari.mp3');
                              break;
                            case 54:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/054_Al-Qamar_Misyari.mp3');
                              break;
                            case 55:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/055_Ar-Rahman_Misyari.mp3');
                              break;
                            case 56:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/056_Al-Waqiah_Misyari.mp3');
                              break;
                            case 57:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/057_Al-Hadid_Misyari.mp3');
                              break;
                            case 58:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/058_Al-Mujadilah_Misyari.mp3');
                              break;
                            case 59:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/059_Al-Hasyr_Misyari.mp3');
                              break;
                            case 60:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/060_Al-Mumtahanah_Misyari.mp3');
                              break;
                            case 61:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/061_As-Shaff_Misyari.mp3');
                              break;
                            case 62:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/062_Al-Jumuah_Misyari.mp3');
                              break;
                            case 63:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/063_Al-Munafiqun_Misyari.mp3');
                              break;
                            case 64:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/064_At-Taghabun_Misyari.mp3');
                              break;
                            case 65:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/065_At-Thalaq_Misyari.mp3');
                              break;
                            case 66:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/066_At-Tahrim_Misyari.mp3');
                              break;
                            case 67:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/067_Al-Mulk_Misyari.mp3');
                              break;
                            case 68:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/068_Al-Qalam_Misyari.mp3');
                              break;
                            case 69:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/069_Al-Haqqah_Misyari.mp3');
                              break;
                            case 70:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/070_Al-Maarij_Misyari.mp3');
                              break;
                            case 71:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/071_Nuh_Misyari.mp3');
                              break;
                            case 72:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/072_Al-Jinn_Misyari.mp3');
                              break;
                            case 73:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/073_Al-Muzzammil_Misyari.mp3');
                              break;
                            case 74:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/074_Al-Muddatstsir_Misyari.mp3');
                              break;
                            case 75:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/075_Al-Qiyamah_Misyari.mp3');
                              break;
                            case 76:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/076_Al-Insan_Misyari.mp3');
                              break;
                            case 77:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/077_Al-Mursalat_Misyari.mp3');
                              break;
                            case 78:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/078_An-Naba_Misyari.mp3');
                              break;
                            case 79:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/079_An-Naziat_Misyari.mp3');
                              break;
                            case 80:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/080_Abasa_Misyari.mp3');
                              break;
                            case 81:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/081_At-Takwir_Misyari.mp3');
                              break;
                            case 82:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/082_Al-Infithar_Misyari.mp3');
                              break;
                            case 83:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/083_Al-Muthaffifin_Misyari.mp3');
                              break;
                            case 84:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/084_Al-Insyiqaq_Misyari.mp3');
                              break;
                            case 85:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/085_Al-Buruj_Misyari.mp3');
                              break;
                            case 86:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/086_At-Thariq_Misyari.mp3');
                              break;
                            case 87:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/087_Al-Ala_Misyari.mp3');
                              break;
                            case 88:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/088_Al-Ghasyiyah_Misyari.mp3');
                              break;
                            case 89:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/089_Al-Fajr_Misyari.mp3');
                              break;
                            case 90:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/090_Al-Balad_Misyari.mp3');
                              break;
                            case 91:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/091_Asy-Syams_Misyari.mp3');
                              break;
                            case 92:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/092_Al-Lail_Misyari.mp3');
                              break;
                            case 93:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/093_Adh-Dhuha_Misyari.mp3');
                              break;
                            case 94:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/094_Al-Insyirah_Misyari.mp3');
                              break;
                            case 95:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/095_At-Tin_Misyari.mp3');
                              break;
                            case 96:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/096_Al-Alaq_Misyari.mp3');
                              break;
                            case 97:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/097_Al-Qadr_Misyari.mp3');
                              break;
                            case 98:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/098_Al-Bayyinah_Misyari.mp3');
                              break;
                            case 99:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/099_Az-Zalzalah_Misyari.mp3');
                              break;
                            case 100:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/100_Al-Adiyat_Misyari.mp3');
                              break;
                            case 101:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/101_Al-Qariah_Misyari.mp3');
                              break;
                            case 102:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/102_At-Takatsur_Misyari.mp3');
                              break;
                            case 103:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/103_Al-Asr_Misyari.mp3');
                              break;
                            case 104:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/104_Al-Humazah_Misyari.mp3');
                              break;
                            case 105:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/105_Al-Fiil_Misyari.mp3');
                              break;
                            case 106:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/106_Quraisy_Misyari.mp3');
                              break;
                            case 107:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/107_Al-Maun_Misyari.mp3');
                              break;
                            case 108:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/108_Al-Kautsar_Misyari.mp3');
                              break;
                            case 109:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/109_Al-Kafirun_Misyari.mp3');
                              break;
                            case 110:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/110_An-Nashr_Misyari.mp3');
                              break;
                            case 111:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/111_Al-Lahab_Misyari.mp3');
                              break;
                            case 112:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/112_Al-Ikhlas_Misyari.mp3');
                              break;
                            case 113:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/113_Al-Falaq_Misyari.mp3');
                              break;
                            case 114:
                              await audioPlayer.play(
                                  'https://pabrikjammasjid.com/downloads/misyari/114_An-Naas_Misyari.mp3');
                              break;
                          }
                        }
                      }
                      setState(() {});
                    },
                  ),
                  buttonFunctionSurah(
                    icon: Icon(
                      Icons.share_outlined,
                      size: sy(24),
                      color: Color(0xFF595959),
                    ),
                    nameFunction: 'Bagikan Ayat',
                    onTap: () async {
                      Share.share(
                        widget.textarab,
                        subject: '${widget.nameSurah} : ${widget.ayatSurah}',
                      );
                    },
                  ),
                  buttonFunctionSurah(
                    icon: Icon(
                      Icons.copy_outlined,
                      size: sy(24),
                      color: Color(0xFF595959),
                    ),
                    nameFunction: 'Salin Ayat',
                    onTap: () {
                      Navigator.pop(context);
                      Clipboard.setData(
                        ClipboardData(
                          text: widget.textarab,
                        ),
                      );

                      final snackBar = SnackBar(
                        content: Text(
                          'Ayat berhasil disalin',
                          style: googlePoppinsMedium.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  // FutureBuilder(
                  //   future: getPreference(),
                  //   builder: (context, _) => buttonFunctionSurah(
                  //     icon: Icon(
                  //       Icons.favorite_border_outlined,
                  //       size: sy(24),
                  //       color: Color(0xFF595959),
                  //     ),
                  //     nameFunction: '${namaSurah} : ${namaSurahAsli} : ${ayatSurah}',
                  //     onTap: () {},
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      fnamaSurah();
                      setState(() {
                        isBook = !isBook;
                      });
                    },
                    child: buttonFunctionSurah(
                      icon: isBook
                          ? Icon(
                              Icons.bookmark_border,
                              size: sy(24),
                              color: Color(0xFFFAC915),
                            )
                          : Icon(
                              Icons.bookmark_border,
                              size: sy(24),
                              color: Color(0xFF595959),
                            ),
                      nameFunction: 'Tandai terakhir dibaca',
                      onTap: fnamaSurah,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buttonFunctionSurah({
    String nameFunction,
    Icon icon,
    VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: icon,
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            nameFunction,
            style: googlePoppinsRegular.copyWith(
              fontSize: 16,
              color: blackColor1,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
