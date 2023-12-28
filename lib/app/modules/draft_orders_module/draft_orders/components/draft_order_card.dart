import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/draft_order.dart';
import 'draft_order_status_label.dart';

class DraftOrderCard extends StatelessWidget {
  const DraftOrderCard(this.draftOrder, {super.key, this.onTap, this.shimmer= false});
  final DraftOrder draftOrder;
  final void Function()? onTap;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final customerName = draftOrder.order?.customerName;
    return Skeletonizer(
      enabled: shimmer,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        onTap: onTap ?? () => context.pushRoute(DraftOrderDetailsRoute(draftId: draftOrder.id!)),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor, borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#${draftOrder.displayId}', style: mediumTextStyle),
                  if (draftOrder.order?.displayId != null)
                    Text('Order #${draftOrder.order!.displayId}', style: mediumTextStyle),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      draftOrder.cart!.createdAt != null
                          ? '${draftOrder.cart!.createdAt.formatDate()} at ${draftOrder.cart!.createdAt.formatTime()}'
                          : '',
                      style: mediumTextStyle!.copyWith(color: lightWhite),
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
                          backgroundColor:shimmer ? context.theme.scaffoldBackgroundColor : ColorManager.getAvatarColor(draftOrder.cart?.email),
                          radius: 16,
                          child:shimmer ? null: Text(customerName?[0].capitalize ?? draftOrder.cart?.email?[0].capitalize ?? '', style: largeTextStyle?.copyWith(color: Colors.white)),
                        ),
                        const SizedBox(width: 6.0),
                        if (customerName!= null) Flexible(child: Text(customerName, style: smallTextStyle)),
                        if (customerName == null)
                          Flexible(child: Text(draftOrder.cart?.email ?? '', style: mediumTextStyle)),
                      ],
                    ),
                  ),
                  DraftOrderStatusLabel(draftOrder.status!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
