import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/screens/main_menu.dart';
import 'package:mytakafulkeluarga/ui/pages/custome_tab_bar.dart';
import 'package:mytakafulkeluarga/ui/pages/doa/page_doa.dart';
// import 'package:mytakafulkeluarga/ui/pages/home/home.dart';
import 'package:mytakafulkeluarga/ui/pages/home/main_page.dart';
import 'package:mytakafulkeluarga/ui/pages/home/sign_in_page.dart';
import 'package:mytakafulkeluarga/ui/pages/home/sign_up_page.dart';
import 'package:mytakafulkeluarga/ui/pages/kalender/kalenderimage.dart';
import 'package:mytakafulkeluarga/ui/pages/kalender/kalenderpuasa.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_asuransi_jamaah_haji_tahun_2018.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_fulmedicare_gold.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takaful_al_khairat_kumpulan.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takaful_al_khairat_plus%20copy.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takaful_al_khairat_plus.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takaful_pembiayaan.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takaful_ziarah.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_falah_proteksi.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_falah_saving.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_salam.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_salam_cendikia.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_salam_community.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_salam_wakaf.dart';
import 'package:mytakafulkeluarga/ui/pages/product/book_now_takafulink_salam_ziarah_baitullah.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_bancassurace_takafulpembiayaan.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_bancassurance.dart';
// import 'package:mytakafulkeluarga/ui/pages/product/product_korporat.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_asuransijamaahhaji.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulalkhairatkumpulan.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulalkhairatplus.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafuldanapendidikan.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulfulmedicaregold.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinkfalahproteksi.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinkfalahsaving.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinksalam.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinksalamcendikia.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinksalamcommunity.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinksalamwakaf.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulinksalamziarahbaitullah.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulkecelakaandiriindividu.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_personal_takafulziarah.dart';
import 'package:mytakafulkeluarga/ui/pages/product/product_takafulkorporat.dart';
import 'package:mytakafulkeluarga/ui/pages/product/success_chechout_page.dart';
import 'package:mytakafulkeluarga/ui/pages/qiblah/qiblah_page.dart';
import 'package:mytakafulkeluarga/ui/pages/screens/welcome/welcome_screen.dart';
import 'package:mytakafulkeluarga/ui/pages/sedekah/sedekah_page.dart';
import 'package:mytakafulkeluarga/ui/pages/shalat/shalat_page.dart';
import 'package:mytakafulkeluarga/ui/pages/surah/surah_pages.dart';
import 'package:mytakafulkeluarga/ui/pages/zakat/profesi.page.dart';

class RouteConfig {
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RouteName.home: (context) => MainPage(),
    RouteName.listAlQuran: (context) => CustomeTabBarAlQuran(),
    RouteName.detailSurah: (context) => InitialSurahPages(),
    RouteName.listShalat: (context) => InitialShalatPages(),
    RouteName.PageDoa: (context) => PageDoa(),
    RouteName.SignUpPage: (context) => SignUpPage(),
    RouteName.SignInPage: (context) => SignInPage(),
    RouteName.Qiblah: (context) => PageQiblat(),

    RouteName.ProductPersonal: (context) => ProductPersonal(),
    RouteName.ProductKorporat: (context) => ProductTakafulKorporat(),
    RouteName.ProductTakafulBancassurance: (context) => ProductTakafulBancassurance(),
    

    RouteName.ProductPersonalTakafulDanaPendidikan: (context) => ProductPersonalTakafulDanaPendidikan(),
    RouteName.ProductPersonalTakafulinkSalam: (context) => ProductPersonalTakafulinkSalam(),
    RouteName.ProductPersonalTakafulinkSalamCendikia: (context) => ProductPersonalTakafulinkSalamCendikia(),
    RouteName.ProductPersonalTakafulinkSalamZiarahBaitullah: (context) => ProductPersonalTakafulinkSalamZiarahBaitullah(),
    RouteName.ProductPersonalTakafulinkSalamWakaf: (context) => ProductPersonalTakafulinkSalamWakaf(),
    RouteName.ProductPersonalTakafulinkSalamCommunity: (context) => ProductPersonalTakafulinkSalamCommunity(),
    RouteName.ProductPersonalTakafulinkFalahProteksi: (context) => ProductPersonalTakafulinkFalahProteksi(),
    RouteName.ProductPersonalTakafulinkFalahSaving: (context) => ProductPersonalTakafulinkFalahSaving(),
    RouteName.ProductPersonalTakafulAlKhairatPlus: (context) => ProductPersonalTakafulAlKhairatPlus(),
    RouteName.ProductPersonalTakafulKecelakaanDiriIndividu: (context) => ProductPersonalTakafulKecelakaanDiriIndividu(),

    
    

    RouteName.ProductKorporatTakafulAlKhairatKumpulan: (context) => ProductKorporatTakafulAlKhairatKumpulan(),
    RouteName.ProductKorporatTakafulMedicareGold: (context) => ProductKorporatTakafulMedicareGold(),
    RouteName.ProductKorporatTakafulZiarah: (context) => ProductKorporatTakafulZiarah(),
    RouteName.ProductKorporatAsuransiJamaahHaji: (context) => ProductKorporatAsuransiJamaahHaji(),  

    RouteName.ProductBancassuranceTakafulPembiayaan: (context) => ProductBancassuranceTakafulPembiayaan(),
    RouteName.ZakatProfesiPage: (context) => ZakatProfesiPage(),
    RouteName.HalamanSedekah: (context) => HalamanSedekah(),
    
    RouteName.WelcomeScreen: (context) => WelcomeScreen(),
    RouteName.MainMenu: (context) => MainMenu(),

    

    RouteName.BookNowPage: (context) => BookNowPage(),
    RouteName.BookNowPageFalahProteksi: (context) => BookNowPageFalahProteksi(), 
    RouteName.BookNowPageFalahSaving: (context) => BookNowPageFalahSaving(), 
    RouteName.BookNowPageSalamCendikia: (context) => BookNowPageSalamCendikia(), 
    RouteName.BookNowPageSalamCommunity: (context) => BookNowPageSalamCommunity(), 
    RouteName.BookNowPageSalamWakaf: (context) => BookNowPageSalamWakaf(), 
    RouteName.BookNowPageSalamZiarahBaitullah: (context) => BookNowPageSalamZiarahBaitullah(), 
    RouteName.BookNowPageSalam: (context) => BookNowPageSalam(), 
    RouteName.BookNowPageTakafulAlKhairatPlus: (context) => BookNowPageTakafulAlKhairatPlus(), 
    RouteName.BookNowPageTakafulKecelakaanDiriIndividu: (context) => BookNowPageTakafulKecelakaanDiriIndividu(), 

    RouteName.BookNowPageSalam: (context) => BookNowPageSalam(), 

    RouteName.BookNowPageAlKhairatKumpulan: (context) => BookNowPageAlKhairatKumpulan(),
    RouteName.BookNowPageFulmedicareGold: (context) => BookNowPageFulmedicareGold(),
    RouteName.BookNowPageZiarah: (context) => BookNowPageZiarah(),
    RouteName.BookNowPageAsuransiJamaahHajiTahun2018: (context) => BookNowPageAsuransiJamaahHajiTahun2018(),

    RouteName.BookNowPagePembiayaan: (context) => BookNowPagePembiayaan(),
    
        

    RouteName.SuccessCheckoutPage: (context) => SuccessCheckoutPage(),
    RouteName.KalenderImage: (context) => KalenderImage(),
    
  };
}