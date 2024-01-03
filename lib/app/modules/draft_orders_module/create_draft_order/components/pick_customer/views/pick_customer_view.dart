import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/customer_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import '../components/pick_customer_app_bar.dart';
import '../controllers/pick_customer_controller.dart';

@RoutePage()
class PickCustomerView extends StatelessWidget {
  const PickCustomerView({super.key, this.pickCustomerReq});
  final PickCustomerReq? pickCustomerReq;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickCustomerController>(
      init: PickCustomerController(customerUseCase: CustomerUseCase.instance, pickCustomerReq: pickCustomerReq ?? PickCustomerReq()),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const CloseButton(),
                title: const Text('Pick Customer'),
                actions: [
                  TextButton(
                      onPressed: controller.selectedCustomers.isNotEmpty
                          ? () => context.popRoute(PickCustomerRes(selectedCustomers: controller.selectedCustomers))
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
