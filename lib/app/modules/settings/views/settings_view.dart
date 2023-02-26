import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:settings_ui/settings_ui.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            centerTitle: true,
          ),
          body: SafeArea(
              child: SettingsList(
            lightTheme: SettingsThemeData(
                settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                settingsSectionBackground: Theme.of(context).cardColor),
            darkTheme: SettingsThemeData(
                settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                settingsSectionBackground: Theme.of(context).cardColor),
            sections: [
              SettingsSection(
                title: const Text('Manage the settings for your Medusa store'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: Icon(Icons.location_on, color: ColorManager.primary),
                    title: const Text('Regions'),
                    onPressed: (_) => Get.toNamed(Routes.REGIONS),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.store, color: ColorManager.primary),
                    title: const Text('Store Details'),
                    onPressed: (_) => Get.toNamed(Routes.STORE_DETAILS),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.attach_money, color: ColorManager.primary),
                    title: const Text('Return Reasons'),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.face, color: ColorManager.primary),
                    title: const Text('Personal Information'),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.percent, color: ColorManager.primary),
                    title: const Text('Tax Settings'),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.currency_exchange, color: ColorManager.primary),
                    title: const Text('Currencies'),
                    onPressed: (_) => Get.toNamed(Routes.CURRENCIES),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.local_shipping_outlined, color: ColorManager.primary),
                    title: const Text('Shipping'),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.group, color: ColorManager.primary),
                    title: const Text('The Team'),
                  ),
                  SettingsTile.navigation(
                    leading: Icon(Icons.mail, color: ColorManager.primary),
                    title: const Text('Support'),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('Appearance'),
                tiles: <SettingsTile>[
                  SettingsTile(
                    title: const Text('Automatic (Follow system)'),
                    leading: const Icon(Icons.brightness_auto),
                    trailing: controller.themeMode == ThemeMode.system ? const Icon(Icons.check) : null,
                    onPressed: (_) async => await controller.changeThemeMode(ThemeMode.system),
                  ),
                  SettingsTile(
                    title: const Text('Light'),
                    leading: const Icon(Icons.brightness_7),
                    trailing: controller.themeMode == ThemeMode.light ? const Icon(Icons.check) : null,
                    onPressed: (_) async => await controller.changeThemeMode(ThemeMode.light),
                  ),
                  SettingsTile(
                    title: const Text('Dark'),
                    leading: const Icon(Icons.brightness_2),
                    trailing: controller.themeMode == ThemeMode.dark ? const Icon(Icons.check) : null,
                    onPressed: (_) async => await controller.changeThemeMode(ThemeMode.dark),
                  ),
                ],
              ),
              SettingsSection(
                tiles: <SettingsTile>[
                  SettingsTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                    title: const Text('Sign Out'),
                    onPressed: (_) async => await controller.signOut(context),
                  ),
                ],
              ),
            ],
          )),
        );
      },
    );
  }
}
