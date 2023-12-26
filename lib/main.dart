import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medusa_admin/app/data/service/language_service.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/strings.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'app/data/service/storage_service.dart';
import 'app/data/service/theme_service.dart';
import 'core/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      final themeMode = StorageService.instance.loadThemeMode();
      final locale = StorageService.instance.loadLocale();
      final colorScheme = StorageService.appSettings.colorScheme;
      return MaterialApp.router(
        title: AppConstants.appName,
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: FlexThemeData.light(
          useMaterial3: StorageService.appSettings.material3,
          scheme: colorScheme,
          subThemesData: const FlexSubThemesData(
            inputDecoratorBorderType: FlexInputBorderType.outline,
            inputDecoratorRadius: 4.0,
            inputDecoratorFocusedHasBorder: true,
            inputDecoratorUnfocusedHasBorder: true,
          ),
          blendLevel: 10,
          appBarElevation: 0.5,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: GoogleFonts.cabin().fontFamily,
          textTheme: GoogleFonts.cabinTextTheme().copyWith(
            headlineLarge: AppTheme.headlineLarge,
            headlineMedium: AppTheme.headlineMedium,
            headlineSmall: AppTheme.headlineSmall,
            bodyLarge: AppTheme.bodyLarge,
            bodyMedium: AppTheme.bodyMedium,
            bodySmall: AppTheme.bodySmall,
          ),
          typography: Typography.material2021(platform: defaultTargetPlatform),
        ),
        darkTheme: FlexThemeData.dark(
          useMaterial3: StorageService.appSettings.material3,
          // colors: FlexColor.schemes[colorScheme]?.light,
          scheme: colorScheme,
          subThemesData: const FlexSubThemesData(
            inputDecoratorBorderType: FlexInputBorderType.outline,
            inputDecoratorRadius: 4.0,
            inputDecoratorFocusedHasBorder: true,
            inputDecoratorUnfocusedHasBorder: true,
          ),
          blendLevel: 12,
          appBarElevation: 1,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          fontFamily: GoogleFonts.cabin().fontFamily,
          textTheme: GoogleFonts.cabinTextTheme().copyWith(
            headlineLarge: AppTheme.headlineLarge.dark(),
            headlineMedium: AppTheme.headlineMedium.dark(),
            headlineSmall: AppTheme.headlineSmall.dark(),
            bodyLarge: AppTheme.bodyLarge.dark(),
            bodyMedium: AppTheme.bodyMedium.dark(),
            bodySmall: AppTheme.bodySmall.dark(),
          ),
          typography: Typography.material2021(platform: defaultTargetPlatform),
        ),
        builder: EasyLoading.init(),
        routerConfig: _appRouter.config(),
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
