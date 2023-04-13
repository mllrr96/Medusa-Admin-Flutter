import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';
import 'package:medusa_admin/app/modules/groups_module/groups/controllers/groups_controller.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
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
    return Slidable(
      groupTag: const Key('groups'),
      key: ValueKey(customerGroup.id!),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) async{
              await Get.toNamed(Routes.CREATE_UPDATE_GROUP, arguments: customerGroup)?.then((value) {
                if (value is CustomerGroup) {
                  controller.pagingController.refresh();
                }
              });
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: MedusaIcons.pencil_square_solid,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (_) async{
              await showOkCancelAlertDialog(
                context: context,
                title: 'Delete the group',
                message: 'Are you sure you want to delete this customer group?',
                okLabel: 'Yes, delete',
                isDestructiveAction: true,
              ).then((value) async {
                if (value == OkCancelResult.ok) {
                  await controller.deleteGroup(id: customerGroup.id!);
                }
              });
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Get.toNamed(Routes.GROUP_DETAILS, arguments: customerGroup),
        tileColor: index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null,
        title: Text(customerGroup.name ?? '', style: largeTextStyle),
        subtitle: Text('Members: ${customerGroup.customers?.length ?? ''}', style: smallTextStyle),
      ),
    );
  }
}
