import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/models/app_preference.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/domain/use_case/auth/sign_out_use_case.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../views/auth/components/url_configure_view.dart';

@RoutePage()
class AppDevSettingsView extends StatefulWidget {
  const AppDevSettingsView({super.key});

  @override
  State<AppDevSettingsView> createState() => _AppDevSettingsViewState();
}

class _AppDevSettingsViewState extends State<AppDevSettingsView> {
  AuthenticationType get authType => AuthPreferenceService.authTypeGetter;

  PreferenceService get storageService => PreferenceService.instance;

  AuthPreferenceService get authPrefService => AuthPreferenceService.instance;

  AppPreference get appSettings => PreferenceService.appSettingsGetter;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    const divider = Divider(height: 0);

    Future<bool> authenticate() async {
      final localAuth = getIt<LocalAuthentication>();
      final canCheckBiometric = await localAuth.canCheckBiometrics &&
          await localAuth.isDeviceSupported();
      if (!canCheckBiometric) {
        return false;
      }
      return await localAuth
          .authenticate(localizedReason: 'Please authenticate')
          .then((authenticated) async {
        if (!authenticated) {
          return false;
        }
        return true;
      });
    }

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const MedusaSliverAppBar(
                  title: Text('App Dev Settings'),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.settings, size: 28.0),
                    )
                  ],
                ),
              ],
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Authentication Type'),
                subtitle: Text('${authType.toString()} Authentication',
                    style: const TextStyle(color: manatee)),
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.cookie_outlined),
                title: Text('Clear ${authType.toString()}'),
                subtitle: Text(
                    'Clears ${authType.toString()} used for authentication',
                    style: const TextStyle(color: manatee)),
                onTap: () async {
                  await authenticate().then((authenticated) async {
                    if (!authenticated) {
                      return;
                    }
                    final key = switch (authType) {
                      AuthenticationType.cookie => AppConstants.cookieKey,
                      AuthenticationType.token => AppConstants.tokenKey,
                      AuthenticationType.jwt => AppConstants.jwtKey,
                    };
                    final value =
                        await getIt<FlutterSecureStorage>().read(key: key);
                    if (context.mounted) {
                      context.showSnackBar(value ?? 'No ',
                          action: SnackBarAction(
                              label: 'Copy',
                              onPressed: () async {
                                context.copyToClipboard(value ?? '');
                              }));
                    }
                  });
                },
                onLongPress: () async {
                  await authenticate().then((authenticated) async {
                    if (!authenticated) {
                      return;
                    }
                    await authPrefService.clearLoginKey();
                    Fluttertoast.showToast(msg: 'Cookie cleared');
                  });
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.settings_backup_restore_outlined),
                title: const Text('Reset First Run'),
                subtitle: const Text('Resets the first run flag',
                    style: TextStyle(color: manatee)),
                onTap: () async {
                  final isFirstRun = await storageService.isFirstRun();
                  if (!context.mounted) return;

                  context.showSnackBar(
                    'First run is ${isFirstRun ? 'true' : 'false'}',
                  );
                },
                onLongPress: () async {
                  await storageService.resetFirstRun();
                  Fluttertoast.showToast(msg: 'First run reset');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.password),
                title: const Text('Load login data'),
                subtitle: const Text('Loads saved data credential',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  final result = await authPrefService.loadLoginData();
                  result.when((success) {
                    context.showSnackBar(
                        'Email: ${success.$1}\nPassword: ${success.$2}');
                  }, (error) {
                    context.showSnackBar(error);
                  });
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.save_outlined),
                title: const Text('Clear login data'),
                subtitle: const Text('Clears the login data',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  await authPrefService.clearLoginData();
                  Fluttertoast.showToast(msg: 'Login data cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.file_copy_outlined),
                title: const Text('Clear exports files'),
                subtitle: const Text('Deletes exports files',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  await authPrefService.clearExportFiles();
                  Fluttertoast.showToast(msg: 'Exports files cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.file_copy_outlined),
                title: const Text('Clear update files'),
                subtitle: const Text('Deletes update files',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  await authPrefService.clearUpdateFiles();
                  Fluttertoast.showToast(msg: 'Update files cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Set URL'),
                subtitle: const Text('Change base url',
                    style: TextStyle(color: manatee)),
                onTap: () {
                  context.showSnackBar(
                      AuthPreferenceService.baseUrlGetter ?? 'No URL found',
                      action: SnackBarAction(
                          label: 'Copy',
                          onPressed: () {
                            if (AuthPreferenceService.baseUrlGetter == null) {
                              return;
                            }
                            context.copyToClipboard(
                                AuthPreferenceService.baseUrlGetter ?? '');
                          }));
                },
                onLongPress: () async {
                  await showBarModalBottomSheet(
                      context: context,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      builder: (context) => const UrlConfigureView());
                },
              ),
              divider,
              ListTile(
                  leading: const Icon(Icons.error_outline),
                  title: const Text('Throw exception'),
                  subtitle: const Text('Throws an exception',
                      style: TextStyle(color: manatee)),
                  onLongPress: () {
                    throw Exception('This is a test exception');
                  }),
              divider,
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
                subtitle: const Text('Sends a logout request to the server',
                    style: TextStyle(color: manatee)),
                onTap: () {},
                onLongPress: () async {
                  final result = await SignOutUseCase.instance();
                  result.when((success) {
                    context.showSnackBar('Logged out');
                  }, (error) {
                    context.showSnackBar(error.toSnackBarString());
                  });
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: const Text('Reset app settings'),
                onTap: () async {
                  await showModalBottomSheet(
                      context: context,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: Text(appSettings.toJson().toString(),
                              style: context.bodyLarge,
                              textAlign: TextAlign.center),
                        );
                      });
                },
                onLongPress: () async {
                  await storageService
                      .updateAppSettings(AppPreference.defaultSettings())
                      .then((_) {
                    context.read<ThemeCubit>().loadThemeState();
                    context.showSnackBar('App settings reset');
                  });
                },
              ),
              divider,
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.color_lens_outlined),
                    title: const Text('Use Material 3'),
                    value: state.useMaterial3,
                    onChanged: (val) async {
                      context
                          .read<ThemeCubit>()
                          .updateThemeState(useMaterial3: !state.useMaterial3);
                    },
                  );
                },
              ),
              divider,
              SwitchListTile(
                secondary: const Icon(Icons.account_tree),
                title: const Text('Install Beta Updates'),
                value: appSettings.downloadBeta,
                onChanged: (val) async {
                  await storageService.updateAppSettings(appSettings.copyWith(
                      downloadBeta: !appSettings.downloadBeta));
                  setState(() {});
                },
              ),
            ],
          )),
    );
  }
}
