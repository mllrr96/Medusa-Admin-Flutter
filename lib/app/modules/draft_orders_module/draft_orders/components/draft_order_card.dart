import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/draft_order.dart';
import 'draft_order_status_label.dart';

class DraftOrderCard extends StatelessWidget {
  const DraftOrderCard(this.draftOrder, {Key? key, this.onTap}) : super(key: key);
  final DraftOrder draftOrder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    String? getName() {
      if (draftOrder.order == null) return null;

      final order = draftOrder.order!;
      String? name;

      if (order.billingAddress?.firstName != null && order.billingAddress?.lastName != null) {
        name = '${order.billingAddress!.firstName ?? ''} ${order.billingAddress!.lastName ?? ''}';
      }
      if (order.shippingAddress?.firstName != null && order.shippingAddress?.lastName != null) {
        name = '${order.shippingAddress!.firstName ?? ''} ${order.shippingAddress!.lastName ?? ''}';
      }
      if (order.customer?.firstName != null && order.customer?.lastName != null) {
        name = '${order.customer!.firstName ?? ''} ${order.customer!.lastName ?? ''}';
      }
      return name;
    }

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      onTap: onTap ?? () => Get.toNamed(Routes.DRAFT_ORDER_DETAILS, arguments: draftOrder.id),
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
                        ? '${formatDate(draftOrder.cart!.createdAt)} at ${formatTime(draftOrder.cart!.createdAt)}'
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
                        backgroundColor: ColorManager.getAvatarColor(draftOrder.cart?.email),
                        radius: 16,
                        child: Text(getName()?[0].capitalize ?? draftOrder.cart?.email?[0].capitalize ?? '', style: largeTextStyle?.copyWith(color: Colors.white)),
                      ),
                      const SizedBox(width: 6.0),
                      if (getName() != null) Flexible(child: Text(getName()!, style: smallTextStyle)),
                      if (getName() == null)
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
    );
  }
}
