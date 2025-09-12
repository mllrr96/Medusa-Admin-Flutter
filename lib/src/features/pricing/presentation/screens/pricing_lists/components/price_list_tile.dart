import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';

class PriceListTile extends StatelessWidget {
  const PriceListTile(this.priceList, {super.key, this.onTap});
  final PriceList priceList;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Widget statusIcon(bool enabled) {
      final containerColor = enabled
          ? Colors.green.withValues(alpha: 0.17)
          : Colors.grey.withValues(alpha: 0.17);
      final textColor = enabled ? Colors.green : Colors.grey;
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(Icons.circle, color: textColor, size: 12),
              Icon(Icons.circle, color: containerColor, size: 24),
            ],
          ),
          Text(enabled ? 'Active' : 'Draft'),
        ],
      );
    }

    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return ListTile(
      onTap:onTap,
      onLongPress: () =>
          context.pushRoute(AddUpdatePriceListRoute(id: priceList.id)),
      title: Text(priceList.title),
      subtitle: Text(priceList.description,
          style: smallTextStyle?.copyWith(color: manatee)),
      trailing:
          statusIcon(priceList.status == PriceListStatus.active ? true : false),
    );
  }
}
