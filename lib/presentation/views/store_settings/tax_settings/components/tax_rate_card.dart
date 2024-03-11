import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class TaxRateCard extends StatelessWidget {
  const TaxRateCard({
    super.key,
    required this.taxRate,
    this.onEditTap,
    this.onDeleteTap,
  });
  final TaxRate taxRate;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(taxRate.name ?? '', style: mediumTextStyle),
              IconButton(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        title: 'Manage tax rate',
                        message: taxRate.name ?? '',
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(label: 'Edit', key: 0),
                          const SheetAction(
                              label: 'Delete',
                              isDestructiveAction: true,
                              key: 1),
                        ]).then((value) async {
                      switch (value) {
                        case 0:
                          onEditTap?.call();
                          return;
                        case 1:
                          onDeleteTap?.call();
                          return;
                      }
                    });
                  },
                  icon: const Icon(Icons.more_horiz)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Code: ${taxRate.code ?? ''}',
                  style: smallTextStyle?.copyWith(color: manatee)),
              Text('${taxRate.rate?.toString() ?? ''} %',
                  style: smallTextStyle),
            ],
          ),
          const Gap(12)
        ],
      ),
    );
  }
}
