import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/orders/orders_bloc.dart';
import 'package:medusa_admin/presentation/blocs/orders_filter/orders_filter_bloc.dart';
import 'package:medusa_admin/presentation/blocs/update_discount/update_discount_bloc.dart';
import 'package:medusa_admin/presentation/cubits/discounts/discounts_cubit.dart';
import 'package:medusa_admin/presentation/cubits/draft_orders/draft_orders_cubit.dart';
import 'package:medusa_admin/presentation/cubits/products/products_cubit.dart';
import 'package:medusa_admin/presentation/cubits/products_filter/products_filter_cubit.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OrdersBloc.instance,
        ),
        BlocProvider(
          create: (context) => OrdersFilterBloc.instance,
        ),
        BlocProvider(
          create: (context) => DraftOrdersCubit.instance,
        ),
        BlocProvider(
          create: (context) => DiscountsCubit.instance,
        ),
        BlocProvider(
          create: (context) => UpdateDiscountBloc.instance,
        ),
        BlocProvider(
          create: (context) => ProductsCubit.instance,
        ),
        BlocProvider(
          create: (context) => ProductsFilterCubit.instance,
        ),
      ],
      // Adding a scaffold here to fix snack-bar hero animation exception since
      // nested scaffolds are used here, one downside to this solution is the snack-bar
      // will cover FAB
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: context.systemUiOverlayNoAppBarStyle,
          child: AutoTabsRouter(
            homeIndex: 0,
            routes: const [
              OrdersRoute(),
              DraftOrdersRoute(),
              ProductsRoute(),
              CollectionsRoute(),
              CategoriesRoute(),
              CustomersRoute(),
              GroupsRoute(),
              DiscountsRoute(),
              GiftCardsRoute(),
              PricingRoute(),
              StoreSettingsRoute(),
              AppSettingsRoute(),
            ],
            transitionBuilder: (context, child, animation) => child,
            builder: (context, child) => child,
          ),
        ),
      ),
    );
  }
}
