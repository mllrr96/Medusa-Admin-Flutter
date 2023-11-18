import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../components/adaptive_icon.dart';

class TaxRateCard extends StatelessWidget {
  const TaxRateCard({Key? key, required this.taxRate, this.onEditTap, this.onDeleteTap}) : super(key: key);
  final TaxRate taxRate;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    const halfSpace = SizedBox(height: 6.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(taxRate.name ?? '', style: mediumTextStyle),
              AdaptiveIcon(
                  onPressed: () async {
                    await showModalActionSheet<int>(
                        title: 'Manage tax rate',
                        message: taxRate.name ?? '',
                        context: context,
                        actions: <SheetAction<int>>[
                          const SheetAction(label: 'Edit', key: 0),
                          const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                        ]).then((value) async {
                      switch (value) {
                        case 0:
                          if (onEditTap != null) {
                            onEditTap!();
                          }
                          return;
                        case 1:
                          if (onDeleteTap != null) {
                            onDeleteTap!();
                          }
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
              Text('Code: ${taxRate.code ?? ''}', style: smallTextStyle?.copyWith(color: lightWhite)),
              Text('${taxRate.rate?.toString() ?? ''} %', style: smallTextStyle),
            ],
          ),
          halfSpace,
        ],
      ),
    );
  }
}
