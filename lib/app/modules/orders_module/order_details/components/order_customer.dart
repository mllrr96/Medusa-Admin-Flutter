import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/index.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/countries/components/countries.dart';
import '../../../components/custom_expansion_tile.dart';

class OrderCustomer extends GetView<OrderDetailsController> {
  const OrderCustomer(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    String getCountry() {
      String countryName = '';
      final countryCode = order.shippingAddress?.countryCode;
      if (countryCode != null) {
        final country = countries.firstWhere((element) => element.iso2 == countryCode,
            orElse: () => const Country(iso2: '', iso3: '', numCode: 0, name: '', displayName: ''));
        countryName = country.name ?? '';
      }
      return countryName.capitalize ?? countryName;
    }

    return CustomExpansionTile(
      key: controller.customerKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Customer'),
      trailing: AdaptiveIcon(
          onPressed: () async {
            await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
              const SheetAction(label: 'Go to Customer', icon: Icons.person, key: 0),
              const SheetAction(label: 'Transfer Ownership', key: 1),
              const SheetAction(label: 'Edit Shipping Address', key: 2),
              const SheetAction(label: 'Edit Billing Address', key: 3),
              const SheetAction(label: 'Edit Email Address', key: 4),
            ]).then((value) async {
              if (value == null) return;
              switch (value) {
                case 0:
                  await Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: order.customerId!);
                  break;
                case 1:
                  await Get.toNamed(Routes.TRANSFER_ORDER, arguments: order);
                  break;
                case 2:
                  final result = await showBarModalBottomSheet(
                    context: context,
                    builder: (context) => EditShippingAddress(
                      shippingAddress: order.shippingAddress!,
                      countries: order.region?.countries ?? <Country>[],
                      context: context,
                    ),
                  );

                  if (result is Address) {
                    await controller.updateShippingAddress(result);
                  }
                  break;
              }
            });
          },
          icon: const Icon(Icons.more_horiz)),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  CircleAvatar(
                      child: Text(order.customer?.firstName?[0].toUpperCase() ?? order.email![0].toUpperCase())),
                  const SizedBox(width: 14.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${order.customer?.firstName ?? ''} ${order.customer?.lastName ?? ''}',
                            style: mediumTextStyle),
                        Text('${order.shippingAddress?.city ?? ''}, ${getCountry()}',
                            style: mediumTextStyle?.copyWith(color: lightWhite))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.email!, style: Theme.of(context).textTheme.titleMedium),
                  if (order.billingAddress != null && order.billingAddress!.phone != null)
                    Text(order.billingAddress!.phone.toString(), style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shipping', style: mediumTextStyle!.copyWith(color: lightWhite)),
                  const SizedBox(height: 5.0),
                  Text('${order.shippingAddress?.address1 ?? ''} ${order.shippingAddress?.address2 ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${order.shippingAddress?.postalCode ?? ''} ${order.shippingAddress?.province ?? ''} ${order.shippingAddress?.countryCode ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Billing', style: mediumTextStyle.copyWith(color: lightWhite)),
                  const SizedBox(height: 5.0),
                  Text('${order.billingAddress?.address1 ?? ''} ${order.billingAddress?.address2 ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${order.billingAddress?.postalCode ?? ''} ${order.billingAddress?.province ?? ''} ${order.billingAddress?.countryCode ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
