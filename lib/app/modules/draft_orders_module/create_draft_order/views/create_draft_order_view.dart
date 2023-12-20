import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/keep_alive_widget.dart';
import '../../../../data/repository/draft_order/draft_order_repo.dart';
import '../../../../data/repository/regions/regions_repo.dart';
import '../components/index.dart';
import '../controllers/create_draft_order_controller.dart';

@RoutePage()
class CreateDraftOrderView extends StatelessWidget {
  const CreateDraftOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> willPop(CreateDraftOrderController controller) async {
      if (controller.tabController.index > 0) {
        controller.tabController.animateTo(controller.tabController.index - 1);
        return false;
      }
      if (controller.customLineItems.isNotEmpty ||
          controller.lineItems.isNotEmpty) {
        return await showOkCancelAlertDialog(
                context: context,
                title: 'Discard changes?',
                message: 'Are you sure you want to discard changes?',
                isDestructiveAction: true)
            .then((result) {
          switch (result) {
            case OkCancelResult.ok:
              context.popRoute();
              return true;
            case OkCancelResult.cancel:
              return false;
          }
        });
      }
      return true;
    }

    Future<void> onCloseTap(CreateDraftOrderController controller) async {
      if (controller.customLineItems.isNotEmpty ||
          controller.lineItems.isNotEmpty) {
        await showOkCancelAlertDialog(
                context: context,
                title: 'Discard changes?',
                message: 'Are you sure you want to discard changes?',
                isDestructiveAction: true)
            .then((result) {
          switch (result) {
            case OkCancelResult.ok:
              context.popRoute();
            case OkCancelResult.cancel:
          }
        });
      } else {
       context.popRoute();
      }
    }

    return GetBuilder<CreateDraftOrderController>(
      init: CreateDraftOrderController(
          regionsRepo: RegionsRepo(), draftOrderRepo: DraftOrderRepo()),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => willPop(controller),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: AdaptiveCloseButton(
                    onPressed: () => onCloseTap(controller)),
                title: const Text('Create Draft Order'),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewPadding.bottom),
                color: Theme.of(context).appBarTheme.backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdaptiveButton(
                        onPressed: switch (controller.tabController.index) {
                          0 => null,
                          1 => () {
                              controller.tabController.animateTo(0);
                              controller.update();
                            },
                          2 => () {
                              controller.tabController.animateTo(1);
                              controller.update();
                            },
                          int() => null,
                        },
                        child: const Text('Back')),
                    AdaptiveButton(
                        onPressed: switch (controller.tabController.index) {
                          0 => () {
                              if (!controller.formKey.currentState!
                                  .validate()) {
                                return;
                              }
                              if (controller.lineItems.isEmpty &&
                                  controller.customLineItems.isEmpty) {
                                controller.expansionController.expand();
                                return;
                              }
                              controller.tabController.animateTo(1);
                              controller.update();
                            },
                          1 => () {
                              if (!controller.formKey2.currentState!
                                  .validate()) {
                                return;
                              }
                              controller.tabController.animateTo(2);
                              controller.update();
                            },
                          2 => () async => await controller.createDraftOrder(context),
                          int() => null,
                        },
                        child: controller.tabController.index == 2
                            ? const Text('Create')
                            : const Text('Next')),
                  ],
                ),
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: <Widget>[
                  KeepAliveWidget(child: ItemsView(controller)),
                  AddressView(controller, context: context),
                  DraftOrderOverView(controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
