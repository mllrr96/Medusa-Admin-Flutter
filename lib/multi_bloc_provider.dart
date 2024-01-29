import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/presentation/cubits/reset_password/reset_password_cubit.dart';

import 'presentation/blocs/app_update/app_update_bloc.dart';
import 'presentation/blocs/authentication/authentication_bloc.dart';
import 'presentation/blocs/store/store_bloc.dart';
import 'presentation/cubits/language/language_cubit.dart';
import 'presentation/cubits/theme/theme_cubit.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
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
        create: (_) =>
            AppUpdateBloc.instance..add(const AppUpdateEvent.checkForUpdate()),
        lazy: false,
      ),
      BlocProvider<StoreBloc>(
        create: (_) => StoreBloc.instance,
      ),
      BlocProvider<ResetPasswordCubit>(
        create: (_) => ResetPasswordCubit.instance,
      ),
    ], child: child);
  }
}
