import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'dart:io' show Platform;
import '../../../draft_orders_module/draft_orders/controllers/draft_orders_controller.dart';

class OrdersAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OrdersAppBar({
    super.key,
    required this.tabController,
    required this.topViewPadding,
  });

  final TabController tabController;
  final double topViewPadding;

  @override
  State<OrdersAppBar> createState() => _OrdersAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + topViewPadding);
}

class _OrdersAppBarState extends State<OrdersAppBar> {
  bool collectionSearch = false;
  bool productSearch = false;
  final OrdersController controller = Get.find<OrdersController>();
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final displayLargeTextStyle = Theme.of(context).textTheme.displayLarge;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final topViewPadding = MediaQuery.of(context).viewPadding.top;
    final productsText = Obx(() {
      final count = OrdersController.instance.ordersCount.value;
      return Text(count != 0 ? 'Orders ($count)' : 'Orders', overflow: TextOverflow.ellipsis);
    });
    final collectionText = Obx(() {
      final count = DraftOrdersController.instance.draftOrdersCount.value;
      return Text(count != 0 ? 'Drafts ($count)' : 'Drafts', overflow: TextOverflow.ellipsis);
    });

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(child: productsText),
        Tab(child: collectionText),
      ],
    );

    final iosTabBar = Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: CupertinoButton(
                      padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                      onPressed: () {
                        widget.tabController.index = 0;
                        setState(() {});
                      },
                      alignment: Alignment.bottomCenter,
                      child: AnimatedDefaultTextStyle(
                          style: widget.tabController.index == 0
                              ? displayLargeTextStyle!
                              : largeTextStyle!.copyWith(color: lightWhite),
                          duration: const Duration(milliseconds: 200),
                          child: productsText)),
                ),
                Flexible(
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                    onPressed: () {
                      widget.tabController.index = 1;
                      setState(() {});
                    },
                    alignment: Alignment.bottomCenter,
                    child: AnimatedDefaultTextStyle(
                        style: widget.tabController.index == 1
                            ? displayLargeTextStyle!
                            : largeTextStyle!.copyWith(color: lightWhite),
                        duration: const Duration(milliseconds: 200),
                        child: collectionText),
                  ),
                ),
              ],
            ),
          ),
          // if (widget.tabController.index == 0)
          //   AdaptiveButton(
          //       onPressed: () {}, padding: const EdgeInsets.symmetric(horizontal: 16.0), child: const Text('Export')),
          Hero(tag: 'medusa', child: Image.asset('assets/images/medusa.png')),
        ],
      ),
    );

    widget.tabController.addListener(() {
      setState(() {
        collectionSearch = false;
        productSearch = false;
      });
    });
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
        ],
      ),
    );
  }
}
