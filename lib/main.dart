import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/core/utils/platform.dart';
import 'package:medusa_admin/multi_bloc_provider.dart';
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:window_manager/window_manager.dart';
import 'core/constant/strings.dart';
import 'core/route/app_router.dart';
import 'core/di/di.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    minimumSize: Size(400, 300),
    center: true,
    title: 'Medusa Admin',
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  //* observe bloc logs
  Bloc.observer = MyBlocObserver();

  //* initialize firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //* initialize firebase crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  //* inject dependencies
  await configureInjection();

  runApp(const MedusaAdminApp());
}

class MedusaAdminApp extends StatelessWidget {
  const MedusaAdminApp({super.key});

  AppRouter get _router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return ShadApp.materialRouter(
                title: AppConstants.appName,
                locale: languageState.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                themeMode: themeState.themeMode,
                // theme: ShadThemeData(
                //     colorScheme: ShadSlateColorScheme.light(),
                //     brightness: Brightness.light),
                // darkTheme: ShadThemeData(
                //     colorScheme: ShadSlateColorScheme.dark(),
                //     brightness: Brightness.dark),
                builder: EasyLoading.init(builder: (context, child) {
                  if (kIsDesktop && !kIsMacOS) {
                    return DragToResizeArea(child: child!);
                  }
                  return child!;
                }),
                routerConfig: _router.config(),
              );
            },
          );
        },
      ),
    );
  }
}
