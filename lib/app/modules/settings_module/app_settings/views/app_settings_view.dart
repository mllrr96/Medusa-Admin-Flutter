import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart' hide GetStringUtils;
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/data/service/theme_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_date_picker.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../data/service/language_service.dart';
import '../../../components/language_selection/language_selection_view.dart';
import '../controllers/app_settings_controller.dart';

@RoutePage()
class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(
        init: AppSettingsController(),
        builder: (controller) {
          final tr = context.tr;
          final appSettings = StorageService.appSettings;
          return Scaffold(
            appBar: AppBar(
              title: const Text('App Settings'),
            ),
            drawer: const AppDrawer(),
            drawerEdgeDragWidth: context.drawerEdgeDragWidth,
            body: SettingsList(
              contentPadding: EdgeInsets.zero,
              lightTheme: context.settingsListLightTheme,
              darkTheme: context.settingsListDarkTheme,
              sections: [
                SettingsSection(title: const Text('App settings'), tiles: [
                  SettingsTile.navigation(
                    title: Text(tr.sidebarOrders),
                    leading: const Icon(CupertinoIcons.cart),
                    onPressed: (_) =>
                        context.pushRoute(const OrderSettingsRoute()),
                  )
                ]),
                SettingsSection(
                  title: const Text('Theme'),
                  tiles: [
                    SettingsTile.navigation(
                      title: const Text('Color Scheme'),
                      value: Text(appSettings.colorScheme.name.capitalize),
                      leading: const Icon(Icons.color_lens),
                      onPressed: (_) async =>
                          await showConfirmationDialog<FlexScheme>(
                                  context: context,
                                  title: 'Color Scheme',
                                  initialSelectedActionKey:
                                      appSettings.colorScheme,
                                  actions: FlexScheme.values
                                      .map((e) => AlertDialogAction<FlexScheme>(
                                            label: e.name.capitalize,
                                            key: e,
                                          ))
                                      .toList())
                              .then((result) {
                        if (result == null) return;
                        if (result == appSettings.colorScheme) return;
                        StorageService.instance.updateAppSettings(
                            appSettings.copyWith(colorScheme: result));
                        controller.update();
                        ThemeController.instance.update();
                      }),
                    ),
                    SettingsTile.switchTile(
                        initialValue: appSettings.useMaterial3,
                        onToggle: (val) async {
                          final storageService = StorageService.instance;
                          final appSettings = StorageService.appSettings;
                          await storageService.updateAppSettings(
                              appSettings.copyWith(
                                  useMaterial3: !appSettings.useMaterial3));
                          controller.update();
                          ThemeController.instance.update();
                        },
                        title: const Text('Use Material 3')),
                  ],
                ),
                SettingsSection(
                  title: const Text('Appearance'),
                  tiles: [
                    ...ThemeMode.values.map((e) {
                      String title = 'Automatic (Follow system)';
                      IconData iconData = Icons.brightness_auto;
                      switch (e) {
                        case ThemeMode.system:
                          break;
                        case ThemeMode.light:
                          title = 'Light';
                          iconData = MedusaIcons.sun;
                          break;
                        case ThemeMode.dark:
                          title = 'Dark';
                          iconData = MedusaIcons.moon;
                          break;
                      }
                      return SettingsTile(
                        title: Text(title),
                        leading: Icon(iconData),
                        trailing: controller.themeMode == e
                            ? const Icon(Icons.check)
                            : null,
                        onPressed: (_) async =>
                            await controller.changeThemeMode(e),
                      );
                    }),
                  ],
                ),
                SettingsSection(
                  title: const Text('Language and region'),
                  tiles: [
                    SettingsTile.navigation(
                      title: Text(tr.personalInformationLanguageSettingsTitle),
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
                        backgroundColor: context.theme.scaffoldBackgroundColor,
                        overlayStyle:
                            context.theme.appBarTheme.systemOverlayStyle,
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
                            onTap: () async => await adaptiveDateTimePicker(
                                context: context, forceAndroidPicker: true),
                            child: const Text(
                                'Use Android date picker instead of iOS picker, Click here for demo')),
                        leading: const Icon(CupertinoIcons.calendar),
                        onPressed: (_) async {
                          final storageService = StorageService.instance;
                          final appSettings = StorageService.appSettings;
                          await storageService.updateAppSettings(
                              appSettings.copyWith(
                                  useAndroidPicker:
                                      !appSettings.useAndroidPicker));
                          controller.update();
                        },
                        initialValue:
                            StorageService.appSettings.useAndroidPicker,
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
                      value: Text(DateTime.now().formatDate()),
                      leading: const Icon(Icons.date_range),
                      onPressed: (_) async =>
                          await showConfirmationDialog<DateFormatOptions>(
                                  context: context,
                                  title: 'Date format',
                                  initialSelectedActionKey:
                                      appSettings.dateFormatOptions,
                                  actions: DateFormatOptions.values
                                      .map((e) =>
                                          AlertDialogAction<DateFormatOptions>(
                                            label: DateFormat(e.toPattern())
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
                      value: Text(DateTime.now().formatTime()),
                      leading: const Icon(Icons.timer_outlined),
                      onPressed: (_) async => await showModalActionSheet<
                                  TimeFormatOptions>(
                              context: context,
                              title: 'Time Format',
                              actions: TimeFormatOptions.values
                                  .map((e) => SheetAction<TimeFormatOptions>(
                                        key: e,
                                        label:
                                            '${DateFormat(e.format()).format(DateTime.now())}${e == TimeFormatOptions.amPm ? '' : ' (24-hour)'}',
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
