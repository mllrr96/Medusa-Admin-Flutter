import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.store, color: ColorManager.primary),
                title: const Text('Store Details'),
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
        ],
      )),
    );
  }
}
