import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_date_picker.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../data/service/language_service.dart';
import '../../../components/language_selection/language_selection_view.dart';
import '../controllers/app_settings_controller.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      final tr = AppLocalizations.of(context)!;
      final appSettings = StorageService.appSettings;
      return Scaffold(
        appBar: AppBar(
          leading: const AdaptiveBackButton(),
          title: const Text('App Settings'),
        ),
        body: SettingsList(
          contentPadding: EdgeInsets.zero,
          lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
              settingsSectionBackground: Theme.of(context).cardColor),
          darkTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
              settingsSectionBackground: Theme.of(context).cardColor),
          sections: [
            SettingsSection(
              title: const Text('App settings'),
              tiles: [
                SettingsTile.navigation(
                  title: Text(tr.orders),
                  leading: const Icon(CupertinoIcons.cart),
                  onPressed: (_) => Get.toNamed(Routes.ORDER_SETTINGS),
                )
              ]
            ),
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
                  trailing: controller.themeMode == e
                      ? const Icon(Icons.check)
                      : null,
                  onPressed: (_) async => await controller.changeThemeMode(e),
                );
              }).toList(),
            ),
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  title: Text(tr.language),
                  value: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LanguageService.languageModel.nativeName),
                      if (LanguageService.languageModel.name !=
                          LanguageService.languageModel.nativeName)
                        const SizedBox(width: 6.0),
                      if (LanguageService.languageModel.name !=
                          LanguageService.languageModel.nativeName)
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
              ],
            ),
            SettingsSection(
              title: const Text('DateTime settings'),
              tiles: <SettingsTile>[
                if (GetPlatform.isIOS)
                  SettingsTile.switchTile(
                    title: const Text('Use Android date picker'),
                    activeSwitchColor: ColorManager.primary,
                    description: GestureDetector(
                        onTap: () async =>
                            await adaptiveDateTimePicker(context: context, forceAndroidPicker: true),
                        child: const Text(
                            'Use Android date picker instead of iOS picker, Click here for demo')),
                    leading: const Icon(CupertinoIcons.calendar),
                    onPressed: (_) async {
                      final storageService = StorageService.instance;
                      final appSettings = StorageService.appSettings;
                      await storageService.updateAppSettings(
                          appSettings.copyWith(useAndroidPicker: !appSettings.useAndroidPicker));
                      controller.update();
                    },
                    initialValue: StorageService.appSettings.useAndroidPicker,
                    onToggle: (bool value) async {
                      final storageService = StorageService.instance;
                      final appSettings = StorageService.appSettings;
                      await storageService.updateAppSettings(
                          appSettings.copyWith(useAndroidPicker: value));
                      controller.update();
                    },
                  ),
                SettingsTile.navigation(
                  title: const Text('Date format'),
                  value: Text(formatDate(DateTime.now())),
                  leading: const Icon(Icons.date_range),
                  onPressed: (_) async => await showConfirmationDialog<
                              DateFormatOptions>(
                          context: context,
                          title: 'Date format',
                          initialSelectedActionKey:
                              appSettings.dateFormatOptions,
                          actions: DateFormatOptions.values
                              .map((e) => AlertDialogAction<DateFormatOptions>(
                                    label: DateFormat(e.format())
                                        .format(DateTime.now()),
                                    key: e,
                                  ))
                              .toList())
                      .then((result) {
                    if (result == null) return;
                    if (result == appSettings.dateFormatOptions) return;
                    StorageService.instance.updateAppSettings(
                        appSettings.copyWith(dateFormatOptions: result));
                    controller.update();
                  }),
                ),
                SettingsTile.navigation(
                  title: const Text('Time format'),
                  value: Text(formatTime(DateTime.now())),
                  leading: const Icon(Icons.timer_outlined),
                  onPressed: (_) async =>
                      await showModalActionSheet<TimeFormatOptions>(
                              context: context,
                              title: 'Time Format',
                              actions: TimeFormatOptions.values
                                  .map((e) => SheetAction<TimeFormatOptions>(
                                        key: e,
                                        label: '${DateFormat(e.format())
                                            .format(DateTime.now())}${e == TimeFormatOptions.amPm ? '': ' (24-hour)'}',
                                      ))
                                  .toList())
                          .then((result) {
                    if (result == null) return;
                    if (result == appSettings.timeFormatOptions) return;
                    StorageService.instance.updateAppSettings(
                        appSettings.copyWith(timeFormatOptions: result));
                    controller.update();
                  }),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
