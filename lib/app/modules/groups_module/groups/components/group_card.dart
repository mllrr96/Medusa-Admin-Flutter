import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/modules/groups_module/groups/controllers/groups_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_icon.dart';

class GroupCard extends GetView<GroupsController> {
  const GroupCard({Key? key, required this.customerGroup, required this.index}) : super(key: key);
  final CustomerGroup customerGroup;
  final int index;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return ListTile(
      onTap: () => Get.toNamed(Routes.GROUP_DETAILS, arguments: customerGroup.id),
      tileColor: index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null,
      title: Text(customerGroup.name ?? '', style: largeTextStyle),
      subtitle: Text('Members: ${customerGroup.customers?.length ?? ''}', style: smallTextStyle),
      trailing: AdaptiveIcon(
          onPressed: () async {
            await showModalActionSheet<int>(
                title: 'Manage group',
                message: customerGroup.name ?? '',
                context: context, actions: <SheetAction<int>>[
              const SheetAction(label: 'Edit', key: 0),
              const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
            ]).then((result) async {
              switch (result) {
                case 0:
                  await Get.toNamed(Routes.CREATE_UPDATE_GROUP, arguments: customerGroup.id)?.then((value) {
                    if (value is bool && value) {
                      controller.pagingController.refresh();
                    }
                  });
                  break;
                case 1:
                  await showOkCancelAlertDialog(
                          context: context,
                          title: 'Delete the group',
                          message: 'Are you sure you want to delete this customer group?',
                          okLabel: 'Yes, delete',
                          cancelLabel: 'No, cancel',
                          isDestructiveAction: true)
                      .then((value) async {
                    if (value == OkCancelResult.ok) {
                      await controller.deleteGroup(id: customerGroup.id!);
                    }
                  });

                  break;
              }
            });
          },
          icon: const Icon(Icons.more_horiz)),
    );
  }
}
