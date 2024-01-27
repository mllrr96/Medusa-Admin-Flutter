import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart';
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:medusa_admin/presentation/blocs/language/language_cubit.dart';
import 'package:medusa_admin/presentation/blocs/theme/theme_cubit.dart';
import 'core/constant/strings.dart';
import 'core/route/app_router.dart';
import 'core/theme/flex_theme.dart';
import 'core/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'observer.dart';
import 'presentation/blocs/store/store_bloc.dart';

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
        BlocProvider<LanguageCubit>(
          create: (_) => LanguageCubit.instance..loadLanguage(),
          lazy: false,
        ),
        BlocProvider<AppUpdateBloc>(
          create: (_) => AppUpdateBloc.instance
            ..add(const AppUpdateEvent.checkForUpdate()),
          lazy: false,
        ),
        BlocProvider<StoreBloc>(
          create: (_) => StoreBloc.instance,
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: AppConstants.appName,
                locale: languageState.locale,
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
          );
        },
      ),
    );
  }
}
