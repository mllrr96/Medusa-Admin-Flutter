import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/extensions/num_extension.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';

class RefundWidget extends StatelessWidget {
  const RefundWidget(this.refund, {super.key, required this.currencyCode});
  final Refund refund;
  final String? currencyCode;

  @override
  Widget build(BuildContext context) {
    final durationDiff =
        DateTime.now().difference(refund.createdAt ?? DateTime.now());
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.money_off),
            const SizedBox(width: 12.0),
            Text(
              'Refund',
              style: smallTextStyle,
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.money_off,
              color: Colors.transparent,
            ),
            const SizedBox(width: 12.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateTime.now().subtract(durationDiff).timeAgo()} ${refund.amount.formatAsPrice(currencyCode)}',
                    style: smallTextStyle?.copyWith(color: manatee),
                  ),
                  // if (refund.reason != null)
                  //   Column(
                  //     children: [
                  //       const SizedBox(height: 6.0),
                  //       Text(
                  //         refund.reason?.name.capitalize ?? '',
                  //         style: smallTextStyle?.copyWith(color: manatee),
                  //       ),
                  //     ],
                  //   )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
