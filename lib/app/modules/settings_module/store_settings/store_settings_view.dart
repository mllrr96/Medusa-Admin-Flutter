import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../core/utils/colors.dart';
import '../../../routes/app_pages.dart';

class StoreSettingsView extends StatelessWidget {
  const StoreSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Settings'),
        leading: const AdaptiveBackButton(),
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
                onPressed: (_) => Get.toNamed(Routes.RETURN_REASONS),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.face, color: ColorManager.primary),
                title: const Text('Personal Information'),
                onPressed: (_) => Get.toNamed(Routes.PERSONAL_INFORMATION),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.percent, color: ColorManager.primary),
                title: const Text('Tax Settings'),
                onPressed: (_) => Get.toNamed(Routes.TAX_SETTINGS_SELECT_REGION),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.currency_exchange, color: ColorManager.primary),
                title: const Text('Currencies'),
                onPressed: (_) => Get.toNamed(Routes.CURRENCIES),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.local_shipping_outlined, color: ColorManager.primary),
                title: const Text('Shipping'),
                onPressed: (_) => Get.toNamed(Routes.SHIPPING),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.local_shipping_outlined, color: ColorManager.primary),
                title: const Text('Sales channels'),
                onPressed: (_) => Get.toNamed(Routes.SALES_CHANNELS),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.group, color: ColorManager.primary),
                title: const Text('The Team'),
                onPressed: (_) => Get.toNamed(Routes.TEAM),
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
