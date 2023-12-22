import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';

import '../../../../data/repository/draft_order/draft_order_repo.dart';
import '../../../components/adaptive_button.dart';
import '../components/draft_order_summery.dart';
import '../components/index.dart';
import '../controllers/draft_order_details_controller.dart';

@RoutePage()
class DraftOrderDetailsView extends StatelessWidget {
  const DraftOrderDetailsView(this.draftId, {super.key});
  final String draftId;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);

    final smallTextStyle = context.bodySmall;

    return GetBuilder<DraftOrderDetailsController>(
      init: DraftOrderDetailsController(
          draftOrderRepo: DraftOrderRepo(), draftId: draftId),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Draft Order Details'),
            actions: [
              if (controller.state?.status == DraftOrderStatus.completed)
                AdaptiveButton(
                  onPressed: () => context.pushRoute(
                      OrderDetailsRoute(orderId: controller.state!.orderId!)),
                  child: const Text('Go to order'),
                ),
              if (controller.state?.status == DraftOrderStatus.open)
                AdaptiveButton(
                  onPressed: () async {
                    await showOkCancelAlertDialog(
                      context: context,
                      title: 'Cancel Draft Order',
                      message:
                          'Are you sure you want to cancel this draft order?',
                      okLabel: 'Yes, Cancel',
                      isDestructiveAction: true,
                    ).then((result) async {
                      if (result == OkCancelResult.ok) {
                        await controller.cancelDraftOrder(context);
                      }
                    });
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
          body: SafeArea(
            child: controller.obx(
              (draftOrder) => SingleChildScrollView(
                controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      DraftOrderOverview(draftOrder!),
                      space,
                      DraftOrderSummery(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await controller.summeryKey.currentContext.ensureVisibility();
                          }
                        },
                        key: controller.summeryKey,
                      ),
                      space,
                      DraftOrderPayment(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await  controller.paymentKey.currentContext.ensureVisibility();
                          }
                        },
                        key: controller.paymentKey,
                      ),
                      space,
                      DraftOrderShipping(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await  controller.shippingKey.currentContext.ensureVisibility();
                          }
                        },
                        key: controller.shippingKey,
                      ),
                      space,
                      DraftOrderCustomer(
                        draftOrder,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await controller.customerKey.currentContext.ensureVisibility();
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
              onError: (e) => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 12.0),
                    Flexible(
                        child: Text(
                      e ?? 'Error loading draft order',
                      style: smallTextStyle,
                    )),
                  ],
                ),
              )),
              onLoading:
                  const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }
}
