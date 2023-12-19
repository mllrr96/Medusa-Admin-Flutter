import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../route/app_router.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        OrdersRoute(),
        DraftOrdersRoute(),
        ProductsRoute(),
        CollectionsRoute(),
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
    );
  }
}
