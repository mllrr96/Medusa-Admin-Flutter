import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/data/models/app/settings.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/service/theme_service.dart';
import 'package:medusa_admin/domain/use_case/sign_out_use_case.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../auth_module/sign_in/components/update_url_view.dart';

@RoutePage()
class AppDevSettingsView extends StatelessWidget {
  const AppDevSettingsView({super.key});
  StorageService get storageService => StorageService.instance;
  AppSettings get appSettings => StorageService.appSettings;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    const divider = Divider(height: 0);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: const Text('App Dev Settings'),
            actions: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.settings),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: const Icon(Icons.cookie_outlined),
                title: const Text('Clear Cookie'),
                subtitle: Text('Clears the cookie used for authentication',
                    style: TextStyle(color: manatee)),
                onTap: () {
                  context.showSnackBar(
                      StorageService.instance.cookie ?? 'No cookie found',
                      action: SnackBarAction(
                          label: 'Copy',
                          onPressed: () {
                            context.copyToClipboard(
                                StorageService.instance.cookie ?? '');
                          }));
                },
                onLongPress: () async {
                  await storageService.clearCookie();
                  Fluttertoast.showToast(msg: 'Cookie cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.settings_backup_restore_outlined),
                title: const Text('Reset First Run'),
                subtitle: Text('Resets the first run flag',
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
                subtitle: Text('Loads saved data credential',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  final result = await storageService.loadLoginData();
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
                subtitle: Text('Clears the login data',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  await storageService.clearLoginData();
                  Fluttertoast.showToast(msg: 'Login data cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.file_copy_outlined),
                title: const Text('Clear exports files'),
                subtitle: Text('Deletes exports files',
                    style: TextStyle(color: manatee)),
                onLongPress: () async {
                  await storageService.clearExportFiles();
                  Fluttertoast.showToast(msg: 'Exports files cleared');
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Set URL'),
                subtitle:
                    Text('Change base url', style: TextStyle(color: manatee)),
                onTap: () {
                  context.showSnackBar(StorageService.baseUrl ?? 'No URL found',
                      action: SnackBarAction(
                          label: 'Copy',
                          onPressed: () {
                            if (StorageService.baseUrl == null) return;
                            context
                                .copyToClipboard(StorageService.baseUrl ?? '');
                          }));
                },
                onLongPress: () async {
                  await showBarModalBottomSheet(
                      context: context,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      builder: (context) => const UrlUpdateView());
                },
              ),
              divider,
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
                subtitle: Text('Sends a logout request to the server',
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
              SwitchListTile(
                secondary: const Icon(Icons.color_lens_outlined),
                title: const Text('Use Material 3'),
                value: appSettings.useMaterial3,
                onChanged: (val) async {
                  await storageService.updateAppSettings(appSettings.copyWith(
                      useMaterial3: !appSettings.useMaterial3));
                  ThemeController.instance.update();
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
