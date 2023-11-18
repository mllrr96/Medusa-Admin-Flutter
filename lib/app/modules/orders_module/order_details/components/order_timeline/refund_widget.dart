import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../components/currency_formatter.dart';

class RefundWidget extends StatelessWidget {
  const RefundWidget(this.refund, {super.key, required this.currency});
  final Refund refund;
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final durationDiff = DateTime.now().difference(refund.createdAt ?? DateTime.now());
    final formatter = CurrencyTextInputFormatter(name: currency.code);
    final lightWhite = ColorManager.manatee;
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
                    '${timeago.format(DateTime.now().subtract(durationDiff))} ${currency.symbolNative}${formatter.format(refund.amount.toString())}',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ),
                  if(refund.reason!=null)
                  Column(
                    children: [
                      const SizedBox(height: 6.0),
                      Text(refund.reason?.name.capitalize ?? '',
                        style: smallTextStyle?.copyWith(color: lightWhite),
                      ),
                    ],
                  )
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
