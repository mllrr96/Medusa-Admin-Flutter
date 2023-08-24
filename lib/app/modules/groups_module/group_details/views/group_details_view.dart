import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/scrolling_expandable_fab.dart';
import 'package:medusa_admin/app/modules/groups_module/groups/controllers/groups_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/customer_group.dart';
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
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
        floatingActionButton: ScrollingExpandableFab(
          controller: controller.scrollController,
          label: 'Add Customers',
          icon: const Icon(CupertinoIcons.person_add_solid),
          onPressed: () async => await controller.addCustomers(),
        ),
        body: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(controller.customerGroup.name ?? ''),
              actions: [
                AdaptiveIcon(
                    onPressed: () async {
                      await showModalActionSheet<int>(
                          title: 'Manage group',
                          message: controller.customerGroup.name ?? '',
                          context: context,
                          actions: <SheetAction<int>>[
                            const SheetAction(label: 'Edit', key: 0),
                            const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                          ]).then((result) async {
                        switch (result) {
                          case 0:
                            await Get.toNamed(Routes.CREATE_UPDATE_GROUP, arguments: controller.customerGroup)
                                ?.then((value) {
                              if (value is CustomerGroup) {
                                controller.customerGroup = value;
                                GroupsController.instance.pagingController.refresh();
                              }
                            });
                            break;
                          case 1:
                            await showOkCancelAlertDialog(
                              context: context,
                              title: 'Delete the group',
                              message: 'Are you sure you want to delete this customer group?',
                              okLabel: 'Yes, delete',
                              isDestructiveAction: true,
                            ).then((value) async {
                              if (value == OkCancelResult.ok) {
                                await controller.deleteGroup();
                              }
                            });

                            break;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
            PagedSliverList(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Customer>(
                  itemBuilder: (context, customer, index) {
                    final name = getName(customer);
                    return ListTile(
                      onTap: () => Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: customer.id),
                      leading: CircleAvatar(
                        backgroundColor: ColorManager.getAvatarColor(customer.email),
                        radius: 16,
                        child: Text(name?[0].capitalize ?? customer.email[0].capitalize ?? '', style: largeTextStyle?.copyWith(color: Colors.white)),
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
                  noItemsFoundIndicatorBuilder: (context) =>
                      const Center(child: Text('No customers in this group yet'))),
            ),
          ],
        ));
  }
}
