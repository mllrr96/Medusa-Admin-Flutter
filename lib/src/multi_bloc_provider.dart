import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/products/presentation/bloc/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/src/features/store_details/presentation/bloc/store/store_bloc.dart';
import 'features/collections/presentation/bloc/collection_crud/collection_crud_bloc.dart';
import 'features/groups/presentation/bloc/group_crud/group_crud_bloc.dart';
import 'features/promotions/presentation/bloc/promotion_crud/promotion_crud_bloc.dart';
import 'features/search/presentation/bloc/search/search_bloc.dart';
import 'features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'features/app_settings/presentation/bloc/app_update/app_update_bloc.dart';
import 'features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'features/customers/presentation/bloc/customer_crud/customer_crud_bloc.dart';
import 'features/app_settings/presentation/cubits/language/language_cubit.dart';
import 'features/app_settings/presentation/cubits/theme/theme_cubit.dart';

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
        create: (_) => StoreBloc.instance..add(StoreEvent.loadStores(null)),
      ),
      BlocProvider<ResetPasswordCubit>(
        create: (_) => ResetPasswordCubit.instance,
      ),
      BlocProvider<PromotionCrudBloc>(
        create: (context) => PromotionCrudBloc.instance,
      ),
      BlocProvider<ProductCrudBloc>(
        create: (context) => ProductCrudBloc.instance,
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
