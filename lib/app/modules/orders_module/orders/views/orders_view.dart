import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../data/models/store/order.dart';
import '../../../components/adaptive_icon.dart';
import '../components/order_card.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnimatedAppBar(),
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.pagingController.refresh(),
          header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
          child: PagedListView.separated(
            padding: const EdgeInsets.all(12.0),
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Order>(
                itemBuilder: (context, order, index) => AlternativeOrderCard(order),
                noItemsFoundIndicatorBuilder: (_) => const Center(child: Text('No orders yet!')),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          ),
        ),
      ),
    );
  }
}

class AnimatedAppBar extends StatefulWidget with PreferredSizeWidget {
  const AnimatedAppBar({Key? key}) : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  bool search = false;
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();
  static const kDuration = Duration(milliseconds: 200);
  final controller = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Orders'),
      centerTitle: true,
      // 56 is the default leading width value
      leading: AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.sort)),
      actions: [
        AdaptiveButton(
            onPressed: () {}, padding: const EdgeInsets.symmetric(horizontal: 16.0), child: const Text('Export')),
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedCrossFade(
            firstChild: Row(
              children: [
                const SizedBox(width: 12.0),
                if (GetPlatform.isIOS)
                  Expanded(
                      child: CupertinoSearchTextField(
                    focusNode: searchNode,
                    controller: searchCtrl,
                    placeholder: 'Search for product name, variant title ...',
                    onChanged: (val) {
                      // controller.searchTerm = val;
                      // controller.pagingController.refresh();
                    },
                  )),
                if (GetPlatform.isAndroid)
                  Expanded(
                      child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    focusNode: searchNode,
                    controller: searchCtrl,
                    onChanged: (val) {
                      // controller.searchTerm = val;
                      // controller.pagingController.refresh();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search for product name, variant title ...',
                    ),
                  )),
                AdaptiveButton(
                    child: const Text('Cancel'),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      // await Future.delayed(Duration(milliseconds: 150));
                      setState(() {
                        search = false;
                        // if (controller.searchTerm.isNotEmpty) {
                        //   controller.searchTerm = '';
                        //   controller.pagingController.refresh();
                        // }
                        searchCtrl.clear();
                      });
                    }),
              ],
            ),
            secondChild: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AdaptiveIcon(
                          onPressed: () async {
                            setState(() {
                              search = true;
                            });
                            await Future.delayed(kDuration);
                            searchNode.requestFocus();
                          },
                          icon: const Icon(CupertinoIcons.search)),
                    ],
                  ),
                  Obx(() {
                    var orderCount = controller.ordersCount.value == 1
                        ? '${controller.ordersCount.value} Order'
                        : '${controller.ordersCount.value} Orders';

                    if (controller.ordersCount.value == 0) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(orderCount, style: Theme.of(context).textTheme.titleSmall));
                  }),
                ],
              ),
            ),
            crossFadeState: search ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: kDuration,
          )),
    );
  }
}
