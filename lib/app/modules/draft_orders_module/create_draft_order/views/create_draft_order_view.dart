import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/keep_alive_widget.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/choose_customer.dart';

import '../components/index.dart';
import '../controllers/create_draft_order_controller.dart';

class CreateDraftOrderView extends GetView<CreateDraftOrderController> {
  const CreateDraftOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = controller.tabController;
    return GetBuilder<CreateDraftOrderController>(
      id: 0,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveCloseButton(),
            title: const Text('Create Draft Order'),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(
                      onPressed: controller.index.value != 0
                          ? () {
                              switch (tabController.index) {
                                case 0:
                                case 1:
                                case 2:
                                case 3:
                                case 4:
                                case 5:
                              }
                              tabController.animateTo(tabController.index - 1);
                            }
                          : null,
                      child: const Text('Back')),
                  if (controller.index.value != 5)
                    AdaptiveButton(onPressed: controller.onNextTap(), child: const Text('Next')),
                  if (controller.index.value == 5) AdaptiveButton(onPressed: () {}, child: const Text('Create')),
                ],
              );
            }),
          ),
          body: SafeArea(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                KeepAliveWidget(child: ChooseRegionView()),
                KeepAliveWidget(child: ChooseItemsView()),
                KeepAliveWidget(child: ChooseShippingMethodView()),
                KeepAliveWidget(child: ChooseCustomerView()),
                Text('Billing address'),
                Text('Overview'),
              ],
            ),
          ),
        );
      },
    );
  }
}
