import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/blocs/theme/theme_cubit.dart';
import 'data/service/language_service.dart';
import 'core/constant/strings.dart';
import 'core/route/app_router.dart';
import 'core/theme/flex_theme.dart';
import 'data/service/preference_service.dart';
import 'core/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* observe bloc logs
  Bloc.observer = MyBlocObserver();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc.instance,
          lazy: false,
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit.instance..loadThemeState(),
          lazy: false,
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final locale = PreferenceService.instance.loadLocale();
          return MaterialApp.router(
            title: AppConstants.appName,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: FlexTheme.light(state.flexScheme, state.useMaterial3),
            darkTheme: FlexTheme.dark(state.flexScheme, state.useMaterial3),
            builder: EasyLoading.init(),
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  Get.put(LanguageService().init());
  debugPrint('All services started...');
}
