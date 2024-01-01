import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/language_service.dart';
import 'package:medusa_admin/core/utils/strings.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'app/data/service/storage_service.dart';
import 'app/data/service/theme_service.dart';
import 'core/theme/flex_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* inject dependencies
  await configureInjection();
  await initServices();
  runApp(const MedusaAdminApp());
}

class MedusaAdminApp extends StatelessWidget {
  const MedusaAdminApp({super.key});

  AppRouter get _router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      final themeMode = StorageService.instance.loadThemeMode();
      final locale = StorageService.instance.loadLocale();
      return MaterialApp.router(
        title: AppConstants.appName,
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: FlexTheme.light,
        darkTheme: FlexTheme.dark,
        builder: EasyLoading.init(),
        routerConfig: _router.config(),
      );
    });
  }
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => StorageService().init());
  Get.put(LanguageService().init());
  Get.put(ThemeController());
  debugPrint('All services started...');
}
