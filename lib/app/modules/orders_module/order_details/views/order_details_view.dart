import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/order.dart';
import '../components/index.dart';
import '../controllers/order_details_controller.dart';

@RoutePage()
class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final tr = context.tr;

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

    return GetBuilder<OrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: Text(tr.orderTableOrder),
            centerTitle: true,
            actions: [
              if (controller.state?.status != OrderStatus.canceled)
                AdaptiveIcon(
                    onPressed: () async {
                      await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                        SheetAction(
                          label: tr.detailsCancelOrderHeading,
                          key: 0,
                          isDestructiveAction: true,
                        ),
                      ]).then((result) async {
                        switch (result) {
                          case 0:
                            final order = controller.state!;
                            await showTextAnswerDialog(
                              title: tr.detailsCancelOrderHeading,
                              message: tr.detailsAreYouSureYouWantToCancelTheOrder,
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
                            return;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_horiz)),
            ],
          ),
          body: SafeArea(
            child: controller.obx(
              (order) => SingleChildScrollView(
                controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      OrderOverview(
                        order: order!,
                      ),
                      space,
                      OrderSummery(
                        order,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.summeryKey);
                          }
                        },
                        key: controller.summeryKey,
                      ),
                      space,
                      OrderPayment(
                        order,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.paymentKey);
                          }
                        },
                      ),
                      space,
                      OrderFulfillment(
                        order,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.fulfillmentKey);
                          }
                        },
                      ),
                      space,
                      OrderCustomer(
                        order,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.customerKey);
                          }
                        },
                      ),
                      space,
                      OrderTimeline(
                        order,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.timelineKey);
                          }
                        },
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
              onEmpty: const Center(child: Text( "No order found")),
              onError: (e) => Center(child: Text(e ?? '"Error loading order"')),
              onLoading: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }
}
