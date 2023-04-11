import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/draft_order_details/controllers/draft_order_details_controller.dart';
import '../../../../data/models/store/draft_order.dart';
import '../../../../data/service/store_service.dart';
import '../../../components/currency_formatter.dart';

class DraftOrderPayment extends GetView<DraftOrderDetailsController> {
  const DraftOrderPayment(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    const space = SizedBox(height: 12.0);
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final currencyCode = draftOrder.cart!.region!.currencyCode;

    String getPrice(num? price) {
      var value = price ?? 0;
      final currencyFormatter = CurrencyTextInputFormatter(name: currencyCode);
      final symbolNative =
          StoreService.store.currencies?.where((element) => element.code == currencyCode).first.symbolNative;
      return '${symbolNative ?? ''} ${currencyFormatter.format(value.toString())}';
    }

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Payment'),
      trailing: draftOrder.status! == DraftOrderStatus.open
          ? AdaptiveButton(
              onPressed: () async {
                await showOkCancelAlertDialog(
                  context: context,
                  title: 'Mark as paid',
                  message: 'This will create an order. Mark this as paid if you received the payment.',
                  okLabel: 'Mark paid',
                  cancelLabel: 'Cancel',
                ).then((value) async {
                  if (value == OkCancelResult.ok) {
                    await controller.markAsPaid();
                  }
                });
              },
              padding: EdgeInsets.zero,
              child: const Text('Mark as paid'))
          : null,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: mediumTextStyle),
              Row(
                children: [
                  Text(getPrice(draftOrder.cart!.subTotal), style: mediumTextStyle),
                  // Text(' ${draftOrder.currencyCode?.toUpperCase() ?? ''}',
                  //     style: mediumTextStyle?.copyWith(color: lightWhite)),
                ],
              ),
            ],
          ),
        ),
        halfSpace,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping', style: mediumTextStyle),
              Row(
                children: [
                  Text(getPrice(draftOrder.cart!.shippingTotal), style: mediumTextStyle),
                  Text(' ${currencyCode?.toUpperCase() ?? ''}', style: mediumTextStyle?.copyWith(color: lightWhite)),
                ],
              ),
            ],
          ),
        ),
        halfSpace,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: mediumTextStyle),
              Row(
                children: [
                  Text(getPrice(draftOrder.cart!.taxTotal), style: mediumTextStyle),
                  Text(' ${currencyCode?.toUpperCase() ?? ''}', style: mediumTextStyle?.copyWith(color: lightWhite)),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: largeTextStyle),
              Text(getPrice(draftOrder.cart!.total), style: largeTextStyle),
            ],
          ),
        ),
        space,
        Text('Payment link : Configure payment link in store settings',
            style: smallTextStyle?.copyWith(color: lightWhite)),
      ],
    );
  }
}
