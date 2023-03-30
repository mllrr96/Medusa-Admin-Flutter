import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

class OrderCreateFulfillment extends GetView<OrderDetailsController> {
  const OrderCreateFulfillment({required this.order, Key? key}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: const Text('Create Fulfillment')),
      body: SafeArea(
        child: ListView(
          children: [
            Text('Items', style: mediumTextStyle),
            ListView.builder(
              shrinkWrap: true,
              itemCount: order.items!.length,
              itemBuilder: (context, index) {
                final item = order.items![index];
                return CheckboxListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!),
                        ),
                        Text(item.title ?? ''),
                      ],
                    ),
                    value: false,
                    onChanged: (val) {});
              },
            )
          ],
        ),
      ),
    );
  }
}
