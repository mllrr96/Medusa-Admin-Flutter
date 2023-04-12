import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/sales_channel_module/sales_channel_details/controllers/sales_channel_details_controller.dart';

class SalesChannelFAB extends StatelessWidget {
  const SalesChannelFAB(this.controller,{Key? key}) : super(key: key);
  final SalesChannelDetailsController controller ;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        // border: Border.all(color: Colors.grey),
        color: Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.7),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${controller.selectedProducts.length} selected', style: mediumTextStyle),
            const VerticalDivider(width: 24),
            InkWell(
              onTap: () async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Remove products?',
                  message: 'Are you sure you want to remove selected products from this sales channel?',
                  okLabel: 'Yes, remove',
                  isDestructiveAction: true,
                ).then((value) async {
                  if (value == OkCancelResult.ok) {
                    await controller.removeProducts();
                  }
                });
              },
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text('Remove', style: mediumTextStyle?.copyWith(color: Colors.redAccent)),
              ),
            ),
            InkWell(
              onTap: () {
                controller.selectedProducts.clear();
                controller.selectAll = false;
                controller.update();
              },
              child: Ink(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 6.0, 0),
                child: const Icon(Icons.clear),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
