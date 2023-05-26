import 'dart:ui';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';

class LanguageService extends GetxController {
  static LanguageService get instance => Get.find<LanguageService>();

  late String language;

  LanguageService init() {
    language = StorageService.language;
    Get.updateLocale(Locale(language));
    return this;
  }

  Future<void> changeLanguage() async{

    if(language == 'ar'){
      language = 'en';
    } else {
      language = 'ar';
    }
    await StorageService.instance.saveLanguage(language);
    Get.updateLocale(Locale(language));
  }
}
