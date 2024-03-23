import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';

class GroupCard extends StatelessWidget {
  const GroupCard(
      {super.key, required this.customerGroup, required this.index, this.onDelete, this.afterUpdate});
  final CustomerGroup customerGroup;
  final int index;
  final void Function()? onDelete;
  final void Function()? afterUpdate;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return Slidable(
      groupTag: const Key('groups'),
      key: ValueKey(customerGroup.id!),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) async {
              await context.pushRoute(CreateUpdateGroupRoute(customerGroup: customerGroup)).then((value) {
                if (value is CustomerGroup) {
                  afterUpdate?.call();
                }
              });
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: MedusaIcons.pencil_square_solid,
            // label: 'Edit',
          ),
          SlidableAction(
            onPressed: (_) async {
              await showOkCancelAlertDialog(
                context: context,
                title: 'Delete the group',
                message: 'Are you sure you want to delete this customer group?',
                okLabel: 'Yes, delete',
                isDestructiveAction: true,
              ).then((value) async {
                if (value == OkCancelResult.ok) {
                  onDelete?.call();
                }
              });
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            // label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        onTap: () =>
            context.pushRoute(GroupDetailsRoute(customerGroup: customerGroup)),
        tileColor:
            index.isOdd ? Theme.of(context).appBarTheme.backgroundColor : null,
        title: Text(customerGroup.name ?? '', style: largeTextStyle),
        subtitle: Text('Members: ${customerGroup.customers?.length ?? ''}',
            style: smallTextStyle),
      ),
    );
  }
}
