import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'en_US/en_us_translations.dart';
import 'tr_TR/tr_tr_translations.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'tr': trTR,
      };
}
