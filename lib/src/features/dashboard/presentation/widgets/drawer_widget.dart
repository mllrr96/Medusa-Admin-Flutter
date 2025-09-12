import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/constants/strings.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/theme_mode_extension.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin/src/features/app_settings/data/service/preference_service.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/bloc/app_update/app_update_bloc.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/cubits/theme/theme_cubit.dart';
import 'package:medusa_admin/src/features/auth/data/service/auth_preference_service.dart';
import 'package:medusa_admin/src/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:medusa_admin/src/features/store_details/presentation/bloc/store/store_bloc.dart';
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
    final smallTextStyle = context.bodySmall;
    final packageInfo = PreferenceService.packageInfo;
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    final divider = Container(
        color: context.theme.navigationDrawerTheme.backgroundColor,
        child: const Divider(indent: 28, endIndent: 28));
    List<Widget> items = [
      divider,
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
        label: Text('Promotions'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.campaign),
        label: Text('Campaigns'),
      ),
      divider,
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
            await dismissLoading();
            if (context.mounted) {
              context.router.replaceAll([SplashRoute(fromLogout: true)]);
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
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: context.theme.colorScheme.secondaryContainer),
                        padding: const EdgeInsets.all(16.0),
                        onPressed: () => context
                            .read<ThemeCubit>()
                            .updateThemeState(themeMode: state.themeMode.next),
                        icon: Icon(state.themeMode.icon),
                      );
                    },
                  ),
                  const Gap(5.0),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: const StadiumBorder(),
                        onTap: () {},
                        child: Ink(
                          height: 56,
                          decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            color: context.theme.colorScheme.secondaryContainer,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<StoreBloc, StoreState>(
                                builder: (context, state) {
                                  final storeName = state.mapOrNull(
                                      stores: (r) => r.response.stores.firstOrNull?.name);
                                  return Flexible(
                                    child: Text(storeName ?? '',
                                        style: context.bodyLarge, overflow: TextOverflow.ellipsis),
                                  );
                                },
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AppUpdateBloc, AppUpdateState>(
              builder: (context, state) {
                return state.maybeWhen(
                    updateAvailable: (appUpdate) => Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 12, 5),
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
                                      onPlay: (controller) => controller.repeat(reverse: true))
                                  .shimmer(
                                      duration: const Duration(seconds: 5),
                                      blendMode: BlendMode.srcIn,
                                      colors: [Colors.blue, Colors.green, Colors.teal]),
                              Material(
                                color: Colors.transparent,
                                shape: const StadiumBorder(),
                                child: InkWell(
                                  customBorder: const StadiumBorder(),
                                  onTap: () => context.pushRoute(const AppUpdateRoute()),
                                  child: Ink(
                                    height: 56,
                                    decoration: const ShapeDecoration(
                                      shape: StadiumBorder(),
                                    ),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                                          child: Icon(Icons.update, color: Colors.white),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('New Update Available ${appUpdate.tagName ?? ''}',
                                                style: const TextStyle(color: Colors.white)),
                                            Text('Tap to install',
                                                style:
                                                    smallTextStyle?.copyWith(color: Colors.white)),
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
            const Gap(1),
            ...items,
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      customBorder: const StadiumBorder(),
                      onTap: () => _showAppAboutDialog(context),
                      onLongPress: () => context.pushRoute(const AppDevSettingsRoute()),
                      child: Ink(
                        height: 56,
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: context.theme.colorScheme.secondaryContainer,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Hero(
                                  tag: 'medusa',
                                  child: SvgPicture.asset(
                                    context.isDark
                                        ? 'assets/images/medusa-logo-light.svg'
                                        : 'assets/images/medusa-logo-dark.svg',
                                    height: 32,
                                  ),
                                ),
                                const Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(appName, style: smallTextStyle),
                                    Text('Version $version', style: smallTextStyle),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(Icons.info_outline),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(5.0),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.secondaryContainer,
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
          context.read<AuthenticationBloc>().add(const AuthenticationEvent.logOut());
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
