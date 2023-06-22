import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/drawer.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../data/service/language_service.dart';
import '../../../../data/service/storage_service.dart';
import '../../../components/language_selection/language_selection_view.dart';
import '../controllers/app_settings_controller.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      final tr = AppLocalizations.of(context)!;
      final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
      final smallTextStyle = Theme.of(context).textTheme.titleSmall;
      return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('App Settings'),
        ),
        body: SettingsList(
          // contentPadding: EdgeInsets.zero,
          // physics: const NeverScrollableScrollPhysics(),
          lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
              settingsSectionBackground: Theme.of(context).cardColor),
          darkTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
              settingsSectionBackground: Theme.of(context).cardColor),
          sections: [
            SettingsSection(
              title: Text(tr.appearance),
              tiles: ThemeMode.values.map((e) {
                String title = tr.automaticAppearance;
                IconData iconData = Icons.brightness_auto;
                switch (e) {
                  case ThemeMode.system:
                    break;
                  case ThemeMode.light:
                    title = tr.lightAppearance;
                    iconData = MedusaIcons.sun;
                    break;
                  case ThemeMode.dark:
                    title = tr.darkAppearance;
                    iconData = MedusaIcons.moon;
                    break;
                }
                return SettingsTile(
                  title: Text(title),
                  leading: Icon(iconData),
                  trailing: controller.themeMode == e ? const Icon(Icons.check) : null,
                  onPressed: (_) async => await controller.changeThemeMode(e),
                );
              }).toList(),
            ),
            SettingsSection(
              // title: Text(tr.language),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  title: Text(tr.language),
                  value: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LanguageService.languageModel.nativeName),
                      if (LanguageService.languageModel.name != LanguageService.languageModel.nativeName)
                        const SizedBox(width: 6.0),
                      if (LanguageService.languageModel.name != LanguageService.languageModel.nativeName)
                        Text(LanguageService.languageModel.name),
                    ],
                  ),
                  leading: const Icon(Icons.language),
                  onPressed: (_) async => await showBarModalBottomSheet(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (context) => const LanguageSelectionView(),
                  ),
                ),
                SettingsTile.switchTile(
                    activeSwitchColor: ColorManager.primary,
                    initialValue: StorageService.appSettings.isDrawer,
                    onToggle: (val) async {
                      await showOkCancelAlertDialog(
                              context: context,
                              title: 'Switch to ${val ? 'drawer' : 'navigation bar'}',
                              message: 'Are you sure you want to switch, app will restart?',
                              okLabel: 'Restart App',
                              isDestructiveAction: true)
                          .then((value) async {
                        if (value == OkCancelResult.ok) {
                          await StorageService.instance
                              .updateAppSettings(StorageService.appSettings.copyWith(isDrawer: val));
                          controller.update();
                          Get.offAllNamed(Routes.SPLASH);
                        }
                      });
                    },
                    title: const Text('Drawer')),
              ],
            ),
          ],
        ),
      );
    });
  }
}
