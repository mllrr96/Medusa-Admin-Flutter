import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import '../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class DraftOrderCustomer extends StatelessWidget {
  const DraftOrderCustomer(this.draftOrder, {super.key});
  final DraftOrder draftOrder;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
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
      return countryName.capitalize;
    }

    return FlexExpansionTile(
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext.ensureVisibility();
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Customer'),
      trailing: IconButton(
          onPressed: () async {
            await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
              const SheetAction(label: 'Go to Customer', icon: Icons.person, key: 0),
              const SheetAction(label: 'Edit Shipping Address', key: 1),
              const SheetAction(label: 'Edit Billing Address', key: 2),
            ]).then((value) async {
              if (value == null) return;
              switch (value) {
                case 0:
                  await context.pushRoute(CustomerDetailsRoute(customerId: draftOrder.cart!.customerId!));
                  break;
                case 1:
                  break;
              }
            });
          },
          icon: const Icon(Icons.more_horiz)),
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: ColorManager.getAvatarColor(email),
                        child: Text(
                          name.isNotEmpty ? name[0].toUpperCase() : email![0].toUpperCase(),
                          style: largeTextStyle?.copyWith(color: Colors.white),
                        )),
                    const SizedBox(width: 14.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: mediumTextStyle),
                          Text('${draftOrder.cart?.shippingAddress?.city ?? ''}, ${getCountry()}',
                              style: mediumTextStyle?.copyWith(color: manatee))
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
                    Text(email ?? '', style: context.bodyMedium),
                    if (draftOrder.cart?.billingAddress != null && draftOrder.cart?.billingAddress!.phone != null)
                      Text(
                        draftOrder.cart!.billingAddress!.phone.toString(),
                        style: context.bodyMedium,
                      )
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
                    Text('Shipping', style: mediumTextStyle!.copyWith(color: manatee)),
                    const SizedBox(height: 5.0),
                    Text(
                        '${draftOrder.cart?.shippingAddress?.address1 ?? ''} ${draftOrder.cart?.shippingAddress?.address2 ?? ''}',
                        style: context.bodyMedium),
                    Text(
                      '${draftOrder.cart?.shippingAddress?.postalCode ?? ''} ${draftOrder.cart?.shippingAddress?.province ?? ''} ${draftOrder.cart?.shippingAddress?.countryCode ?? ''}',
                      style: context.bodyMedium,
                    ),
                  ],
                ),
                const VerticalDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Billing', style: mediumTextStyle.copyWith(color: manatee)),
                    const SizedBox(height: 5.0),
                    Text(
                      '${draftOrder.cart?.billingAddress?.address1 ?? ''} ${draftOrder.cart?.billingAddress?.address2 ?? ''}',
                      style: context.bodyMedium,
                    ),
                    Text(
                      '${draftOrder.cart?.billingAddress?.postalCode ?? ''} ${draftOrder.cart?.billingAddress?.province ?? ''} ${draftOrder.cart?.billingAddress?.countryCode ?? ''}',
                      style: context.bodyMedium,
                    ),
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
