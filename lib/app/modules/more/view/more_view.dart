import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/more/controller/more_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:settings_ui/settings_ui.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return GetBuilder<MoreController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Medusa')),
          body: SafeArea(
            child: ListView(
              children: [
                SettingsList(
                  contentPadding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  lightTheme: SettingsThemeData(
                      settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                      settingsSectionBackground: Theme.of(context).cardColor),
                  darkTheme: SettingsThemeData(
                      settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                      settingsSectionBackground: Theme.of(context).cardColor),
                  sections: [
                    SettingsSection(
                      title: const Text('More'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.discount_outlined),
                          title: const Text('Discounts'),
                          onPressed: (_) => Get.toNamed(Routes.DISCOUNTS),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(CupertinoIcons.gift),
                          title: const Text('Gift Cards'),
                          onPressed: (_) => Get.toNamed(Routes.GIFT_CARDS),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(MedusaIcons.currency_dollar),
                          title: const Text('Pricing'),
                          onPressed: (_) => Get.toNamed(Routes.PRICING),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: const Text('Settings'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.store),
                          title: const Text('Store Settings'),
                          onPressed: (_) => Get.toNamed(Routes.STORE_SETTINGS),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(MedusaIcons.cog_six_tooth),
                          title: const Text('App Setting'),
                          onPressed: (_) => {},
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
                          leading: const Icon(MedusaIcons.sun),
                          trailing: controller.themeMode == ThemeMode.light ? const Icon(Icons.check) : null,
                          onPressed: (_) async => await controller.changeThemeMode(ThemeMode.light),
                        ),
                        SettingsTile(
                          title: const Text('Dark'),
                          leading: const Icon(MedusaIcons.moon),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.animate = !controller.animate;
                        controller.update();
                      },
                      child: Hero(
                        tag: 'medusa',
                        child: Image.asset('assets/images/medusa.png', height: 100, width: 100).animate(
                          effects: [const RotateEffect()],
                          target: controller.animate ? 1 : 0,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.appName, style: smallTextStyle?.copyWith(color: lightWhite)),
                        Text('Version ${controller.version}+${controller.code}',
                            style: smallTextStyle?.copyWith(color: lightWhite)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.0)
              ],
            ),
          ),
        );
      },
    );
  }
}
