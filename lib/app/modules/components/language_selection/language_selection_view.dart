import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../data/service/language_service.dart';
import 'language_locale.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text('Select App Language'),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppLocalizations.supportedLocales.length,
          itemBuilder: (context, index) {
            final languageLocale = AppLocalizations.supportedLocales[index];
            final languageName = LanguageLocal()
                .getDisplayLanguage(languageLocale.languageCode)
                .name;
            final languageNativeName = LanguageLocal()
                .getDisplayLanguage(languageLocale.languageCode)
                .nativeName;
            final languageText = languageName == languageNativeName
                ? languageName
                : '$languageName $languageNativeName';
            return RadioListTile<String>(
              value: languageLocale.languageCode,
              title: Text(languageText),
              groupValue: LanguageService.language,
              onChanged: (val) async {
                if (val == null) {
                  return;
                }
                await LanguageService.instance.changeLanguage(val);
                Get.back();
              },
            );
          },
        ),
      ],
    );
  }
}
