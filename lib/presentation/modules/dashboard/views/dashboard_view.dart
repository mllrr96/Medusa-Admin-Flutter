import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import '../../../../core/route/app_router.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
    }

    if (state == AppLifecycleState.resumed) {
    }
  }

  @override
  Widget build(BuildContext context) {
    const routes = [
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
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.systemUiOverlayNoAppBarStyle,
      child: AutoTabsRouter(
        homeIndex: 0,
        routes: routes,
        transitionBuilder: (context, child, animation) => child,
        builder: (context, child) => child,
      ),
    );
  }
}
