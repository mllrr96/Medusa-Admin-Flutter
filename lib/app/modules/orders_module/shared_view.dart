import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/views/orders_view.dart';
import '../components/keep_alive_widget.dart';
import '../draft_orders_module/draft_orders/views/draft_orders_view.dart';
import 'orders/components/orders_app_bar.dart';
import 'orders/controllers/orders_controller.dart';

class OrdersDraftsTabBarView extends GetView<OrdersController> {
  const OrdersDraftsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = controller.tabController;
    return Scaffold(
      appBar:
          OrdersDraftTabBarAppBar(tabController: tabController, topViewPadding: MediaQuery.of(context).viewPadding.top),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: const [
            KeepAliveWidget(child: OrdersView()),
            KeepAliveWidget(child: DraftOrdersView()),
          ],
        ),
      ),
    );
  }
}
