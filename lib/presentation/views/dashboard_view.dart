import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Adding a scaffold here to fix snack-bar hero animation exception since
    // nested scaffolds are used here, one downside to this solution is the snack-bar
    // will cover FAB
    return Scaffold(
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
    );
  }
}
