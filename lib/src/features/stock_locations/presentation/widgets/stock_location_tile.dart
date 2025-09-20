import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class StockLocationTile extends StatelessWidget {
  const StockLocationTile(
    this.stockLocation, {
    super.key,
    this.onTap,
    this.onDelete,
    this.onEdit,
  });

  final StockLocation stockLocation;

  final void Function()? onTap;
  final void Function()? onDelete;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap ??
            () => context.pushRoute(StockLocationDetailsRoute(stockLocation: stockLocation)),
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stockLocation.name, style: context.bodyLarge),
                  const Gap(4),
                  Text(
                    stockLocation.address?.countryCode.getCountry.displayOnStore ?? '',
                    style: context.bodyMedium,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        title: 'Manage Location',
                        message: stockLocation.name,
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(label: 'Edit', key: 0),
                          SheetAction(label: 'Delete', key: 1, isDestructiveAction: true),
                        ]).then((result) async {
                      switch (result) {
                        case 0:
                          onEdit?.call();
                          break;
                        case 1:
                          if (!context.mounted) return;
                          final shouldDelete = await showOkCancelAlertDialog(
                            context: context,
                            title: 'Are you sure you want to delete this stock location?',
                            okLabel: 'Delete',
                            isDestructiveAction: true,
                          );
                          if (shouldDelete != OkCancelResult.ok) return;
                          onDelete?.call();
                          break;
                      }
                    });
                  },
                  icon: const Icon(
                    LucideIcons.ellipsisVertical,
                  ),
                  padding: EdgeInsets.all(16)),
            ],
          ),
        ),
      ),
    );
  }
}
