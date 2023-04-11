import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

class OrderTimeline extends GetView<OrderDetailsController> {
  const OrderTimeline(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {

    return CustomExpansionTile(
      key: controller.timelineKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Timeline'),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
    );
  }
}
