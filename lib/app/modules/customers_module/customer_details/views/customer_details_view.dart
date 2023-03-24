import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
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
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.primary,
                          child: Text(
                              customer.firstName == null
                                  ? customer.email[1].capitalize ?? customer.email[1]
                                  : customer.firstName![1],
                              style: largeTextStyle!.copyWith(color: Colors.white)),
                        ),
                        const SizedBox(width: 6.0),
                        Column(
                          children: [
                            nameText,
                            if (customer.firstName != null) Text(customer.email, style: mediumTextStyle),
                          ],
                        ),
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
                              if (customer.orders != null)
                                Text('Orders: ${customer.orders!.length}', style: smallTextStyle),
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
              if (customer.orders != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).expansionTileTheme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Orders ${customer.orders?.length ?? ''}'),
                      const SizedBox(height: 6.0),
                      ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                        itemCount: customer.orders!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => CustomerOrderCard(customer.orders![index],
                            onTransferTap: () => Get.toNamed(Routes.TRANSFER_ORDER)),
                      ),
                    ],
                  ),
                ),
              if (customer.orders == null) const Text('No Orders')
            ],
          );
        },
        onError: (e) => Center(child: Text(e ?? 'Error loading customer details')),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      )),
    );
  }
}
