import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

class OrderTimeline extends GetView<OrderDetailsController> {
  const OrderTimeline(this.order, {Key? key}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
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
      key: controller.timelineKey,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await scrollToSelectedContent(globalKey: controller.timelineKey);
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Timeline'),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
    );
  }
}
