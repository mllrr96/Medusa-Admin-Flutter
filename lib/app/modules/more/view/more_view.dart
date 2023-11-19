import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/more/controller/more_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../core/utils/colors.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return GetBuilder<MoreController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Medusa')),
          body: SafeArea(
            child: ListView(
              controller: controller.scrollController,
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
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.discount_outlined),
                          title: Text(tr.sidebarDiscounts),
                          onPressed: (_) => Get.toNamed(Routes.DISCOUNTS),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(CupertinoIcons.gift),
                          title: Text(tr.sidebarGiftCards),
                          onPressed: (_) => Get.toNamed(Routes.GIFT_CARDS),
                          // onPressed: (_) {},
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(MedusaIcons.currency_dollar),
                          title: Text(tr.sidebarPricing),
                          onPressed: (_) => Get.toNamed(Routes.PRICING),
                          // onPressed: (_) {},
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Text(tr.sidebarSettings),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.store),
                          title: const Text('Store Settings'),
                          onPressed: (_) => Get.toNamed(Routes.STORE_SETTINGS),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(MedusaIcons.cog_six_tooth),
                          title: const Text('App Settings'),
                          onPressed: (_) => Get.toNamed(Routes.APP_SETTINGS),
                        ),
                      ],
                    ),
                    // SettingsSection(
                    //   title: Text(tr.appearance),
                    //   tiles: ThemeMode.values.map((e) {
                    //     String title = tr.automaticAppearance;
                    //     IconData iconData = Icons.brightness_auto;
                    //     switch (e) {
                    //       case ThemeMode.system:
                    //         break;
                    //       case ThemeMode.light:
                    //         title = tr.lightAppearance;
                    //         iconData = MedusaIcons.sun;
                    //         break;
                    //       case ThemeMode.dark:
                    //         title = tr.darkAppearance;
                    //         iconData = MedusaIcons.moon;
                    //         break;
                    //     }
                    //     return SettingsTile(
                    //       title: Text(title),
                    //       leading: Icon(iconData),
                    //       trailing: controller.themeMode == e ? const Icon(Icons.check) : null,
                    //       onPressed: (_) async => await controller.changeThemeMode(e),
                    //     );
                    //   }).toList(),
                    // ),
                    // SettingsSection(
                    //   // title: Text(tr.language),
                    //   tiles: <SettingsTile>[
                    //     SettingsTile.navigation(
                    //       title: Text(tr.language),
                    //       value: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(LanguageService.languageModel.nativeName),
                    //           if (LanguageService.languageModel.name != LanguageService.languageModel.nativeName)
                    //             const SizedBox(width: 6.0),
                    //           if (LanguageService.languageModel.name != LanguageService.languageModel.nativeName)
                    //             Text(LanguageService.languageModel.name),
                    //         ],
                    //       ),
                    //       leading: const Icon(Icons.language),
                    //       onPressed: (_) async => await showBarModalBottomSheet(
                    //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    //         context: context,
                    //         builder: (context) => const LanguageSelectionView(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                    GestureDetector(
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
