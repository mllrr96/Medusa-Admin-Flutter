import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/route/app_router.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';

class ReturnReasonCard extends StatelessWidget {
  const ReturnReasonCard(this.returnReason,
      {super.key,
      this.onPressed,
      this.listTiltStyle = false,
      this.onDelete,
      this.onAfterEdit});

  final ReturnReason returnReason;
  final void Function()? onPressed;
  final void Function()? onDelete;
  final void Function()? onAfterEdit;
  final bool listTiltStyle;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;

    if (listTiltStyle) {
      return Slidable(
        groupTag: const Key('return_reason'),
        key: ValueKey(returnReason.id!),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Delete Return Reason',
                  message:
                      'Are you sure you want to delete this return reason?',
                  isDestructiveAction: true,
                  okLabel: 'Yes, Delete',
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
          onTap: onPressed ??
              () async => await context
                      .pushRoute(CreateUpdateReturnReasonRoute(
                          returnReason: returnReason))
                      .then((value) {
                    if (value != null && value == true) {
                      onAfterEdit?.call();
                    }
                  }),
          title: Text(
            returnReason.label!,
            style: largeTextStyle,
          ),
          subtitle: returnReason.description != null
              ? Text(returnReason.description!,
                  style: mediumTextStyle!.copyWith(color: manatee))
              : null,
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed ??
          () async => await context
                  .pushRoute(
                      CreateUpdateReturnReasonRoute(returnReason: returnReason))
                  .then((value) {
                if (value != null && value == true) {
                  onAfterEdit?.call();
                }
              }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    returnReason.label!,
                    style: largeTextStyle,
                  ),
                  if (returnReason.description != null)
                    Text(returnReason.description!,
                        style: mediumTextStyle!.copyWith(color: manatee))
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Delete Return Reason',
                  message:
                      'Are you sure you want to delete this return reason?',
                  isDestructiveAction: true,
                  okLabel: 'Yes, Delete',
                ).then((value) async {
                  if (value == OkCancelResult.ok) {
                    onDelete?.call();
                  }
                });
              },
              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
