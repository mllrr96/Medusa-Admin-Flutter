import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/order.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../orders/components/fulfillment_label.dart';
import 'order_create_fulfillment.dart';

class OrderFulfillment extends GetView<OrderDetailsController> {
  const OrderFulfillment(this.order,{Key? key }) : super(key: key);
final Order order;
  @override
  Widget build(BuildContext context) {


    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQueryPadding.top - 56;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }
    return CustomExpansionTile(
      key: controller.fulfillmentKey,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await scrollToSelectedContent(globalKey: controller.fulfillmentKey);
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      title: const Text('Fulfillment'),
      trailing: order.fulfillmentStatus != FulfillmentStatus.fulfilled
          ? AdaptiveButton(
        onPressed: () => Get.to(OrderCreateFulfillment(order: order), fullscreenDialog: true),
        padding: EdgeInsets.zero,
        child: const Text('Create Fulfillment'),
      )
          : null,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping method', style: mediumTextStyle!.copyWith(color: lightWhite)),
            FulfillmentStatusLabel(fulfillmentStatus: order.fulfillmentStatus),
          ],
        ),
        if (order.shippingMethods == null) Text('None', style: mediumTextStyle),
        if (order.shippingMethods != null)
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.shippingMethods!.length,
              itemBuilder: (context, index) =>
                  Text(order.shippingMethods![index].shippingOption?.name ?? '', style: mediumTextStyle)),
        // Text(order)
      ],
    );
  }
}
