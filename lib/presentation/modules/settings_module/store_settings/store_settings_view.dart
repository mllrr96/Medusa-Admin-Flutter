import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/settings_list_tile_extension.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';

@RoutePage()
class StoreSettingsView extends StatelessWidget {
  const StoreSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      drawerEdgeDragWidth: context.drawerEdgeDragWidth,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const MedusaSliverAppBar(title: Text('Store Settings')),
        ],
        body: SettingsList(
          brightness: context.theme.brightness,
          lightTheme: context.settingsListLightTheme,
          darkTheme: context.settingsListDarkTheme,
          sections: [
            SettingsSection(
              title: const Text('Manage the settings for your Medusa store'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Regions'),
                  onPressed: (context) =>
                      context.pushRoute(const RegionsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.store),
                  title: const Text('Store Details'),
                  onPressed: (_) =>
                      context.pushRoute(const StoreDetailsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Return Reasons'),
                  onPressed: (_) =>
                      context.pushRoute(const ReturnReasonsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.face),
                  title: const Text('Personal Information'),
                  onPressed: (_) =>
                      context.pushRoute(const PersonalInformationRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.percent),
                  title: const Text('Tax Settings'),
                  onPressed: (_) =>
                      context.pushRoute(const TaxSettingsSelectRegionRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.currency_exchange),
                  title: const Text('Currencies'),
                  onPressed: (_) => context.pushRoute(const CurrenciesRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.local_shipping_outlined),
                  title: const Text('Shipping'),
                  onPressed: (_) {},
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.call_split),
                  title: const Text('Sales channels'),
                  onPressed: (_) =>
                      context.pushRoute(const SalesChannelsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.key),
                  title: const Text('API key management'),
                  onPressed: (_) =>
                      context.pushRoute(const ApiKeyManagementRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.group),
                  title: const Text('The Team'),
                  onPressed: (_) => context.pushRoute(const TeamRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.mail),
                  title: const Text('Support'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
