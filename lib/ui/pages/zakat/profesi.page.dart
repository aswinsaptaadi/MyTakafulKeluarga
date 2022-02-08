import 'package:flutter/material.dart';
import 'package:mytakafulkeluarga/theme/theme_text.dart';
import 'package:mytakafulkeluarga/utils/NumberFormatUtil.dart';

class ZakatProfesiPage extends StatefulWidget {
  @override
  _ZakatProfesiPageState createState() => _ZakatProfesiPageState();
}

class _ZakatProfesiPageState extends State<ZakatProfesiPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _cashController = new TextEditingController();
  TextEditingController _otherController = new TextEditingController();
  // TextEditingController _hutangController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penghasilan', style: googlePoppinsMedium.copyWith(),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                      'Zakat penghasilan atau yang dikenal juga sebagai zakat profesi adalah bagian dari zakat maal yang wajib dikeluarkan atas harta yang berasal dari pendapatan / penghasilan rutin dari pekerjaan yang tidak melanggar syariah. Nishab zakat penghasilan sebesar 85 gram emas per tahun. Kadar zakat penghasilan senilai 2,5%. Dalam praktiknya, zakat penghasilan dapat ditunaikan setiap bulan dengan nilai nishab per bulannya adalah setara dengan nilai seperduabelas dari 85 gram emas, dengan kadar 2,5%. Jadi apabila penghasilan setiap bulan telah melebihi nilai nishab bulanan, maka wajib dikeluarkan zakatnya sebesar 2,5% dari penghasilannya tersebut. (Sumber: Al Quran Surah Al Baqarah ayat 267, Peraturan Menteri Agama Nomer 31 Tahun 2019, Fatwa MUI Nomer 3 Tahun 2003, dan pendapat Shaikh Yusuf Qardawi).',
                      style: googlePoppinsRegular.copyWith(fontSize: 14),),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Penghasilan',
                      style: googlePoppinsRegular.copyWith(
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Jumlah pendapatan per bulan'),
                    keyboardType: TextInputType.number,
                    controller: _cashController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),  
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Bonus, THR dan lainnya'),
                    keyboardType: TextInputType.number,
                    controller: _otherController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       labelText: 'Hutang atau Cicilan Per Bulan'),
                  //   keyboardType: TextInputType.number,
                  //   controller: _hutangController,
                  //   validator: (val) =>
                  //       val.isEmpty ? 'Field ini harus diisi' : null,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: _sumZakat,
                      color: Colors.blue,
                      child: Text(
                        'HITUNG ZAKAT',
                        style: googlePoppinsRegular.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText:
                            'Total Zakat Profesi yang Harus Dikeluarkan'),
                    keyboardType: TextInputType.number,
                    enabled: false,
                    controller: _totalController,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _sumZakat() {
    final FormState formState = _formState.currentState;
    if (!formState.validate()) {
    } else {
      formState.save();

      int cash = int.parse(_cashController.text);
      int other = int.parse(_otherController.text);
      // int hutang = int.parse(_hutangController.text);

      int total = ((cash + other) * 0.025).round();

      if (total <= 0) {
        _totalController.text = 'Anda tidak wajib melakukan zakat';
      } else {
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(total)}';
      }
    }
  }
}
