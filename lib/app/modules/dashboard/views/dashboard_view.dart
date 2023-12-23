import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
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
    // print(state);
    // if (state == AppLifecycleState.resumed) {
    //   // Check for authentication, if not logged in, redirect to login page
    //   authenticate();
    // }
  }

  Future<void> authenticate() async {
    final result = await AuthRepo().getSession();
    await result.whenError((error) async {
      final result = await context.pushRoute(const ReAuthenticateRoute());
      if (result == true) {
        // continue
      }
    });
  }

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
