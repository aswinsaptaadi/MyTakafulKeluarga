import 'package:mytakafulkeluarga/utils/string.util.dart';

class NumberFormatUtil {
  static String currencyFormat(int resource) {
    return numberFormat(resource, decimalPoint: ',', thousandsSep: '.');
  }
}
