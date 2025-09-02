import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/extension/color_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'easy_loading.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final packageInfo = PreferenceService.packageInfo;
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    final divider = Container(
        color: context.theme.navigationDrawerTheme.backgroundColor,
        child: const Divider(indent: 28, endIndent: 28));
    List<Widget> items = [
      const NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.cart),
        label: Text('Orders'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.cart_badge_plus),
        label: Text('Draft Orders'),
      ),
      divider,
      const NavigationDrawerDestination(
        icon: Icon(MedusaIcons.tag),
        label: Text('Products'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.collections_bookmark),
        label: Text('Collections'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(MedusaIcons.tag),
        label: Text('Categories'),
      ),
      // space,
      divider,
      const NavigationDrawerDestination(
        icon: Icon(Icons.person),
        label: Text('Customers'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.groups),
        label: Text('Customer Groups'),
      ),
      // space,
      divider,
      const NavigationDrawerDestination(
        icon: Icon(Icons.discount_outlined),
        label: Text('Discounts'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.gift),
        label: Text('Gift Cards'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(MedusaIcons.currency_dollar),
        label: Text('Pricing'),
      ),
      // space,
      divider,
      const NavigationDrawerDestination(
        icon: Icon(Icons.settings_applications),
        label: Text('Store Settings'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(CupertinoIcons.settings),
        label: Text('App Settings'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.logout, color: Colors.red),
        label: Text('Sign Out'),
      ),
    ];

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
            context.showSnackBar(e.error.toSnackBarString());
          },
        );
      },
      child: NavigationDrawer(
          key: const PageStorageKey<String>('navigationDrawer'),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: context.getAlphaBlend(
                            context.theme.scaffoldBackgroundColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<ThemeCubit, ThemeState>(
                            builder: (context, state) {
                              return IconButton(
                                padding: const EdgeInsets.all(16.0),
                                onPressed: () => context
                                    .read<ThemeCubit>()
                                    .updateThemeState(
                                        themeMode: state.themeMode.next),
                                icon: Icon(state.themeMode.icon),
                              );
                            },
                          ),
                          // BlocBuilder<StoreBloc, StoreState>(
                          //   builder: (context, state) {
                          //     final storeName = state.mapOrNull(
                          //         loaded: (r) => r.store.name);
                          //     return Flexible(
                          //       child: Text(storeName ?? '',
                          //           style: context.bodyLarge,
                          //           overflow: TextOverflow.ellipsis),
                          //     );
                          //   },
                          // ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Gap(5.0),
                  // IconButton(
                  //     style: IconButton.styleFrom(
                  //       backgroundColor: context.getAlphaBlend(
                  //           context.theme.scaffoldBackgroundColor),
                  //     ),
                  //     padding: const EdgeInsets.all(16.0),
                  //     onPressed: () =>
                  //         context.pushRoute(const ActivityRoute()),
                  //     icon: const Badge(
                  //         smallSize: 8,
                  //         backgroundColor: Colors.red,
                  //         alignment: Alignment.topRight,
                  //         child: Icon(Icons.notifications_outlined))),
                ],
              ),
            ),
            BlocBuilder<AppUpdateBloc, AppUpdateState>(
              builder: (context, state) {
                return state.maybeMap(
                    updateAvailable: (r) => Padding(
                      padding:
                          const EdgeInsets.fromLTRB(12, 10, 12, 5),
                      child: Stack(
                        children: [
                          Container(
                            height: 56,
                            width: double.infinity,
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Colors.blue,
                            ),
                          )
                              .animate(
                                  autoPlay: true,
                                  onPlay: (controller) => controller
                                      .repeat(reverse: true))
                              .shimmer(
                                  duration:
                                      const Duration(seconds: 5),
                                  blendMode: BlendMode.srcIn,
                                  colors: [
                                Colors.blue,
                                Colors.green,
                                Colors.teal
                              ]),
                          Material(
                            color: Colors.transparent,
                            shape: const StadiumBorder(),
                            child: InkWell(
                              customBorder: const StadiumBorder(),
                              onTap: () => context
                                  .pushRoute(const AppUpdateRoute()),
                              child: Ink(
                                height: 56,
                                decoration: const ShapeDecoration(
                                  shape: StadiumBorder(),
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          16, 16, 10, 16),
                                      child: Icon(Icons.update,
                                          color: Colors.white),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            'New Update Available ${r.appUpdate.tagName ?? ''}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text('Tap to install',
                                            style: smallTextStyle
                                                ?.copyWith(
                                                    color: Colors
                                                        .white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    orElse: () => const SizedBox.shrink());
              },
            ),
            const Gap(5),
            ...items,
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      customBorder: const StadiumBorder(),
                      onTap: () => _showAppAboutDialog(context),
                      onLongPress: () =>
                          context.pushRoute(const AppDevSettingsRoute()),
                      child: Ink(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: context.getAlphaBlend(
                              context.theme.scaffoldBackgroundColor),
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
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(appName,
                                        style: smallTextStyle?.copyWith(
                                            color: manatee)),
                                    Text('Version $version',
                                        style: smallTextStyle?.copyWith(
                                            color: manatee)),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(Icons.info_outline,
                                color: ColorManager.manatee),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(5.0),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: context.getAlphaBlend(
                          context.theme.scaffoldBackgroundColor),
                    ),
                    padding: const EdgeInsets.all(16.0),
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
    await showOkCancelAlertDialog(
            context: context,
            title: 'Sign out',
            message: 'Are you sure you want to sign out?',
            okLabel: 'Sign Out',
            isDestructiveAction: true)
        .then(
      (value) async {
        if (value == OkCancelResult.ok && mounted) {
          context
              .read<AuthenticationBloc>()
              .add(const AuthenticationEvent.logOut());
        }
      },
    );
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
