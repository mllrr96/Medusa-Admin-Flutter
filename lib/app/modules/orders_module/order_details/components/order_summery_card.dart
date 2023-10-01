import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import '../../../components/currency_formatter.dart';

class OrderSummeryCard extends StatelessWidget {
  const OrderSummeryCard({Key? key, required this.order, required this.index}) : super(key: key);
  final Order order;
  final int index;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final item = order.items![index];

    String getPrice(num? price) {
      final currencyFormatter = CurrencyTextInputFormatter(name: order.currencyCode);
      final symbolNative = order.currency?.symbolNative;
      return '${symbolNative ?? ''} ${currencyFormatter.format(price.toString())}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Row(
        children: [
          if (item.thumbnail != null)
            SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(
                key: ValueKey(item.thumbnail),
                imageUrl: item.thumbnail!,
                placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, string, error) => const Icon(Icons.warning_rounded, color: Colors.redAccent),
              ),
            ),
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
