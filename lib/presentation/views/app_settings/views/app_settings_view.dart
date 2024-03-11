import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/extension/locale_extension.dart';
import 'package:medusa_admin/core/extension/settings_list_tile_extension.dart';
import 'package:medusa_admin/data/models/auth_preference.dart';
import 'package:medusa_admin/data/models/app_preference.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/theme_mode_extension.dart';
import 'package:medusa_admin/domain/use_case/auth/sign_out_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/language_selection/language_selection_view.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/enums.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';

@RoutePage()
class AppSettingsView extends StatefulWidget {
  const AppSettingsView({super.key});

  @override
  State<AppSettingsView> createState() => _AppSettingsViewState();
}

class _AppSettingsViewState extends State<AppSettingsView> {
  AppPreference get appSettings => PreferenceService.appSettingsGetter;

  PreferenceService get preferenceService => PreferenceService.instance;

  AuthPreference get authPreference =>
      AuthPreferenceService.authPreferenceGetter;

  AuthPreferenceService get authPrefService => AuthPreferenceService.instance;
  bool? canCheckBiometrics;
  LocalAuthentication localAuthentication = getIt<LocalAuthentication>();
  Future<void> checkBiometric() async {
    canCheckBiometrics = await localAuthentication.canCheckBiometrics ||
        await localAuthentication.isDeviceSupported();
    setState(() {});
  }

