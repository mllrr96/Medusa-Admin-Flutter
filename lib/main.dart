import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'data/service/language_service.dart';
import 'core/constant/strings.dart';
import 'core/route/app_router.dart';
import 'core/theme/flex_theme.dart';
import 'data/service/preference_service.dart';
import 'data/service/theme_service.dart';
import 'core/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //* initialize firebase crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  //* inject dependencies
  await configureInjection();
  //* initialize getx services
  await initServices();

  runApp(const MedusaAdminApp());
}

class MedusaAdminApp extends StatelessWidget {
  const MedusaAdminApp({super.key});

  AppRouter get _router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      final themeMode = PreferenceService.instance.loadThemeMode();
      final locale = PreferenceService.instance.loadLocale();
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
  Get.put(LanguageService().init());
  Get.put(ThemeController());
  debugPrint('All services started...');
}
