import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/config/route_name.dart';
import 'package:mytakafulkeluarga/theme/theme_color.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/ui/pages/faq/accordion.dart';


class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FAQ Asuransi Syariah', style: googlePoppinsMedium.copyWith(fontSize: 16,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteName.home);
            },
            child: Icon(Icons.arrow_back // add custom icons also
                ),
          ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1d76bb),
                Colors.white,
              ],
            ),
          ),
        child: ListView(
          children: [
            Column(
              children: [
                Accordion('Apa prinsip dasar asuransi syariah?',
                    '“Dan hendaklah takut kepada Allah orang-orang yang seandainya meninggalkan di belakang mereka anak-anak yang lemah, yang mereka khawatir terhadap (kesejahteraan) mereka. Oleh sebab itu, hendaklah mereka bertakwa kepada Allah dan hendaklah mereka mengucapkan perkataan yang benar.” (QS. An-Nisa’ [4]: 9) “Dan tolong menolonglah kamu dalam kebaikan dan takwa, dan jangan tolong- menolong dalam berbuat dosa dan pelanggaran…” (QS. Al-Maidah [5]: 2) Allah  SWT  berkehendak  setiap  manusia  berpikir  visioner  serta menyempurnakan ikhtiar untuk mempersiapkan hari esok. Asuransi merupakan wujud ikhtiar manusia sebagai upaya preventif dalam rangka mengantisipasi risiko keuangan atas kemungkinan musibah di masa mendatang. Konsep tolong menolong mendasari prinsip kerja Takaful Keluarga. Perusahaan menyediakan wadah bagi peserta untuk saling melindungi dan bersama-sama menanggung risiko keuangan bilamana musibah menimpa. Bermula dari konsep tersebut, Takaful Keluarga berupaya menghadirkan solusi pengelolaan keuangan dan usaha meminimalisir risiko sesuai dengan prinsip-prinsip syariah yang bebas dari unsur gharar (ketidakjelasan), maisir (perjudian), riba (sistem bunga), dan zhulm (ketidakadilan).'),
                Accordion(
                    'Bagaimana mekanisme pengelolaan risiko dalam asuransi syariah?',
                    'Takaful Keluarga menerapkan pengelolaan risiko berdasarkan prinsip sharing of risk di antara peserta. Prinsip sharing of risk terwujud melalui penghimpunan dana tabarru’  dari seluruh peserta yang ditujukan dan dimanfaatkan sebagai dana tolong-menolong jika terjadi musibah di antara peserta. Takaful Keluarga percaya bahwa sharing of risk   mampu memupuk solidaritas, menciptakan hubungan saling melindungi, serta menjalin tali persaudaraan di antara peserta.'),
                Accordion(
                    'Bagaimana sistem pengelolaan dana di Takaful Keluarga?',
                    'Takaful Keluarga menerapkan pemisahan entitas dana kelolaan menjadi tiga akun yakni dana tabarru’, dana investasi peserta, serta dana perusahaan. Pembayaran klaim dialokasikan dari pos dana tabarru’ yang sejak awal diniatkan untuk kepentingan tolong-menolong di antara peserta jika terjadi musibah. Dalam kondisi pos dana tabarru’ mengalami deﬁsit, menjadi kewajiban bagi perusahaan untuk menalanginya menggunakan dana  perusahaan.  Sementara  pos  dana  peserta selamanya  menjadi  hak  peserta  yang  menjadi tanggung jawab Takaful Keluarga untuk mengelolanya melalui instrumen investasi yang disepakati bersama.'),
                Accordion('Apa saja akad yang dijalankan Takaful Keluarga?',
                    'Takaful Keluarga menggunakan akad tabarru’ dan akad tijari guna menjaga keabsahan transaksi sesuai kaidah  syariah.  Melalui  akad  tabarru’,  peser ta menghibahkan  sejumlah  dana  untuk  dikelola perusahaan sebagai dana tolong-menolong jika terjadi musibah di antara peserta (non-proﬁt oriented). Sementara akad tijari menjadi landasan atas transaksi pengelolaan dana investasi peserta oleh perusahaan agar dapat memberikan hasil yang optimal bagi peserta (proﬁt oriented).'),
                Accordion(
                    'Bagaimana Takaful Keluarga menginvestasikan dana investasi milik customer?',
                    'Takaful Keluarga mengelola dana investasi peserta berdasarkan akad tijari yang bebas dari unsur gharar (ketidakjelasan), maisir (perjudian), riba (sistem bunga), dan zhulm (ketidakadilan). Dana peserta diinvestasikan pada berbagai instrumen investasi berbasis syariah meliputi tetapi tidak terbatas pada reksadana syariah, saham syariah, serta obligasi syariah (sukuk) sehingga dapat menggerakkan perekonomian demi mewujudkan kesejahteraan masyarakat luas.'),
                Accordion(
                    'Benarkah Takaful Keluarga menghadirkan produk dan layanan yang halal sesuai syariah?',
                    'Takaful Keluarga memiliki Dewan Pengawas Syariah (DPS) yang ditunjuk oleh Dewan Syariah Nasional Majelis Ulama Indonesia (DSN-MUI) yang bertugas mengawasi sistem operasional, pengembangan produk, pengembangan sumber daya manusia, dan termasuk kebijakan investasi agar senantiasa selaras dengan prinsip serta nilai-nilai syariah. Keberadaan DPS memastikan gerak dan langkah perusahaan selalu berada dalam koridor syariah.'),
                Accordion(
                    'Bagaimana produk asuransi jiwa dan kesehatan syariah dirancang Takaful Keluarga?',
                    'Prioritas Takaful Keluarga adalah merancang dan mengembangkan berbagai produk selaras dengan kebutuhan peserta (customer-driven). Perubahan dan perkembangan kebutuhan peserta dari waktu ke waktu mendorong Takaful Keluarga untuk terus berinovasi guna menghadirkan solusi perencanaan keuangan sesuai syariah yang benar-benar memenuhi ekspektasi serta kebutuhan peserta.'),
                Accordion(
                    'Amankah berasuransi dan berinvestasi bersama Takaful Keluarga?',
                    'Merujuk pada Peraturan Menteri Keuangan (PMK) Nomor 11/2011 tentang Kesehatan Keuangan Usaha Asuransi dan Usaha Reasuransi Dengan Prinsip Syariah, perusahaan asuransi syariah diwajibkan menghitung solvabilitas dana perusahaan serta solvabilitas  dana  tabarru’ .  Perusahaan  diwajibkan menjaga  tingkat  solvabilitas  dana  tabarru ’  paling rendah 30% dari dana yang diperlukan untuk mengantisipasi risiko kerugian yang dapat timbul akibat deviasi dalam pengelolaan kekayaan dan/atau kewajiban. Rasio pencapaian solvabilitas (RBC) dana tabarru’ Takaful Keluarga adalah sebesar 173,04% (per 31 Desember 2016).'),
                Accordion(
                    'Bolehkah non muslim menjadi peserta asuransi Takaful Keluarga?',
                    'Tidak ada batasan bagi non muslim untuk menjadi peserta Takaful. Bahkan tidak sedikit nasabah non muslim yang telah bergabung dengan Takaful Keluarga saat ini.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
