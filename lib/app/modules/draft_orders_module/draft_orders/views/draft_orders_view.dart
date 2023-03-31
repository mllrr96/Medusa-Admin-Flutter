import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../components/keep_alive_widget.dart';
import '../components/draft_order_card.dart';
import '../controllers/draft_orders_controller.dart';

class DraftOrdersView extends GetView<DraftOrdersController> {
  const DraftOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:  KeepAliveWidget(
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () => controller.pagingController.refresh(),
            header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
            child: PagedListView.separated(
              padding: const EdgeInsets.all(12.0),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<DraftOrder>(
                  itemBuilder: (context, draftOrder, index) => DraftOrderCard(draftOrder),
                  noItemsFoundIndicatorBuilder: (_) => const Center(child: Text('No draft orders!')),
                  firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive())),
              separatorBuilder: (_, __) => const SizedBox(height: 12.0),
            ),
          ),
        ),
      ),
    );
  }
}
