import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/orders/components/order_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/models/store/order.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            padding: const EdgeInsets.all(12.0),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Order>(
                itemBuilder: (context, order, index) => OrderCard(order),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          ),
        ),
      ),
    );
  }
}
