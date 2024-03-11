// import 'dart:ui';
//
// import 'package:medusa_admin/presentation/widgets/language_selection/language_locale.dart';
// import 'preference_service.dart';
//
//
// class LanguageService extends GetxController {
//   static LanguageService get instance => Get.find<LanguageService>();
//   static String get language => Get.find<LanguageService>()._language;
//   static LanguageModel get languageModel => LanguageLocal.getDisplayLanguage(Get.find<LanguageService>()._language);
//
//   late String _language;
//
//   LanguageService init() {
//     _language = PreferenceService.language;
//     Get.updateLocale(Locale(_language));
//     return this;
//   }
//
//   Future<void> changeLanguage(String language) async {
//     _language = language;
//     await PreferenceService.instance.saveLanguage(language);
//     await Get.updateLocale(Locale(language));
//   }
// }
