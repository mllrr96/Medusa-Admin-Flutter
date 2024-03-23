import 'dart:ui';

import 'package:medusa_admin/presentation/widgets/language_selection/language_locale.dart';

extension LocaleExtension on Locale{
  LanguageModel get languageModel => LanguageLocal.getDisplayLanguage(languageCode);
}