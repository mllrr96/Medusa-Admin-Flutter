import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/multi_bloc_provider.dart';
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart';
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'core/constant/strings.dart';
import 'core/route/app_router.dart';
import 'core/di/di.dart';
import 'observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* observe bloc logs
  Bloc.observer = MyBlocObserver();

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
