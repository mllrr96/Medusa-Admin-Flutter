import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/price_list.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';

class PriceListTile extends StatelessWidget {
  const PriceListTile(this.priceList,{super.key});
  final PriceList priceList;
  @override
  Widget build(BuildContext context) {
    Widget statusIcon(bool enabled) {
      final containerColor = enabled
          ? Colors.green.withOpacity(0.17)
          : Colors.grey.withOpacity(0.17);
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
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return ListTile(
      onTap: () => context.pushRoute(PriceListDetailsRoute(priceList: priceList)),
      onLongPress: () => context.pushRoute(AddUpdatePriceListRoute(id: priceList.id!)),
      title: Text(priceList.name ?? ''),
      subtitle: Text(priceList.description ?? '',
          style: smallTextStyle?.copyWith(color: manatee)),
      trailing: statusIcon(
          priceList.status == PriceListStatus.active
              ? true
              : false),
    );
  }
}
