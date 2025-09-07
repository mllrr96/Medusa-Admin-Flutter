import 'dart:ui';

import 'package:medusa_admin/src/features/app_settings/presentation/widgets/language_selection/language_locale.dart';

extension LocaleExtension on Locale {
  LanguageModel get languageModel =>
      LanguageLocal.getDisplayLanguage(languageCode);
}
