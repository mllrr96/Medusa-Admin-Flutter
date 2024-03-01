import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/blocs/collection_crud/collection_crud_bloc.dart';
import 'presentation/blocs/group_crud/group_crud_bloc.dart';
import 'presentation/blocs/search/search_bloc.dart';
import 'presentation/cubits/reset_password/reset_password_cubit.dart';
import 'presentation/blocs/app_update/app_update_bloc.dart';
import 'presentation/blocs/authentication/authentication_bloc.dart';
import 'presentation/blocs/customer_crud/customer_crud_bloc.dart';
import 'presentation/blocs/discount_crud/discount_crud_bloc.dart';
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
        create: (_) => ThemeCubit.instance,
        lazy: false,
      ),
      BlocProvider<LanguageCubit>(
        create: (_) => LanguageCubit.instance,
        lazy: false,
      ),
      BlocProvider<AppUpdateBloc>(
        create: (_) => AppUpdateBloc.instance,
        lazy: false,
      ),
      BlocProvider<StoreBloc>(
        create: (_) => StoreBloc.instance,
      ),
      BlocProvider<ResetPasswordCubit>(
        create: (_) => ResetPasswordCubit.instance,
      ),
      BlocProvider<DiscountCrudBloc>(
        create: (context) => DiscountCrudBloc.instance,
      ),
      // BlocProvider<GiftCardsCubit>(
      //   create: (context) => GiftCardsCubit.instance,
      // ),
      BlocProvider<SearchBloc>(
        create: (context) => SearchBloc.instance,
      ),
      BlocProvider<CollectionCrudBloc>(
        create: (_) => CollectionCrudBloc.instance,
      ),
      // BlocProvider<CollectionsCubit>(
      //   create: (_) => CollectionsCubit.instance,
      // ),
      // BlocProvider<CustomersCubit>(
      //   create: (_) => CustomersCubit.instance,
      // ),
      BlocProvider<CustomerCrudBloc>(
        create: (_) => CustomerCrudBloc.instance,
      ),
      // BlocProvider<GroupsCubit>(
      //   create: (_) => GroupsCubit.instance,
      // ),
      BlocProvider<GroupCrudBloc>(
        create: (_) => GroupCrudBloc.instance,
      ),
    ], child: child);
  }
}
