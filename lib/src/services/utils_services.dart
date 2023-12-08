import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "PT-BR");
    return numberFormat.format(price);
  }

  static String formateDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd("PT-BR").add_Hm();
    return dateFormat.format(dateTime);
  }
}
