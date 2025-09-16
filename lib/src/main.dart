import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/constants/strings.dart';
import 'multi_bloc_provider.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/cubits/language/language_cubit.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/cubits/theme/theme_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/flex_theme.dart';
import 'core/di/di.dart';
import 'core/localization/app_localizations.dart';
import 'observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* observe bloc logs
  Bloc.observer = MyBlocObserver();

  // //* initialize firebase
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
              return MaterialApp.router(
                title: AppConstants.appName,
                locale: languageState.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                themeMode: themeState.themeMode,
                theme: FlexTheme.light(
                    themeState.flexScheme, themeState.useMaterial3),
                darkTheme: FlexTheme.dark(
                    themeState.flexScheme, themeState.useMaterial3),
                builder: EasyLoading.init(),
                routerConfig: _router.config(),
              );
            },
          );
        },
      ),
    );
  }
}
