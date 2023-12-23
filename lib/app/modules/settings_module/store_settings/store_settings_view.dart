import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/drawer_widget.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../../../core/utils/colors.dart';

@RoutePage()
class StoreSettingsView extends StatelessWidget {
  const StoreSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store Settings')),
      drawer: const AppDrawer(),
      drawerEdgeDragWidth: context.drawerEdgeDragWidth,
      body: SafeArea(
          child: SettingsList(
        lightTheme: SettingsThemeData(
            settingsListBackground: context.theme.scaffoldBackgroundColor,
            settingsSectionBackground: context.theme.cardColor),
        darkTheme: SettingsThemeData(
            settingsListBackground: context.theme.scaffoldBackgroundColor,
            settingsSectionBackground: context.theme.cardColor),
        sections: [
          SettingsSection(
            title: const Text('Manage the settings for your Medusa store'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.location_on, color: ColorManager.primary),
                title: const Text('Regions'),
                onPressed: (context) => context.pushRoute(const RegionsRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.store, color: ColorManager.primary),
                title: const Text('Store Details'),
                onPressed: (_) => context.pushRoute(const StoreDetailsRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.attach_money, color: ColorManager.primary),
                title: const Text('Return Reasons'),
                onPressed: (_) => context.pushRoute(const ReturnReasonsRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.face, color: ColorManager.primary),
                title: const Text('Personal Information'),
                onPressed: (_) =>
                    context.pushRoute(const PersonalInformationRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.percent, color: ColorManager.primary),
                title: const Text('Tax Settings'),
                onPressed: (_) =>
                    context.pushRoute(const TaxSettingsSelectRegionRoute()),
              ),
              SettingsTile.navigation(
                leading:
                    Icon(Icons.currency_exchange, color: ColorManager.primary),
                title: const Text('Currencies'),
                onPressed: (_) => context.pushRoute(const CurrenciesRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.local_shipping_outlined,
                    color: ColorManager.primary),
                title: const Text('Shipping'),
                onPressed: (_) {},
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.call_split, color: ColorManager.primary),
                title: const Text('Sales channels'),
                onPressed: (_) => context.pushRoute(const SalesChannelsRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.key, color: ColorManager.primary),
                title: const Text('API key management'),
                onPressed: (_) =>
                    context.pushRoute(const ApiKeyManagementRoute()),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.group, color: ColorManager.primary),
                title: const Text('The Team'),
                onPressed: (_) => context.pushRoute(const TeamRoute()),
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
