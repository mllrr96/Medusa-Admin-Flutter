import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import '../components/pick_customer_app_bar.dart';
import '../controllers/pick_customer_controller.dart';

class PickCustomerView extends StatelessWidget {
  const PickCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickCustomerController>(
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const AdaptiveCloseButton(),
                title: const Text('Pick Customer'),
                actions: [
                  AdaptiveButton(
                      onPressed: controller.selectedCustomers.isNotEmpty
                          ? () => Get.back(result: PickCustomerRes(selectedCustomers: controller.selectedCustomers))
                          : null,
                      child: const Text('Done'))
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: PickCustomerAppBar(
                    searchCtrl: controller.searchCtrl,
                    searchFocusNode: FocusNode(),
                  ),
                ),
              ),
              PagedSliverList.separated(
                pagingController: controller.pagingController,
                separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
                builderDelegate: PagedChildBuilderDelegate<Customer>(
                  itemBuilder: (context, customer, index) {
                    final titleText = customer.firstName != null
                        ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                        : customer.email;
                    return CheckboxListTile(

                        enabled: !controller.disabledCustomers.map((e) => e.id!).contains(customer.id),
                        title: Text(titleText),
                        value: controller.selectedCustomers.map((e) => e.id).toList().contains(customer.id),
                        selected: controller.selectedCustomers.map((e) => e.id).toList().contains(customer.id),
                        onChanged: (val) {
                          if (val == null) return;
                          if (!controller.pickCustomerReq.multipleSelection) {
                            controller.selectedCustomers = [customer];
                            controller.update();
                            return;
                          }

                          if (val) {
                            controller.selectedCustomers.add(customer);
                          } else {
                            controller.selectedCustomers.removeWhere((v) => v.id == customer.id);
                          }
                          controller.update();
                        });
                  },
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  noItemsFoundIndicatorBuilder: (context) => const Center(child: Text('No Customers Found')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
