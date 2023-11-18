import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/countries/components/countries.dart';
import '../../../components/custom_expansion_tile.dart';

class DraftOrderCustomer extends StatelessWidget {
  const DraftOrderCustomer(this.draftOrder, {Key? key, this.onExpansionChanged}) : super(key: key);
  final DraftOrder draftOrder;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final email = draftOrder.cart?.email;
    final name = '${draftOrder.cart?.customer?.firstName ?? ''} ${draftOrder.cart?.customer?.lastName ?? ''}';
    String getCountry() {
      String countryName = '';
      final countryCode = draftOrder.cart?.shippingAddress?.countryCode;
      if (countryCode != null) {
        final country = countries.firstWhere((element) => element.iso2 == countryCode,
            orElse: () => const Country(iso2: '', iso3: '', numCode: 0, name: '', displayName: ''));
        countryName = country.name ?? '';
      }
      return countryName.capitalize ?? countryName;
    }

    return CustomExpansionTile(
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Customer'),
      trailing: AdaptiveIcon(
          onPressed: () async {
            await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
              const SheetAction(label: 'Go to Customer', icon: Icons.person, key: 0),
              const SheetAction(label: 'Edit Shipping Address', key: 1),
              const SheetAction(label: 'Edit Billing Address', key: 2),
            ]).then((value) async {
              if (value == null) return;
              switch (value) {
                case 0:
                  await Get.toNamed(Routes.CUSTOMER_DETAILS, arguments: draftOrder.cart!.customerId!);
                  break;
                case 1:
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
                      backgroundColor: ColorManager.getAvatarColor(email),
                      child: Text(name.isNotEmpty ? name[0].toUpperCase() : email![0].toUpperCase(), style: largeTextStyle?.copyWith(color: Colors.white),)),
                  const SizedBox(width: 14.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: mediumTextStyle),
                        Text('${draftOrder.cart?.shippingAddress?.city ?? ''}, ${getCountry()}',
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
                  Text(email ?? '', style: Theme.of(context).textTheme.titleMedium),
                  if (draftOrder.cart?.billingAddress != null && draftOrder.cart?.billingAddress!.phone != null)
                    Text(draftOrder.cart!.billingAddress!.phone.toString(),
                        style: Theme.of(context).textTheme.titleMedium),
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
                  Text(
                      '${draftOrder.cart?.shippingAddress?.address1 ?? ''} ${draftOrder.cart?.shippingAddress?.address2 ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${draftOrder.cart?.shippingAddress?.postalCode ?? ''} ${draftOrder.cart?.shippingAddress?.province ?? ''} ${draftOrder.cart?.shippingAddress?.countryCode ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Billing', style: mediumTextStyle.copyWith(color: lightWhite)),
                  const SizedBox(height: 5.0),
                  Text(
                      '${draftOrder.cart?.billingAddress?.address1 ?? ''} ${draftOrder.cart?.billingAddress?.address2 ?? ''}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${draftOrder.cart?.billingAddress?.postalCode ?? ''} ${draftOrder.cart?.billingAddress?.province ?? ''} ${draftOrder.cart?.billingAddress?.countryCode ?? ''}',
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
