import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../../../components/adaptive_button.dart';
import '../components/draft_order_summery.dart';
import '../components/index.dart';
import '../controllers/draft_order_details_controller.dart';

class DraftOrderDetailsView extends GetView<DraftOrderDetailsController> {
  const DraftOrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final yPosition =
            (globalKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero).dy ?? 0.0;
        var topPadding = context.mediaQueryPadding.top + kToolbarHeight;
        final scrollPoint = controller.scrollController.offset + yPosition - topPadding;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }

    return GetBuilder<DraftOrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Draft Order Details'),
            actions: [
              if (controller.state?.status == DraftOrderStatus.completed)
                AdaptiveButton(
                  onPressed: () => Get.toNamed(Routes.ORDER_DETAILS, arguments: controller.state!.orderId!),
                  child: const Text('Go to order'),
                )
            ],
          ),
          body: SafeArea(
            child: controller.obx(
              (draftOrder) => SingleChildScrollView(
                controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      DraftOrderOverview(draftOrder!),
                      space,
                      DraftOrderSummery(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.summeryKey);
                          }
                        },
                        key: controller.summeryKey,
                      ),
                      space,
                      DraftOrderPayment(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.paymentKey);
                          }
                        },
                        key: controller.paymentKey,
                      ),
                      space,
                      DraftOrderShipping(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.shippingKey);
                          }
                        },
                        key: controller.shippingKey,
                      ),
                      space,
                      DraftOrderCustomer(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.customerKey);
                          }
                        },
                        key: controller.customerKey,
                      ),
                      space,
                    ],
                  ),
                ),
              ),
              onEmpty: const Center(child: Text('No order details found')),
              onError: (e) => Center(child: Text(e ?? 'Error loading draft order')),
              onLoading: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }
}
