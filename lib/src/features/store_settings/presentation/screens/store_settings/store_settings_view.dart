import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/extensions/settings_list_tile_extension.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
              title: const Text('General'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(LucideIcons.store),
                  title: const Text('Store'),
                  onPressed: (_) => context.pushRoute(const StoreDetailsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(LucideIcons.users),
                  title: const Text('Users'),
                  onPressed: (_) => context.pushRoute(const TeamRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Regions'),
                  onPressed: (context) => context.pushRoute(const RegionsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.percent),
                  title: const Text('Tax Regions'),
                  // onPressed: (_) => context.pushRoute(const TaxSettingsSelectRegionRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Return Reasons'),
                  onPressed: (_) => context.pushRoute(const ReturnReasonsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.call_split),
                  title: const Text('Sales channels'),
                  onPressed: (_) => context.pushRoute(const SalesChannelsRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.local_shipping_outlined),
                  title: const Text('Locations & Shipping'),
                  onPressed: (_) {},
                ),
                // SettingsTile.navigation(
                //   leading: const Icon(Icons.currency_exchange),
                //   title: const Text('Currencies'),
                //   onPressed: (_) => context.pushRoute(const CurrenciesRoute()),
                // ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.group),
                  title: const Text('Invites'),
                  onPressed: (_) => context.pushRoute(const InvitesRoute()),
                ),
                // SettingsTile.navigation(
                //   leading: const Icon(Icons.mail),
                //   title: const Text('Support'),
                // ),
              ],
            ),
            SettingsSection(
              title: const Text('Developer'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(LucideIcons.rotateCcwKey),
                  title: const Text('Publishable API Keys'),
                  onPressed: (_) => context.pushRoute(const PublishableApiKeysRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(LucideIcons.key),
                  title: const Text('Secret API Keys'),
                  onPressed: (_) => context.pushRoute(const SecretApiKeysRoute()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(LucideIcons.gitBranch),
                  title: const Text('Workflows'),
                  // onPressed: (_) => context.pushRoute(const ApiKeyManagementRoute()),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('My Account'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(LucideIcons.user),
                  title: const Text('Profile'),
                  onPressed: (_) => context.pushRoute(const PersonalInformationRoute()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
