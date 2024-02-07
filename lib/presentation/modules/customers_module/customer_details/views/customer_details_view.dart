import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/presentation/modules/customers_module/customer_details/controllers/customer_details_controller.dart';
import 'package:medusa_admin/presentation/views/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/domain/use_case/customer/customer_use_case.dart';
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CustomerDetailsView extends StatelessWidget {
  const CustomerDetailsView(this.customerId, {super.key});
  final String customerId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerDetailsController>(
        init: CustomerDetailsController(
          customerUseCase: CustomerUseCase.instance,
          ordersUseCase: OrdersUseCase.instance,
          customerId: customerId,
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Customer Details'),
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
                        itemBuilder: (context, order, index) =>
                            CustomerOrderCard(order,
                                index: index,
                                onTransferTap: () async => await context
                                        .pushRoute(
                                            TransferOrderRoute(order: order))
                                        .then((value) {
                                      if (value is bool) {
                                        // controller.pagingController.refresh();
                                        // CustomersController
                                        //     .instance.pagingController
                                        //     .refresh();
                                        // OrdersController
                                        //     .instance.pagingController
                                        //     .refresh();
                                      }
                                    })),
                        noItemsFoundIndicatorBuilder: (_) =>
                            const Center(child: Text('No orders yet')),
                        firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                            pagingController: controller.pagingController),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const Center(
                                child: CircularProgressIndicator.adaptive()),
                      ),
                    ),
                  ],
                );
              },
              onError: (e) => Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(e ?? 'Error loading customer details'),
                  FilledButton(
                      onPressed: () async => await controller.refreshView(),
                      child: const Text('Retry')),
                ],
              )),
              onLoading:
                  const Center(child: CircularProgressIndicator.adaptive()),
            )),
          );
        });
  }
}

// TODO: revisit this
class Delegate extends SliverPersistentHeaderDelegate {
  final Customer customer;

  Delegate(this.customer);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final controller = Get.find<CustomerDetailsController>();
    final tr = context.tr;

    final nameText = customer.firstName != null
        ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}',
            style: mediumTextStyle)
        : Text(customer.email, style: mediumTextStyle);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: context.theme.cardColor,
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
                        backgroundColor:
                            ColorManager.getAvatarColor(customer.email),
                        child: Text(
                            customer.firstName == null
                                ? customer.email[0].toUpperCase()
                                : customer.firstName![0],
                            style:
                                largeTextStyle!.copyWith(color: Colors.white)),
                      ),
                      const SizedBox(width: 12.0),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            nameText,
                            if (customer.firstName != null)
                              Text(customer.email, style: mediumTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          // title: tr.manageCustomer,
                          title:
                              '${customer.firstName ?? ''} ${customer.lastName ?? ''}',
                          context: context,
                          actions: <SheetAction<int>>[
                            SheetAction(label: tr.customerTableEdit, key: 0),
                          ]).then((value) async {
                        switch (value) {
                          case 0:
                            final result = await context.pushRoute(
                                AddUpdateCustomerRoute(customer: customer));
                            if (result is bool) {
                              await controller.loadCustomer();
                              // CustomersController.instance.pagingController
                              //     .refresh();
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
                          '${tr.detailsFirstSeen} ${customer.createdAt.formatDate()}',
                          style: smallTextStyle,
                        ),
                      Obx(() => Text(
                          '${tr.customerOrdersTableOrders}: ${controller.ordersCount.value}',
                          style: smallTextStyle)),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tr.detailsUser}: ${customer.hasAccount.toString().capitalizeFirst}',
                        style: smallTextStyle,
                      ),
                      Text('${tr.detailsPhone}: ${customer.phone ?? 'N/A'}',
                          style: smallTextStyle),
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
