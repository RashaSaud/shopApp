import 'package:flutter_application_1/language/ar.dart';
import 'package:flutter_application_1/language/en.dart';
import 'package:flutter_application_1/language/fr.dart';
import 'package:get/route_manager.dart';

import '../utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
