import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/currency_formatter.dart';
import '../../../../data/service/store_service.dart';

class DraftOrderSummeryCard extends StatelessWidget {
  const DraftOrderSummeryCard({
    Key? key,
    required this.item,
    required this.currencyCode,
  }) : super(key: key);
  final LineItem item;
  final String currencyCode;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;

    String getPrice(num? price) {
      var value = price ?? 0;
      final currencyFormatter = CurrencyTextInputFormatter(name: currencyCode);
      final symbolNative =
          StoreService.store.currencies?.where((element) => element.code == currencyCode).first.symbolNative;
      return '${symbolNative ?? ''} ${currencyFormatter.format(value.toString())}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(key: ValueKey(item.thumbnail), imageUrl: item.thumbnail!)),
          const SizedBox(width: 6.0),
          Expanded(
            flex: 4,
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
                Text('${getPrice(item.unitPrice)} x ${item.quantity!}', style: smallTextStyle, maxLines: 1),
                const Divider(height: 5),
                Text(getPrice(item.total), style: mediumTextStyle, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
