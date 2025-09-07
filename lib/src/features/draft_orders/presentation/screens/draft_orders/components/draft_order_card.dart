import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';

import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'draft_order_status_label.dart';

class DraftOrderCard extends StatelessWidget {
  const DraftOrderCard(this.draftOrder,
      {super.key, this.onTap, this.shimmer = false});

  final DraftOrder draftOrder;
  final void Function()? onTap;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final customerName = draftOrder.customer?.firstName;
    return Card(
      // color: context.getAlphaBlend(context.theme.cardColor),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        onTap: onTap ??
            () => context
                .pushRoute(DraftOrderDetailsRoute(draftId: draftOrder.id)),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#${draftOrder.displayId}', style: mediumTextStyle),
                  if (draftOrder.displayId != null)
                    Text('Order #${draftOrder.displayId}',
                        style: mediumTextStyle),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      draftOrder.createdAt != null
                          ? '${draftOrder.createdAt?.formatDate()} at ${draftOrder.createdAt.formatTime()}'
                          : '',
                      style: mediumTextStyle!.copyWith(color: manatee),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: shimmer
                              ? context.theme.scaffoldBackgroundColor
                              : ColorManager.getAvatarColor(draftOrder.email),
                          radius: 16,
                          child: shimmer
                              ? null
                              : Text(
                                  customerName?[0].capitalize ??
                                      draftOrder.email[0].capitalize,
                                  style: largeTextStyle?.copyWith(
                                      color: Colors.white)),
                        ),
                        const SizedBox(width: 6.0),
                        if (customerName != null)
                          Flexible(
                              child: Text(customerName, style: smallTextStyle)),
                        if (customerName == null)
                          Flexible(
                              child: Text(draftOrder.email,
                                  style: mediumTextStyle)),
                      ],
                    ),
                  ),
                  DraftOrderStatusLabel(draftOrder.status),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
