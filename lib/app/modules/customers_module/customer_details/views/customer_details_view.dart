import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import '../../../../data/models/store/order.dart';
import '../controllers/customer_details_controller.dart';

class CustomerDetailsView extends GetView<CustomerDetailsController> {
  const CustomerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
        leading: const AdaptiveBackButton(),
      ),
      body: SafeArea(
          child: controller.obx(
        (customer) {
          final nameText = customer!.firstName != null
              ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}', style: mediumTextStyle)
              : Text(customer.email, style: mediumTextStyle);
          return ListView(
            children: [
              Container(
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
                                backgroundColor: ColorManager.primary,
                                child: Text(
                                    customer.firstName == null
                                        ? customer.email[0].toUpperCase()
                                        : customer.firstName![0],
                                    style: largeTextStyle!.copyWith(color: Colors.white)),
                              ),
                              const SizedBox(width: 6.0),
                              Flexible(
                                child: Column(
                                  children: [
                                    nameText,
                                    if (customer.firstName != null) Text(customer.email, style: mediumTextStyle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AdaptiveIcon(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
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
                                  'First seen: ${DateFormat.yMMMd().format(customer.createdAt!)}',
                                  style: smallTextStyle,
                                ),
                              Obx(() => Text('Orders: ${controller.ordersCount.value}', style: smallTextStyle)),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User: ${customer.hasAccount}',
                                style: smallTextStyle,
                              ),
                              Text('Phone: ${customer.phone ?? 'N/A'}', style: smallTextStyle),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Obx(() => Text('Orders ${controller.ordersCount.value}')),
              ),
              PagedListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Order>(
                    itemBuilder: (context, order, index) =>
                        CustomerOrderCard(order, index: index, onTransferTap: () => Get.toNamed(Routes.TRANSFER_ORDER)),
                    noItemsFoundIndicatorBuilder: (_) => const Center(child: Text('No Orders')),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator.adaptive())),
              ),
            ],
          );
        },
        onError: (e) => Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(e ?? 'Error loading customer details'),
            AdaptiveButton(onPressed: () async => await controller.refreshView(), child: const Text('Retry')),
          ],
        )),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      )),
    );
  }
}
