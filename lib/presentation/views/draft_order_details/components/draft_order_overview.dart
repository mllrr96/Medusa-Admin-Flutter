import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/presentation/views/draft_orders/components/index.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import '../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
class DraftOrderOverview extends StatelessWidget {
  const DraftOrderOverview(this.draftOrder, {super.key});
  final DraftOrder draftOrder;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final email = draftOrder.email;
    final billingAddress = draftOrder.billingAddress;
    final currencyCode = draftOrder.region?.currencyCode;
    int? amount = draftOrder.total;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.cardColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${draftOrder.displayId!}', style: context.bodyLarge),
                  halfSpace,
                  if ( draftOrder.createdAt != null)
                    Text(
                      'on ${draftOrder.createdAt?.formatDate()} at ${draftOrder.createdAt?.formatTime()}',
                      style: context.bodyMedium,
                    )
                ],
              ),
              DraftOrderStatusLabel(draftOrder.status),
            ],
          ),
          space,
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(email, style: mediumTextStyle),
                      const SizedBox(height: 6.0),
                      Text(billingAddress?.phone?.toString() ?? 'Phone: N/A',
                          style: smallTextStyle?.copyWith(color: manatee)),
                    ],
                  ),
                ),
                const VerticalDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount.formatAsPrice(currencyCode),
                      style: context.bodyMedium,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      'Amount (${currencyCode?.toUpperCase()})',
                      style: smallTextStyle?.copyWith(color: manatee),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
