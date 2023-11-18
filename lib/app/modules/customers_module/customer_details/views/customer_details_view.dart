import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/customers_module/customer_details/controllers/customer_details_controller.dart';
import 'package:medusa_admin/app/modules/customers_module/customers/controllers/customers_controller.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../data/models/store/customer.dart';
import '../../../../data/models/store/order.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerDetailsView extends GetView<CustomerDetailsController> {
  const CustomerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.customerDetails),
        leading: const AdaptiveBackButton(),
      ),
      body: SafeArea(
          child: controller.obx(
        (customer) {
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: Delegate(customer!),
              ),
              PagedSliverList(
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Order>(
                  itemBuilder: (context, order, index) => CustomerOrderCard(order,
                      index: index,
                      onTransferTap: () async =>
                          await Get.toNamed(Routes.TRANSFER_ORDER, arguments: order)?.then((value) {
                            if (value is bool) {
                              controller.pagingController.refresh();
                              CustomersController.instance.pagingController.refresh();
                              OrdersController.instance.pagingController.refresh();
                            }
                          })),
                  noItemsFoundIndicatorBuilder: (_) => Center(child: Text(tr.noOrders)),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                ),
              ),
            ],
          );
        },
        onError: (e) => Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(e ?? tr.errorLoadingCustomDetails),
            AdaptiveFilledButton(onPressed: () async => await controller.refreshView(), child: Text(tr.retry)),
          ],
        )),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      )),
    );
  }
}

// TODO: revisit this
class Delegate extends SliverPersistentHeaderDelegate {
  final Customer customer;

  Delegate(this.customer);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final controller = Get.find<CustomerDetailsController>();
    final tr = AppLocalizations.of(context)!;

    final nameText = customer.firstName != null
        ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}', style: mediumTextStyle)
        : Text(customer.email, style: mediumTextStyle);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: Theme.of(context).expansionTileTheme.backgroundColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.getAvatarColor(customer.email),
                        child: Text(
                            customer.firstName == null ? customer.email[0].toUpperCase() : customer.firstName![0],
                            style: largeTextStyle!.copyWith(color: Colors.white)),
                      ),
                      const SizedBox(width: 12.0),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            nameText,
                            if (customer.firstName != null) Text(customer.email, style: mediumTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AdaptiveIcon(
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          title: tr.manageCustomer,
                          message: '${customer.firstName ?? ''} ${customer.lastName ?? ''}',
                          context: context,
                          actions: <SheetAction<int>>[
                            SheetAction(label: tr.edit, key: 0),
                            SheetAction(label: tr.delete, isDestructiveAction: true, key: 1),
                          ]).then((value) async {
                        switch (value) {
                          case 0:
                            final result = await Get.toNamed(Routes.UPDATE_CUSTOMER_DETAILS, arguments: customer);
                            if (result is bool) {
                              await controller.loadCustomer();
                              CustomersController.instance.pagingController.refresh();
                            }
                            break;
                          case 1:
                            break;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_horiz)),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (customer.createdAt != null)
                        Text(
                          '${tr.firstSeen} ${customer.createdAt.formatDate()}',
                          style: smallTextStyle,
                        ),
                      Obx(() => Text('${tr.orders}: ${controller.ordersCount.value}', style: smallTextStyle)),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tr.user}: ${customer.hasAccount.toString().capitalizeFirst}',
                        style: smallTextStyle,
                      ),
                      Text('${tr.phone}: ${customer.phone ?? 'N/A'}', style: smallTextStyle),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 2.4;

  @override
  double get minExtent => kToolbarHeight * 2.4;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
