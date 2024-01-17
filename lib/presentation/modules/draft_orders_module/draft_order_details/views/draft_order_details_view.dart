import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/draft_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';

import '../components/draft_order_summery.dart';
import '../components/index.dart';
import '../controllers/draft_order_details_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
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
          draftDetailsUseCase: DraftDetailsUseCase.instance, draftId: draftId),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Draft Order Details'),
            actions: [
              if (controller.state?.status == DraftOrderStatus.completed)
                TextButton(
                  onPressed: () => context.pushRoute(
                      OrderDetailsRoute(orderId: controller.state!.orderId!)),
                  child: const Text('Go to order'),
                ),
              if (controller.state?.status == DraftOrderStatus.open)
                TextButton(
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
                  const DraftOrderLoadingPage(), // DraftOrderLoadingPage(),
            ),
          ),
        );
      },
    );
  }
}
