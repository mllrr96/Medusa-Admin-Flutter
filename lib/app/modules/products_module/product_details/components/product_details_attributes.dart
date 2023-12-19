import 'package:auto_route/auto_route.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/countries/components/countries.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/controllers/add_update_product_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../components/custom_expansion_tile.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsAttributes extends GetView<ProductDetailsController> {
  const ProductDetailsAttributes(
      {super.key,
      required this.product,
      this.onExpansionChanged,
      this.expansionKey});
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    return CustomExpansionTile(
      key: expansionKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      label: 'Attributes',
      trailing: AdaptiveButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            await context
                .pushRoute(AddUpdateProductRoute(
                    updateProductReq:
                        UpdateProductReq(product: product, number: 3)))
                .then((result) async {
              if (result != null) {
                await controller.fetchProduct();
              }
            });
          },
          child: const Text('Edit')),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dimensions', style: mediumTextStyle),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Height',
                        style: mediumTextStyle!.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.height?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Width',
                        style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.width?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Length',
                        style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.length?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Weight',
                        style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.weight?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            space,
            Text('Customs', style: mediumTextStyle),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('MID Code',
                        style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.midCode?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('HS Code',
                        style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.hsCode?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Country of origin',
                    style: mediumTextStyle.copyWith(color: lightWhite)),
                Row(
                  children: [
                    Text(
                        countries
                                .firstWhereOrNull((element) =>
                                    element.iso2 == product.originCountry)
                                ?.displayName ??
                            '-',
                        style: mediumTextStyle.copyWith(color: lightWhite),
                        textAlign: TextAlign.right),
                    Flag.fromString(product.originCountry ?? ' ',
                        height: 15, width: 30),
                  ],
                ),
              ],
            ),
            space,
          ],
        )
      ],
    );
  }
}
