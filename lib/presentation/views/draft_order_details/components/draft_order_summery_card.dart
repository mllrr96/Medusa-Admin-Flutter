import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class DraftOrderSummeryCard extends StatelessWidget {
  const DraftOrderSummeryCard({
    super.key,
    required this.item,
    required this.currencyCode,
  });
  final LineItem item;
  final String currencyCode;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Row(
        children: [
          if (item.thumbnail != null)
            SizedBox(
                height: 50,
                width: 50,
                child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!)),
          const SizedBox(width: 6.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    item.title!,
                    style: mediumTextStyle,
                  ),
                ),
                if (item.variant != null) const SizedBox(height: 6.0),
                Flexible(
                  child: Text(
                    item.variant?.title ?? '',
                    style: smallTextStyle,
                  ),
                )
              ],
            ),
          ),
          IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${item.unitPrice.formatAsPrice(currencyCode)} x ${item.quantity!}',
                    style: smallTextStyle, maxLines: 1),
                const Divider(height: 5),
                Text(item.total.formatAsPrice(currencyCode), style: mediumTextStyle, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
