import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'easy_loading.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';

class ShadDrawer extends StatefulWidget {
  const ShadDrawer({super.key});

  @override
  State<ShadDrawer> createState() => _ShadDrawerState();
}

class _ShadDrawerState extends State<ShadDrawer> {
  Widget _buildShadButton({
    required String text,
    required IconData icon,
    required int index,
    required bool isSelected,
    void Function()? onPressed,
  }) {
    if (!isSelected) {
      return ShadButton.secondary(
        mainAxisAlignment: MainAxisAlignment.start,
        height: 56,
        width: double.infinity,
        onPressed: onPressed,
        text: Text(text),
        icon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            icon,
            size: 16,
          ),
        ),
      );
    }
    return ShadButton(
      mainAxisAlignment: MainAxisAlignment.start,
      height: 56,
      width: double.infinity,
      onPressed: () {
        context.tabsRouter.setActiveIndex(0);
        context.closeDrawer();
      },
      text: Text(text),
      icon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }

  final Map<String, (int, IconData)> _drawerItems = {
    'Orders': (0, CupertinoIcons.cart),
    'Draft Orders': (1, CupertinoIcons.cart_badge_plus),
    'Products': (2, MedusaIcons.tag),
    'Collections': (3, Icons.collections_bookmark),
    'Categories': (4, MedusaIcons.tag),
    'Customers': (5, Icons.person),
    'Customer Groups': (6, Icons.groups),
    'Discounts': (7, Icons.discount_outlined),
    'Gift Cards': (8, CupertinoIcons.gift),
    'Pricing': (9, MedusaIcons.currency_dollar),
    'Store Settings': (10, Icons.settings_applications),
    'App Settings': (11, CupertinoIcons.settings),
    'Sign Out': (12, Icons.logout),
  };

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final packageInfo = PreferenceService.packageInfo;
    String appName = packageInfo.appName;
    String version = packageInfo.version;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          loggedOut: (_) async {
            await AuthPreferenceService.instance.clearLoginData();
            await AuthPreferenceService.instance.clearExportFiles();
            await AuthPreferenceService.instance.clearLoginKey();
            dismissLoading();
            if (context.mounted) {
              context.router.replaceAll([SignInRoute()]);
            }
          },
          error: (e) {
            dismissLoading();
            context.showSnackBar(e.failure.toSnackBarString());
          },
        );
      },
      child: NavigationDrawer(
          key: const PageStorageKey<String>('shadNavigationDrawer'),
          selectedIndex: context.tabsRouter.activeIndex,
          onDestinationSelected: (index) async {
            if (index == 12) {
              await signOut();
              return;
            }
            context.closeDrawer();
            context.tabsRouter.setActiveIndex(index);
          },
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return ShadButton.outline(
                      size: ShadButtonSize.icon,
                      onPressed: () => context
                          .read<ThemeCubit>()
                          .updateThemeState(themeMode: state.themeMode.next),
                      icon: Icon(
                        state.themeMode.icon,
                        size: 16.0,
                      ),
                    );
                  },
                ),
                BlocBuilder<StoreBloc, StoreState>(
                  builder: (context, state) {
                    final storeName =
                        state.mapOrNull(loaded: (_) => _.store.name);
                    return Flexible(
                      child: Text(storeName ?? '',
                          style: context.bodyLarge,
                          overflow: TextOverflow.ellipsis),
                    );
                  },
                ),
                ShadButton.outline(
                  icon: const Badge(
                      smallSize: 8,
                      backgroundColor: Colors.red,
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 16.0,
                      )),
                  size: ShadButtonSize.icon,
                  onPressed: () => context.pushRoute(const ActivityRoute()),
                ),
              ],
            ),
            BlocBuilder<AppUpdateBloc, AppUpdateState>(
              builder: (context, state) {
                return state.maybeMap(
                    updateAvailable: (_) => ShadButton(
                          height: 56,
                          onPressed: () {},
                          gradient: const LinearGradient(colors: [
                            Colors.cyan,
                            Colors.indigo,
                          ]),
                          shadows: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.4),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          text: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Update Available ${_.appUpdate.tagName ?? ''}',
                              ),
                              const Text('Tap to install'),
                            ],
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.update),
                          ),
                        ),
                    orElse: () => const SizedBox.shrink());
              },
            ),
            const Gap(5),
            // ...shadItems,
            ..._drawerItems.entries.map((item) {
              final name = item.key;
              final tuple = item.value;
              return _buildShadButton(
                  text: name,
                  icon: tuple.$2,
                  index: tuple.$1,
                  isSelected: context.tabsRouter.activeIndex == tuple.$1,
                  onPressed: () async {
                    if (tuple.$1 == 12) {
                      await signOut();
                      return;
                    }
                    context.tabsRouter.setActiveIndex(tuple.$1);
                    context.closeDrawer();
                  });
            }),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                children: [
                  Expanded(
                    child: ShadButton(
                      height: 56,
                      onPressed: () => _showAppAboutDialog(context),
                      text: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(appName,
                              style: smallTextStyle?.copyWith(color: manatee)),
                          Text('Version $version',
                              style: smallTextStyle?.copyWith(color: manatee)),
                        ],
                      ),
                      icon: Hero(
                        tag: 'medusa',
                        child: Image.asset(
                          'assets/images/medusa.png',
                        ),
                      ),
                    ),
                  ),
                  const Gap(5.0),
                  ShadButton.outline(
                    height: 56,
                    width: 56,
                    // padding: const EdgeInsets.all(16.0),
                    onPressed: () async {
                      final Uri url = Uri.parse(AppConstants.githubLink);
                      await launchUrl(url);
                    },
                    icon: const Icon(SimpleIcons.github),
                  )
                ],
              ),
            ),
          ]),
    );

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

  Future<void> signOut() async {
    await showShadDialog(
      context: context,
      variant: ShadDialogVariant.alert,
      builder: (context) => ShadDialog.alert(
        title: const Text('Sign Out'),
        description: const Text('Are you sure you want to sign out?'),
        actions: [
          ShadButton.outline(
            text: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            text: const Text('Sign Out'),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEvent.logOut()),
          ),
        ],
      ),
    );
    // await showOkCancelAlertDialog(
    //         context: context,
    //         title: 'Sign out',
    //         message: 'Are you sure you want to sign out?',
    //         okLabel: 'Sign Out',
    //         isDestructiveAction: true)
    //     .then(
    //   (value) async {
    //     if (value == OkCancelResult.ok) {
    //       context
    //           .read<AuthenticationBloc>()
    //           .add(const AuthenticationEvent.logOut());
    //     }
    //   },
    // );
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
    applicationVersion: PreferenceService.packageInfo.version,
    useRootNavigator: useRootNavigator,
    applicationIcon: Image.asset('assets/images/medusa.png', scale: 12),
    applicationLegalese:
        '${AppConstants.copyright}  \n${AppConstants.author} \n${AppConstants.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${AppConstants.flutterVersion}, '
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
