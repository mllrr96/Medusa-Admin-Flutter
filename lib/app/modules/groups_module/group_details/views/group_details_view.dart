import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../controllers/group_details_controller.dart';

class GroupDetailsView extends GetView<GroupDetailsController> {
  const GroupDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? getName(Customer customer) {
      String? name;
      if (customer.firstName != null && customer.lastName != null) {
        name = '${customer.firstName ?? ''} ${customer.lastName ?? ''}';
      }
      return name;
    }

    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async => await controller.addCustomers(),
          child: const Icon(CupertinoIcons.person_add_solid),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Obx(() {
                if (controller.groupName.value.isNotEmpty) {
                  return Text(controller.groupName.value);
                }
                return const Text('Group Details');
              }),
              // actions: [
              //   AdaptiveIcon(
              //       onPressed: () async => await controller.addCustomers(),
              //       icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add))
              // ],
            ),
            PagedSliverList(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Customer>(
                  itemBuilder: (context, customer, index) {
                    final name = getName(customer);
                    return ListTile(
                      onTap: () => Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: customer.id),
                      leading: CircleAvatar(
                        radius: 16,
                        child: Text(name?[0].capitalize ?? customer.email[0].capitalize ?? ''),
                      ),
                      title: Text(name ?? customer.email),
                      subtitle: name != null ? Text(customer.email, style: smallTextStyle) : null,
                      trailing: AdaptiveIcon(
                          onPressed: () async {
                            await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                              const SheetAction(label: 'Customer details', key: 0),
                              const SheetAction(label: 'Delete from the group', isDestructiveAction: true, key: 1),
                            ]).then((result) async {
                              switch (result) {
                                case 0:
                                  Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: customer.id);
                                  break;
                                case 1:
                                  await showOkCancelAlertDialog(
                                          context: context,
                                          title: 'Delete the group',
                                          message: 'Are you sure you want to delete this customer from  group?',
                                          okLabel: 'Yes, delete',
                                          cancelLabel: 'No, cancel',
                                          isDestructiveAction: true)
                                      .then((value) async {
                                    if (value == OkCancelResult.ok) {
                                      await controller.deleteCustomer(customer.id!);
                                    }
                                  });

                                  break;
                              }
                            });
                          },
                          icon: const Icon(Icons.more_horiz)),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  noItemsFoundIndicatorBuilder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No customers in this group yet'),
                          AdaptiveButton(
                              onPressed: () async => await controller.addCustomers(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add),
                                  const SizedBox(width: 6.0),
                                  const Text('Add customers'),
                                ],
                              ))
                        ],
                      )),
              // separatorBuilder: (_, __) => const Divider(height: 0),
            ),
          ],
        ));
  }
}
