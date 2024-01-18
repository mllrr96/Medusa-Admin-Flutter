import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../../../../core/constant/colors.dart';
import '../controllers/create_draft_order_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CreateDraftOrderOverViewView extends StatelessWidget {
  const CreateDraftOrderOverViewView(this.controller, {super.key});
  final CreateDraftOrderController controller;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;

    const space = Gap(12);
    const halfSpace = Gap(6);
    final lineItems = controller.lineItems + controller.customLineItems;
    final customer = controller.selectedCustomer ??
        const Customer(
            email: 'Placeholder',
            firstName: 'Placeholder',
            lastName: 'Placeholder');
    final shippingAddress = controller.shippingAddress;
    final billingAddress = controller.sameAddress
        ? controller.shippingAddress
        : controller.billingAddress;
    final shippingOption = controller.selectedShippingOption;

    return Column(
      children: [
        FlexExpansionTile(
          title: const Text('Items'),
          initiallyExpanded: true,
          child: Column(
            children: <Widget>[
              ListView.separated(
                separatorBuilder: (_, __) => const Gap(12),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 12.0),
                itemCount: lineItems.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => OverViewListTile(
                    lineItems[index],
                    currencyCode:
                        controller.selectedRegion?.currencyCode ?? ''),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Add discount'),
                    ],
                  ))
            ],
          ),
        ),
        space,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: context.theme.appBarTheme.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Customer'),
              space,
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        ColorManager.getAvatarColor(customer.email),
                    maxRadius: 18,
                    child: Text(
                        customer.firstName == null
                            ? customer.email[0].capitalize ?? customer.email[0]
                            : customer.firstName![0],
                        style: largeTextStyle!.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(width: 12.0),
                  if (customer.firstName != null)
                    Flexible(
                        child: Text(
                            '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})',
                            style: smallTextStyle)),
                  if (customer.firstName == null)
                    Flexible(
                        child: Text(customer.email, style: smallTextStyle)),
                ],
              ),
              halfSpace,
            ],
          ),
        ),
        space,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: context.theme.appBarTheme.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Shipping details'),
              space,
              // Address info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address',
                      style: smallTextStyle?.copyWith(color: manatee)),
                  Text(
                      '${shippingAddress.address1}${shippingAddress.address2 != null ? ',' : ''} ${shippingAddress.address2 ?? ''}',
                      style: smallTextStyle),
                  Text(
                      '${shippingAddress.postalCode} ${shippingAddress.city ?? ''}, ${shippingAddress.country?.name?.capitalize ?? ''}',
                      style: smallTextStyle),
                ],
              ),
              space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shipping method',
                      style: smallTextStyle?.copyWith(color: manatee)),
                  Text(
                      '${shippingOption?.name ?? ''} - (${shippingOption?.amount.formatAsPrice(shippingOption.region?.currencyCode)})',
                      style: smallTextStyle),
                ],
              ),

              halfSpace,
            ],
          ),
        ),
        space,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: context.theme.appBarTheme.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Billing details'),
              space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address',
                      style: smallTextStyle?.copyWith(color: manatee)),
                  Text(
                      '${billingAddress.address1}${billingAddress.address2 != null ? ',' : ''} ${billingAddress.address2 ?? ''}',
                      style: smallTextStyle),
                  Text(
                      '${billingAddress.postalCode} ${billingAddress.city ?? ''}, ${billingAddress.country?.name?.capitalize ?? ''}',
                      style: smallTextStyle),
                ],
              ),
              halfSpace,
            ],
          ),
        ),
      ],
    );
  }
}

class OverViewListTile extends StatelessWidget {
  const OverViewListTile(
    this.lineItem, {
    super.key,
    required this.currencyCode,
  });
  final LineItem lineItem;
  final String currencyCode;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final productVariant = lineItem.variant ??
        ProductVariant(title: lineItem.title, prices: [
          MoneyAmount(
            amount: lineItem.unitPrice?.toInt(),
            currencyCode: currencyCode,
          )
        ]);
    MoneyAmount? moneyAmount;
    final priceList =
        productVariant.prices?.where((e) => e.currencyCode == currencyCode);
    if (priceList?.isNotEmpty ?? false) {
      moneyAmount = priceList!.first;
    } else {
      moneyAmount = (productVariant.prices?.isNotEmpty ?? false)
          ? productVariant.prices!.first
          : const MoneyAmount(amount: 0, currencyCode: 'usd');
    }

    const space = Gap(12);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              //Image
              if (productVariant.product?.thumbnail != null)
                SizedBox(
                    width: 45,
                    child: CachedNetworkImage(
                      key: ValueKey(productVariant.product!.thumbnail!),
                      imageUrl: productVariant.product!.thumbnail!,
                      placeholder: (context, text) => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      errorWidget: (context, string, error) => const Icon(
                          Icons.warning_rounded,
                          color: Colors.redAccent),
                    )),
              space,
              // Product, Variant name and price
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (productVariant.product?.title != null)
                      Text(
                        productVariant.product?.title ?? '',
                        style: mediumTextStyle,
                      ),
                    if (productVariant.title != null)
                      Text(productVariant.title ?? '',
                          style: smallTextStyle?.copyWith(color: manatee),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Variant quantity
        IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  '${moneyAmount.amount.formatAsPrice(currencyCode)} x ${lineItem.quantity!}',
                  style: smallTextStyle,
                  maxLines: 1),
              const Divider(height: 5),
              Text(
                  ((lineItem.quantity ?? 1) * (moneyAmount.amount ?? 1))
                      .formatAsPrice(currencyCode),
                  style: mediumTextStyle,
                  maxLines: 1),
            ],
          ),
        ),
      ],
    );
  }
}
