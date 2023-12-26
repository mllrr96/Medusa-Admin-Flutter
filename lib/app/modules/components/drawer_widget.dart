import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/medusa_icons_icons.dart';
import '../../../core/utils/strings.dart';
import '../../data/service/storage_service.dart';
import '../auth_module/sign_in/views/sign_in_view.dart';
import 'easy_loading.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  ThemeMode themeMode = StorageService.instance.loadThemeMode();
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final store = StoreService.store;
    final packageInfo = StorageService.packageInfo;
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;

    signOut() async {
      await showOkCancelAlertDialog(
              context: context,
              title: 'Sign out',
              message: 'Are you sure you want to sign out?',
              okLabel: 'Sign Out',
              isDestructiveAction: true)
          .then(
        (value) async {
          if (value == OkCancelResult.ok) {
            loading();
            final result = await AuthRepo().signOut();
            if (result) {
              await Get.delete(force: true);
              await StorageService.instance.clearCookie().then(
                  (value) => context.router.replaceAll([const SplashRoute()]));
              dismissLoading();
            } else {
              EasyLoading.showError('Error signing out');
            }
          }
        },
      );
    }


    List<Widget> items = [
      NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.cart),
        label: Text('Orders'),
      ),
      NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.cart_badge_plus),
        label: Text('Draft Orders'),
      ),
      Divider(indent: 28, endIndent: 28),
      NavigationDrawerDestination(
        icon: Icon(MedusaIcons.tag),
        label: Text('Products'),
      ),
      NavigationDrawerDestination(
        icon: Icon(MedusaIcons.tag),
        label: Text('Categories'),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.collections_bookmark),
        label: Text('Collections'),
      ),
      Divider(indent: 28, endIndent: 28),
      NavigationDrawerDestination(
        icon: Icon(Icons.person),
        label: Text('Customers'),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.groups),
        label: Text('Customer Groups'),
      ),
      Divider(indent: 28, endIndent: 28),
      NavigationDrawerDestination(
        icon: Icon(Icons.discount_outlined),
        label: Text('Discounts'),
      ),
      NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.gift),
        label: Text('Gift Cards'),
      ),
      NavigationDrawerDestination(
        icon: Icon(MedusaIcons.currency_dollar),
        label: Text('Pricing'),
      ),
      Divider(indent: 28, endIndent: 28),
      NavigationDrawerDestination(
        icon: Icon(Icons.settings_applications),
        label: Text('Store Settings'),
      ),
      NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.settings),
        label: Text('App Settings'),
      ),
      NavigationDrawerDestination(
        icon: Icon(Icons.logout, color: Colors.red),
        label: Text('Sign Out'),
      ),
      Divider(indent: 28, endIndent: 28),
      NavigationDrawerDestination(
        icon: Icon(Icons.login),
        label: Text('Re-Authenticate'),
      ),
    ];


    return NavigationDrawer(
        key: const PageStorageKey<String>('navigationDrawer'),
        selectedIndex: context.tabsRouter.activeIndex,
        onDestinationSelected: (index) async {
          if (index == 12) {
            await signOut();
            return;
          }
          if (index == 13) {
            await await showBarModalBottomSheet(
                overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                context: context,
                builder: (context) => const SignInView());
            return;
          }
          context.closeDrawer();
          context.tabsRouter.setActiveIndex(index);
        },
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 20, 12, 0),
            padding: const EdgeInsets.only(left: 16.0),
            height: 56,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: context.theme.colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Store',
                        style: smallTextStyle?.copyWith(color: manatee)),
                    Text(store.name, style: mediumTextStyle),
                  ],
                ),
                IconButton(
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () async {
                    switch (StorageService.instance.loadThemeMode()) {
                      case ThemeMode.system:
                        await StorageService.instance
                            .saveThemeMode(ThemeMode.light);
                        break;
                      case ThemeMode.light:
                        await StorageService.instance
                            .saveThemeMode(ThemeMode.dark);
                        break;
                      case ThemeMode.dark:
                        await StorageService.instance
                            .saveThemeMode(ThemeMode.system);
                        break;
                    }
                    themeMode = StorageService.instance.loadThemeMode();
                    setState(() {});
                  },
                  icon: Icon(themeIcon(themeMode)),
                ),
              ],
            ),
          ),
          const Divider(indent: 28, endIndent: 28),
          ...items,
          Container(
            margin: const EdgeInsets.fromLTRB(12, 20, 12, 20),
            padding: const EdgeInsets.only(left: 16.0),
            height: 56,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: context.theme.colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'medusa',
                      child: Image.asset(
                        'assets/images/medusa.png',
                        // height: 32,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(appName,
                            style: smallTextStyle?.copyWith(color: manatee)),
                        Text('Version $version+$code',
                            style: smallTextStyle?.copyWith(color: manatee)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () {
                    _showAppAboutDialog(context);
                  },
                  icon: Icon(Icons.info_outline, color: ColorManager.manatee),
                ),
              ],
            ),
          ),
        ]);

    // OLD DRAWER, KEEP FOR REFERENCE
    // if (!material3) {
    //   return AnnotatedRegion<SystemUiOverlayStyle>(
    //     value: context.theme.appBarTheme.systemOverlayStyle!.copyWith(
    //         systemNavigationBarColor:
    //         context.theme.drawerTheme.backgroundColor),
    //     child: Drawer(
    //         shape: const RoundedRectangleBorder(),
    //         child: SafeArea(
    //           bottom: false,
    //           child: Column(
    //             children: [
    //               Container(
    //                 color: context.theme.cardColor,
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 16.0, vertical: 6.0),
    //                 alignment: Alignment.centerLeft,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text('Store',
    //                             style:
    //                             smallTextStyle?.copyWith(color: manatee)),
    //                         Text(store.name, style: mediumTextStyle),
    //                       ],
    //                     ),
    //                     IconButton(
    //                       padding: const EdgeInsets.all(16.0),
    //                       onPressed: () async {
    //                         switch (StorageService.instance.loadThemeMode()) {
    //                           case ThemeMode.system:
    //                             await StorageService.instance
    //                                 .saveThemeMode(ThemeMode.light);
    //                             break;
    //                           case ThemeMode.light:
    //                             await StorageService.instance
    //                                 .saveThemeMode(ThemeMode.dark);
    //                             break;
    //                           case ThemeMode.dark:
    //                             await StorageService.instance
    //                                 .saveThemeMode(ThemeMode.system);
    //                             break;
    //                         }
    //                         themeMode = StorageService.instance.loadThemeMode();
    //                         setState(() {});
    //                       },
    //                       icon: Icon(themeIcon(themeMode)),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               divider,
    //               Expanded(
    //                 child: ListView(
    //                   shrinkWrap: true,
    //                   children: [
    //                     divider,
    //                     ListTile(
    //                       title: const Text('Orders'),
    //                       trailing: context.tabsRouter.activeIndex == 0
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       leading: const Icon(CupertinoIcons.cart),
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(0);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Draft Orders'),
    //                       leading: const Icon(CupertinoIcons.cart_badge_plus),
    //                       trailing: context.tabsRouter.activeIndex == 1
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(1);
    //                       },
    //                     ),
    //                     divider,
    //                     ListTile(
    //                       title: const Text('Products'),
    //                       leading: const Icon(MedusaIcons.tag),
    //                       trailing: context.tabsRouter.activeIndex == 2
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(2);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Categories'),
    //                       leading: const Icon(MedusaIcons.tag),
    //                       trailing: context.tabsRouter.activeIndex == 3
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(3);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Collections'),
    //                       leading: const Icon(Icons.collections_bookmark),
    //                       trailing: context.tabsRouter.activeIndex == 4
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(4);
    //                       },
    //                     ),
    //                     divider,
    //                     ListTile(
    //                       title: const Text('Customers'),
    //                       leading: Platform.isAndroid
    //                           ? const Icon(Icons.person)
    //                           : const Icon(MedusaIcons.users),
    //                       trailing: context.tabsRouter.activeIndex == 5
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(5);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Customer Groups'),
    //                       leading: const Icon(Icons.groups),
    //                       trailing: context.tabsRouter.activeIndex == 6
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(6);
    //                       },
    //                     ),
    //                     divider,
    //                     ListTile(
    //                       title: const Text('Discounts'),
    //                       leading: const Icon(Icons.discount_outlined),
    //                       trailing: context.tabsRouter.activeIndex == 7
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(7);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Gift Cards'),
    //                       leading: const Icon(CupertinoIcons.gift),
    //                       trailing: context.tabsRouter.activeIndex == 8
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(8);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Pricing'),
    //                       leading: const Icon(MedusaIcons.currency_dollar),
    //                       trailing: context.tabsRouter.activeIndex == 9
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(9);
    //                       },
    //                     ),
    //                     divider,
    //                     ListTile(
    //                       title: const Text('Store Settings'),
    //                       leading: const Icon(Icons.settings_applications),
    //                       trailing: context.tabsRouter.activeIndex == 10
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(10);
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('App Settings'),
    //                       leading: Platform.isIOS
    //                           ? const Icon(CupertinoIcons.settings)
    //                           : const Icon(Icons.settings),
    //                       trailing: context.tabsRouter.activeIndex == 11
    //                           ? Icon(Icons.circle,
    //                           color: ColorManager.primary, size: 12)
    //                           : null,
    //                       onTap: () {
    //                         context.closeDrawer();
    //                         context.tabsRouter.setActiveIndex(11);
    //                       },
    //                     ),
    //                     divider,
    //                     ListTile(
    //                       leading: const Icon(Icons.exit_to_app,
    //                           color: Colors.redAccent),
    //                       title: const Text('Sign out'),
    //                       onTap: () async => await signOut(),
    //                     ),
    //                     divider,
    //                     const ListTile(
    //                       leading: Icon(Icons.bug_report),
    //                       title: Text('Debugging'),
    //                     ),
    //                     ListTile(
    //                       leading: const Icon(Icons.refresh,
    //                           color: Colors.redAccent),
    //                       title: const Text('Re-Authenticate'),
    //                       onTap: () async {
    //                         await showBarModalBottomSheet(
    //                             overlayStyle: context
    //                                 .theme.appBarTheme.systemOverlayStyle,
    //                             context: context,
    //                             builder: (context) => const SignInView());
    //                       },
    //                     ),
    //                     Row(
    //                       children: [
    //                         Hero(
    //                           tag: 'medusa',
    //                           child: Image.asset(
    //                             'assets/images/medusa.png',
    //                             scale: 15,
    //                           ),
    //                         ),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Text(appName,
    //                                 style: smallTextStyle?.copyWith(
    //                                     color: manatee)),
    //                             Text('Version $version+$code',
    //                                 style: smallTextStyle?.copyWith(
    //                                     color: manatee)),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )),
    //   );
    // }


  }

  IconData themeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return MedusaIcons.sun;
      case ThemeMode.dark:
        return MedusaIcons.moon;
    }
  }
}

class DrawerDestination {
  const DrawerDestination({
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final Widget label;
}

void _showAppAboutDialog(BuildContext context, [bool useRootNavigator = true]) {
  final ThemeData theme = Theme.of(context);
  final TextStyle footerStyle = theme.textTheme.bodySmall!;

  final Size mediaSize = MediaQuery.sizeOf(context);
  final double width = mediaSize.width;
  final double height = mediaSize.height;

  showAboutDialog(
    context: context,
    applicationName: AppConstants.appName,
    applicationVersion: StorageService.packageInfo.version,
    useRootNavigator: useRootNavigator,
    applicationIcon: Image.asset('assets/images/medusa.png', scale: 12),
    applicationLegalese: '© 2020 - 2023 \nMohammed Ragheb \nMIT License',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter 3.16.5 stable, '
                    '\nMedia size (w:${width.toStringAsFixed(0)}, '
                    'h:${height.toStringAsFixed(0)})',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
