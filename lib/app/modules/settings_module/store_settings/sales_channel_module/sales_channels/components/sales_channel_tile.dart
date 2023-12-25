import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/sales_channel.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';

class SalesChannelTile extends StatelessWidget {
  const SalesChannelTile(this.salesChannel, {super.key});
  final SalesChannel salesChannel;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final isDisabled = salesChannel.isDisabled ?? false;
    return ListTile(
      onTap: () => context
          .pushRoute(SalesChannelDetailsRoute(salesChannel: salesChannel)),
      tileColor: context.theme.appBarTheme.backgroundColor,
      title: Text(salesChannel.name ?? '', style: largeTextStyle),
      subtitle: Text(salesChannel.description ?? '',
          style: smallTextStyle?.copyWith(color: lightWhite)),
      trailing: isDisabled
          ? Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  color: context.theme.scaffoldBackgroundColor),
              child: Text('Draft', style: mediumTextStyle))
          : null,
    );
  }
}
