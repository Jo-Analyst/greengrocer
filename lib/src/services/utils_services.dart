import 'package:intl/intl.dart';

class UtilsServices {
static String priceToCurrency (double price){
NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "PT-BR");
return numberFormat.format(price);
}
}