  @override
  void initState() {
    checkBiometric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Scaffold(
      // appBar: AppBar(title: const Text('App Settings')),
      drawer: const AppDrawer(),
      drawerEdgeDragWidth: context.drawerEdgeDragWidth,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const MedusaSliverAppBar(title: Text('App Settings')),
        ],
        body: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            final languageName = languageState.locale.languageModel.name;
            final languageNativeName =
                languageState.locale.languageModel.nativeName;
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return SettingsList(
                  contentPadding: EdgeInsets.zero,
                  lightTheme: context.settingsListLightTheme,
                  darkTheme: context.settingsListDarkTheme,
                  sections: [
                    SettingsSection(
                        title: const Text('Authentication '),
                        tiles: [
                          SettingsTile.switchTile(
                            title: const Text('Biometric Auth'),
                            leading: Icon(Icons.fingerprint,
                                color: authPreference.useBiometric == true
                                    ? context.theme.primaryColor
                                    : null),
                            initialValue:
                            (authPreference.useBiometric ?? false) &&
                                canCheckBiometrics != null,
                            onToggle: canCheckBiometrics == null
                                ? null
                                : (enableBiometric) async {
                              final isAuthenticated = await localAuthentication
                                  .authenticate(
                                  localizedReason:
                                  'Please authenticate to ${enableBiometric ? 'enable' : 'disable'} biometric auth');
                              if (!isAuthenticated) return;

                              if (enableBiometric &&
                                  context.mounted) {
                                final result =
                                await showOkCancelAlertDialog(
                                  context: context,
                                  isDestructiveAction: true,
                                  title: 'Enable Biometric Auth',
                                  message:
                                  'To enable biometric authentication you need to sign out and sign in again',
                                  okLabel: 'Sign Out',
                                  cancelLabel: 'Cancel',
                                );
                                if (result == OkCancelResult.ok) {
                                  loading();
                                  final result =
                                  await SignOutUseCase.instance();
                                  await result.when((success) async {
                                    await AuthPreferenceService
                                        .instance
                                        .clearLoginData();
                                    await AuthPreferenceService
                                        .instance
                                        .clearExportFiles();
                                    await AuthPreferenceService
                                        .instance
                                        .clearLoginKey()
                                        .then((value) => context
                                        .router
                                        .replaceAll([
                                      const SplashRoute()
                                    ]));
                                    dismissLoading();
                                  }, (error) {
                                    if (error.code == 401) {
                                      context.router.replaceAll(
                                          [SignInRoute()]);
                                    } else {
                                      context.showSnackBar(
                                          error.toSnackBarString());
                                    }
                                  });
                                }
                              } else {
                                await authPrefService
                                    .disableBiometricAuth();
                              }
                              setState(() {});
                            },
                            description: canCheckBiometrics ==
                                false
                                ? const Text(
                                'Biometric auth not supported on this device')
                                : null,
                          )
                        ]),
                    SettingsSection(
                        title: const Text('UI settings'),
                        tiles: [
                          SettingsTile.navigation(
                            title: Text(tr.sidebarOrders),
                            leading: const Icon(CupertinoIcons.cart),
                            onPressed: (_) => context
                                .pushRoute(const OrderSettingsRoute()),
                          ),
                          SettingsTile.navigation(
                            title: const Text('AppBar Style'),
                            leading: const Icon(Icons.style),
                            onPressed: (_) =>
                                context.pushRoute(const AppBarStyleRoute()),
                          ),
                        ]),
                    SettingsSection(
                      title: const Text('Theme'),
                      tiles: [
                        SettingsTile.navigation(
                          title: const Text('Color Scheme'),
                          value: Text(state.flexScheme.name.capitalize),
                          leading: const Icon(Icons.color_lens),
                          onPressed: (_) async =>
                          await showConfirmationDialog<FlexScheme>(
                              context: context,
                              title: 'Color Scheme',
                              initialSelectedActionKey:
                              state.flexScheme,
                              actions: FlexScheme.values
                                  .map((e) =>
                                  AlertDialogAction<FlexScheme>(
                                    label: e.name.capitalize,
                                    key: e,
                                  ))
                                  .toList())
                              .then((result) async {
                            if (result == null) return;
                            await Future.delayed(
                                const Duration(milliseconds: 150))
                                .then((value) => context
                                .read<ThemeCubit>()
                                .updateThemeState(flexScheme: result));
                          }),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: const Text('Appearance'),
                      tiles: [
                        const CustomSettingsTile(child: Gap(10)),
                        CustomSettingsTile(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SegmentedButton<ThemeMode>(
                                  showSelectedIcon: false,
                                  onSelectionChanged: (e) => context
                                      .read<ThemeCubit>()
                                      .updateThemeState(themeMode: e.first),
                                  segments: ThemeMode.values
                                      .map((e) => ButtonSegment<ThemeMode>(
                                      value: e,
                                      icon: Icon(e.icon),
                                      label: Text(e.name.capitalize)))
                                      .toList(),
                                  selected: <ThemeMode>{state.themeMode}),
                            ))
                      ],
                    ),
                    SettingsSection(
                      title: const Text('Language and region'),
                      tiles: [
                        SettingsTile.navigation(
                          title: Text(
                              tr.personalInformationLanguageSettingsTitle),
                          value: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languageNativeName),
                              if (languageName != languageNativeName)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 6.0),
                                    Text(languageName),
                                  ],
                                ),
                            ],
                          ),
                          leading: const Icon(Icons.language),
                          onPressed: (_) async =>
                          await showBarModalBottomSheet(
                            backgroundColor:
                            context.theme.scaffoldBackgroundColor,
                            overlayStyle: context
                                .theme.appBarTheme.systemOverlayStyle,
                            context: context,
                            builder: (context) =>
                            const LanguageSelectionView(),
                          ),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: const Text('DateTime settings'),
                      tiles: <SettingsTile>[
                        if (Platform.isIOS)
                          SettingsTile.switchTile(
                            title: const Text('Use Android date picker'),
                            activeSwitchColor: ColorManager.primary,
                            description: GestureDetector(
                                onTap: () async =>
                                await context.adaptiveDateTimePicker(
                                    forceAndroidPicker: true),
                                child: const Text(
                                    'Use Android date picker instead of iOS picker, Click here for demo')),
                            leading: const Icon(CupertinoIcons.calendar),
                            onPressed: (_) async {
                              await preferenceService.updateAppSettings(
                                  appSettings.copyWith(
                                      useAndroidPicker:
                                      !appSettings.useAndroidPicker));
                              setState(() {});
                            },
                            initialValue: appSettings.useAndroidPicker,
                            onToggle: (bool value) async {
                              await preferenceService.updateAppSettings(
                                  appSettings.copyWith(
                                      useAndroidPicker: value));
                              setState(() {});
                            },
                          ),
                        SettingsTile.navigation(
                          title: const Text('Date format'),
                          value: Text(DateTime.now().formatDate()),
                          leading: const Icon(Icons.date_range),
                          onPressed: (_) async =>
                          await showConfirmationDialog<
                              DateFormatOptions>(
                              context: context,
                              title: 'Date format',
                              initialSelectedActionKey:
                              appSettings.dateFormatOptions,
                              actions: DateFormatOptions.values
                                  .map((e) => AlertDialogAction<
                                  DateFormatOptions>(
                                label: DateFormat(
                                    e.toPattern())
                                    .format(DateTime.now()),
                                key: e,
                              ))
                                  .toList())
                              .then((result) {
                            if (result == null) return;
                            if (result == appSettings.dateFormatOptions) {
                              return;
                            }
                            preferenceService.updateAppSettings(appSettings
                                .copyWith(dateFormatOptions: result));
                            setState(() {});
                          }),
                        ),
                        SettingsTile.navigation(
                          title: const Text('Time format'),
                          value: Text(DateTime.now().formatTime()),
                          leading: const Icon(Icons.timer_outlined),
                          onPressed: (_) async =>
                          await showModalActionSheet<TimeFormatOptions>(
                              context: context,
                              title: 'Time Format',
                              actions: TimeFormatOptions.values
                                  .map((e) => SheetAction<
                                  TimeFormatOptions>(
                                key: e,
                                label:
                                '${DateFormat(e.format()).format(DateTime.now())}${e == TimeFormatOptions.amPm ? '' : ' (24-hour)'}',
                              ))
                                  .toList())
                              .then((result) {
                            if (result == null) return;
                            if (result == appSettings.timeFormatOptions) {
                              return;
                            }
                            preferenceService.updateAppSettings(appSettings
                                .copyWith(timeFormatOptions: result));
                            setState(() {});
                          }),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
