import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/more/view/more_view.dart';
import '../../customers_module/shared_view.dart';
import '../../orders_module/shared_view.dart';
import '../../products_module/shared_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        // Since there no app bar, annotated region is used to apply theme ui overlay
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: Theme.of(context).appBarTheme.systemOverlayStyle!,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentScreen,
              selectedItemColor: Theme.of(context).primaryColor,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              onTap: controller.onTap,
              items: controller.bottomNavBarItems,
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
                  return shouldBuildPage[index] ? widget.pageBuilder(context, index) : Container();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
