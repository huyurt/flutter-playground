import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Util {
  //static String appId ='{ADD YOUR OWN APPID}';
  static String appId = "1740f14c43c19eee859c334e4ca0424e";

  static String getFormattedDate(DateTime dateTime) {
    initializeDateFormatting('tr_TR', null);
    return new DateFormat('EEEE, MMM d, y', 'tr_TR').format(dateTime);
  }
}
