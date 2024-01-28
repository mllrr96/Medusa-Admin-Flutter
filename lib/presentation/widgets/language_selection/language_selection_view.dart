import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart';

import 'language_locale.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    final tr = context.tr;
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  tr.personalInformationLanguageSettingsDescription,
                  style: mediumTextStyle,
                ),
              ),
              const Divider(height: 0),
              ListView.separated(
                separatorBuilder: (_, __) => const Divider(height: 0),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppLocalizations.supportedLocales.length,
                itemBuilder: (context, index) {
                  final languageLocale =
                      AppLocalizations.supportedLocales[index];
                  final languageName = LanguageLocal.getDisplayLanguage(
                          languageLocale.languageCode)
                      .name;
                  final languageNativeName = LanguageLocal.getDisplayLanguage(
                          languageLocale.languageCode)
                      .nativeName;
                  return RadioListTile<String>(
                    value: languageLocale.languageCode,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(languageName, style: mediumTextStyle),
                        if (languageName != languageNativeName)
                          Text(languageNativeName, style: mediumTextStyle),
                      ],
                    ),
                    groupValue: state.locale.languageCode,
                    onChanged: (val) {
                      if (val == null) {
                        return;
                      }
                      context.read<LanguageCubit>().changeLanguage(Locale(val));
                      context.popRoute();
                    },
                  );
                },
              ),
              const Divider(height: 0),
            ],
          ),
        );
      },
    );
  }
}
