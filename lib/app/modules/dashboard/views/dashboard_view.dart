import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/customers_module/customers/controllers/customers_controller.dart';
import 'package:medusa_admin/app/modules/more/view/more_view.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/app/modules/products_module/products/controllers/products_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import '../../customers_module/shared_view.dart';
import '../../orders_module/shared_view.dart';
import '../../products_module/shared_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bottomNavBarItems = GetPlatform.isIOS
        ? <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: const Icon(CupertinoIcons.cart), label: context.tr.sidebarOrders),
            BottomNavigationBarItem(icon: const Icon(MedusaIcons.tag), label: context.tr.sidebarProducts),
            BottomNavigationBarItem(icon: const Icon(MedusaIcons.users), label: context.tr.sidebarCustomers),
            const BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'More'),
          ]
        : [
            BottomNavigationBarItem(icon: const Icon(CupertinoIcons.cart), label: context.tr.sidebarOrders),
            BottomNavigationBarItem(icon: const Icon(CupertinoIcons.tag), label: context.tr.sidebarProducts),
            BottomNavigationBarItem(icon: const Icon(Icons.person), label: context.tr.sidebarCustomers),
            const BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
          ];
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            final ordersTabCtrl = OrdersController.instance.tabController;
            final productsTabCtrl = ProductsController.instance.tabController;
            final customersTabCtrl = CustomersController.instance.tabController;
            final index = controller.currentScreen;
            switch (index) {
              case 0:
                if (ordersTabCtrl.index != 0) {
                  ordersTabCtrl.animateTo(0);
                  return false;
                }
                return true;
              case 1:
                if (productsTabCtrl.index != 0) {
                  productsTabCtrl.animateTo(0);
                } else {
                  controller.onTap(0);
                }
                return false;
              case 2:
                if (customersTabCtrl.index != 0) {
                  customersTabCtrl.animateTo(0);
                } else {
                  controller.onTap(0);
                }
                return false;
              case 3:
                controller.onTap(0);
                return false;
              default:
                return true;
            }
          },
          // Since there no app bar, annotated region is used to apply theme ui overlay
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.theme.appBarTheme.systemOverlayStyle!,
            child: Scaffold(
              bottomNavigationBar: Theme(
                data: context.theme.copyWith(
                    splashColor: Colors.transparent, highlightColor: GetPlatform.isIOS ? Colors.transparent : null),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.currentScreen,
                  selectedItemColor: Theme.of(context).primaryColor,
                  selectedFontSize: 12.0,
                  unselectedFontSize: 12.0,
                  onTap: controller.onTap,
                  items: bottomNavBarItems,
                ),
              ),
              body: PageSwitchingView(
                currentPageIndex: controller.currentScreen,
                pageCount: 4,
                pageBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const OrdersDraftsTabBarView();
                    case 1:
                      return const ProductsCollectionsTabBarView();
                    case 2:
                      return const CustomersGroupsTabBarView();
                    case 3:
                      return const MoreView();
                    default:
                      return const OrdersDraftsTabBarView();
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class PageSwitchingView extends StatefulWidget {
  const PageSwitchingView({
    super.key,
    required this.currentPageIndex,
    required this.pageCount,
    required this.pageBuilder,
  });

  final int currentPageIndex;
  final int pageCount;
  final IndexedWidgetBuilder pageBuilder;

  @override
  State<PageSwitchingView> createState() => _PageSwitchingViewState();
}

class _PageSwitchingViewState extends State<PageSwitchingView> {
  final List<bool> shouldBuildPage = <bool>[];

  @override
  void initState() {
    super.initState();
    shouldBuildPage.addAll(List<bool>.filled(widget.pageCount, false));
  }

  @override
  void didUpdateWidget(PageSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Only partially invalidate the pages cache to avoid breaking the current
    // behavior. We assume that the only possible change is either:
    // - new pages are appended to the page list, or
    // - some trailing pages are removed.
    // If the above assumption is not true, some pages may lose their state.
    final lengthDiff = widget.pageCount - shouldBuildPage.length;
    if (lengthDiff > 0) {
      shouldBuildPage.addAll(List<bool>.filled(lengthDiff, false));
    } else if (lengthDiff < 0) {
      shouldBuildPage.removeRange(widget.pageCount, shouldBuildPage.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: List<Widget>.generate(widget.pageCount, (int index) {
        final active = index == widget.currentPageIndex;
        shouldBuildPage[index] = active || shouldBuildPage[index];

        return HeroMode(
          enabled: active,
          child: Offstage(
            offstage: !active,
            child: TickerMode(
              enabled: active,
              child: Builder(
                builder: (BuildContext context) {
                  return shouldBuildPage[index] ? widget.pageBuilder(context, index) : const SizedBox.shrink();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
