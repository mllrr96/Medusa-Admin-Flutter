import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/keep_alive_widget.dart';
import '../components/index.dart';
import '../controllers/create_draft_order_controller.dart';

class CreateDraftOrderView extends GetView<CreateDraftOrderController> {
  const CreateDraftOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDraftOrderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
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
                      onPressed: controller.tabController.index != 0
                          ? () {
                              controller.tabController.animateTo(0);
                              controller.update();
                            }
                          : null,
                      child: const Text('Back')),
                  AdaptiveButton(
                      onPressed: () async {
                        switch (controller.tabController.index) {
                          case 0:
                            if (!controller.formKey.currentState!.validate()) {
                              return;
                            }

                            if (controller.lineItems.isEmpty &&
                                controller.customLineItems.isEmpty) {
                              controller.expansionController.expand();
                              return;
                            }
                            controller.tabController.animateTo(1);
                            controller.update();
                          case 1:
                            if (!controller.formKey2.currentState!.validate()) {
                              return;
                            }
                            controller.tabController.animateTo(2);
                            controller.update();
                          case 2:
                            await controller.createDraftOrder();
                        }
                      },
                      child:controller.tabController.index == 2 ? const Text('Create'): const Text('Next')),
                ],
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: <Widget>[
                KeepAliveWidget(child: ItemsView(controller)),
                AddressView(controller, context: context),
                DraftOrderOverView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
