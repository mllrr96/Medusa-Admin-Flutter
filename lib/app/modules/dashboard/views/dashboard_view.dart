import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../route/app_router.dart';

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
    // if (state == AppLifecycleState.resumed) {
    //   // Check for authentication, if not logged in, redirect to login page
    //   authenticate();
    // }
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
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
      ),
      child: AutoTabsRouter(
        routes: routes,
        transitionBuilder: (context, child, animation) => child,
        builder: (context, child) => child,
      ),
    );
  }
}
