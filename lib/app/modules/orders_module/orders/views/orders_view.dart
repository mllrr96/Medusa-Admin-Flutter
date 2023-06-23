import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/order.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/drawer.dart';
import '../../../components/search_text_field.dart';
import '../components/order_card.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final isDrawer = StorageService.appSettings.isDrawer;

    PreferredSizeWidget getAppBar() {
      if (isDrawer) {
        return AppBar(
          title: const Text('Orders'),
          bottom: const OrdersBottomAppBar(),
        );
      }
      return const OrdersBottomAppBar();
    }

    return Scaffold(
      drawer: isDrawer ? const AppDrawer() : null,
      appBar: getAppBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'orders',
        onPressed: () {},
        child: const Icon(MedusaIcons.arrow_up_tray, size: 20),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.pagingController.refresh(),
        header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
        child: PagedListView.separated(
          padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Order>(
              itemBuilder: (context, order, index) => AlternativeOrderCard(order),
              noItemsFoundIndicatorBuilder: (_) => Center(child: Text(tr.noOrders)),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive())),
          separatorBuilder: (_, __) => const Divider(height: 1),
        ),
      ),
    );
  }
}

class OrdersBottomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const OrdersBottomAppBar({super.key});

  @override
  State<OrdersBottomAppBar> createState() => _OrdersBottomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _OrdersBottomAppBarState extends State<OrdersBottomAppBar> {
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();
  bool productSearch = false;

  @override
  Widget build(BuildContext context) {
    const kDuration = Duration(milliseconds: 200);
    final controller = OrdersController.instance;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: AnimatedCrossFade(
          key: const ValueKey(0),
          firstChild: SizedBox(
            height: kToolbarHeight,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: SearchTextField(
                          controller: searchCtrl,
                          hintText: 'Search for orders\' email, ID',
                          onChanged: (val) {
                            if (controller.searchTerm.value != val) {
                              controller.searchTerm.value = val;
                            }
                          },
                          focusNode: searchNode,
                        ),
                      ),
                      AdaptiveButton(
                          child: const Text('Cancel'),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              productSearch = false;
                              searchCtrl.clear();
                              if (controller.searchTerm.value.isNotEmpty) {
                                controller.searchTerm.value = '';
                              }
                            });
                          }),
                    ],
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
          secondChild: SizedBox(
            height: kToolbarHeight,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AdaptiveIcon(
                              onPressed: () async {
                                setState(() => productSearch = true);
                                await Future.delayed(kDuration);
                                searchNode.requestFocus();
                              },
                              icon: const Icon(MedusaIcons.magnifying_glass)),
                          const SizedBox(width: 6.0),
                          InkWell(
                            onTap: () {},
                            child: Chip(
                              side: const BorderSide(color: Colors.transparent),
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Filters',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: lightWhite)),
                                  Text(' 0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: ColorManager.primary)),
                                ],
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (Platform.isAndroid)
                            AdaptiveButton(
                                onPressed: () {},
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: const Text('Export')),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
          crossFadeState: productSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: kDuration),
    );
  }
}
