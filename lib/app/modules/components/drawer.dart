import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/medusa_icons_icons.dart';
import '../../data/service/storage_service.dart';
import 'easy_loading.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String appName = '';
  String version = '';
  String code = '';
  @override
  void initState() {
    super.initState();
    loadAppVersion();
  }

  loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
      code = packageInfo.buildNumber;
      appName = packageInfo.appName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const divider = Divider(height: 0);
    final tr = AppLocalizations.of(context)!;
    return Drawer(
        child: SafeArea(
          bottom: false,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/medusa.png',
                  scale: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appName, style: smallTextStyle?.copyWith(color: lightWhite)),
                    Text('Version $version+$code', style: smallTextStyle?.copyWith(color: lightWhite)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          divider,
          ListView(
            shrinkWrap: true,
            children: [
              divider,
              ListTile(
                title: const Text('Orders'),
                leading: const Icon(CupertinoIcons.cart),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              ListTile(
                title: const Text('Draft Orders'),
                leading: const Icon(CupertinoIcons.cart_badge_plus),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.DRAFT_ORDERS);
                },
              ),
              divider,
              ListTile(
                title: const Text('Products'),
                leading: const Icon(MedusaIcons.tag),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              ListTile(
                title: const Text('Collections'),
                leading: const Icon(Icons.collections_bookmark),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              divider,
              ListTile(
                title: const Text('Customers'),
                leading: Platform.isAndroid ? const Icon(Icons.person) : const Icon(MedusaIcons.users),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              ListTile(
                title: const Text('Customer Groups'),
                leading: const Icon(Icons.groups),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              divider,
              ListTile(
                title: const Text('Discounts'),
                leading: const Icon(Icons.discount_outlined),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              ListTile(
                title: const Text('Gift Cards'),
                leading: const Icon(CupertinoIcons.gift),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              ListTile(
                title: const Text('Pricing'),
                leading: const Icon(MedusaIcons.currency_dollar),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.ORDERS);
                },
              ),
              divider,
              ListTile(
                title: const Text('Store Settings'),
                leading: const Icon(Icons.settings_applications),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.STORE_SETTINGS);
                },
              ),
              ListTile(
                title: const Text('App Settings'),
                leading: Platform.isIOS ? const Icon(CupertinoIcons.settings) : const Icon(Icons.settings),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.APP_SETTINGS);
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
                title: Text(tr.signOut),
                onTap: () async {
                  await showOkCancelAlertDialog(
                          context: context,
                          title: 'Sign out',
                          message: 'Are you sure you want to sign out?',
                          okLabel: 'Sign Out',
                          isDestructiveAction: true)
                      .then((value) async {
                    if (value == OkCancelResult.ok) {
                      loading();
                      final result = await AuthRepo().signOut();
                      if (result) {
                        await Get.delete(force: true);
                        await StorageService.instance.clearCookie();
                        Get.offAllNamed(Routes.SPLASH);
                        dismissLoading();
                      } else {
                        EasyLoading.showError('Error signing out');
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
