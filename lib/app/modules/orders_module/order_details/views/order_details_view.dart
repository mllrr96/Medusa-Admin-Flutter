import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../../../../data/models/store/order.dart';
import '../components/index.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<OrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Order Details'),
            centerTitle: true,
            actions: [
              if (controller.state != null)
                AdaptiveButton(
                  onPressed: controller.state!.status != OrderStatus.canceled
                      ? () async {
                          final order = controller.state!;
                          await showTextAnswerDialog(
                            title: 'Cancel order',
                            message:
                                'Are you sure you want to cancel the order? \n Type the name "order #${order.displayId!}" to confirm.',
                            retryMessage:
                                'Make sure to type the name "order #${order.displayId!}" to confirm order deletion.',
                            retryOkLabel: 'Retry',
                            context: context,
                            keyword: 'order #${order.displayId!}',
                            isDestructiveAction: true,
                            hintText: 'order #${order.displayId!}',
                            okLabel: 'Yes, confirm',
                          ).then((value) async {
                            if (value) {
                              await controller.cancelOrder();
                            }
                          });
                        }
                      : null,
                  child: const Text('Cancel'),
                ),
            ],
          ),
          body: SafeArea(
            child: controller.obx(
              (order) => ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                children: [
                  OrderOverview(order: order!),
                  space,
                  OrderSummery(order),
                  space,
                  OrderPayment(order),
                  space,
                  OrderFulfillment(order),
                  space,
                  OrderCustomer(order),
                  space,
                  OrderTimeline(order),
                ],
              ),
              onEmpty: const Center(child: Text('No order details found')),
              onError: (e) => Center(child: Text(e ?? 'Error loading order details')),
              onLoading: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }
}
