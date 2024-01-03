import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../controllers/product_details_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductDetailsVariants extends GetView<ProductDetailsController> {
  const ProductDetailsVariants(
      {super.key,
      required this.product,
      this.onExpansionChanged,
      this.expansionKey});
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return FlexExpansionTile(
      key: expansionKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Variants'),
      trailing: IconButton(
          onPressed: () async {
            await showModalActionSheet(context: context, actions: <SheetAction>[
              const SheetAction(label: 'Add Variants', key: 0),
              const SheetAction(label: 'Edit Options', key: 2),
            ]).then((result) async {
              switch (result) {
                case 0:
                  var newVariant = await context.pushRoute(
                      ProductAddVariantRoute(
                          productVariantReq:
                              ProductVariantReq(product: product)));
                  if (newVariant is ProductVariant) {
                    final options = <ProductOptionValue>[];

                    newVariant.options?.forEach((element) {
                      options.add(ProductOptionValue(
                          value: element.value,
                          optionId: element.optionId,
                          option: element.option, variantId: null));
                    });

                    newVariant = newVariant.copyWith(options: options);
                    await controller.updateProduct(
                        Product(id: product.id!, variants: [newVariant]));
                  }
              }
            });
          },
          icon: const Icon(Icons.more_horiz)),
      child: Column(
        children: [
          if (product.options != null)
            ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: product.options!.length,
                itemBuilder: (context, index) {
                  final option = product.options![index];
                  final seen = <String>{};
                  final List<ProductOptionValue> values =
                      product.options![index].values!;
                  final unique =
                      values.where((str) => seen.add(str.value!)).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(option.title ?? '', style: mediumTextStyle),
                      Wrap(
                        spacing: 8.0,
                        children: unique
                            .map((e) => Chip(
                                label:
                                    Text(e.value ?? '', style: smallTextStyle)))
                            .toList(),
                      ),
                    ],
                  );
                }),
          space,
          space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Product Variants (${product.variants?.length ?? ''})',
                      style: mediumTextStyle),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text('Title', style: smallTextStyle)),
                  Flexible(child: Text('SKU', style: smallTextStyle)),
                  Flexible(child: Text('EAN', style: smallTextStyle)),
                  Flexible(child: Text('Inventory', style: smallTextStyle)),
                  Flexible(child: Text('', style: smallTextStyle)),
                ],
              ),
              const Divider(),
              if (product.variants != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: product.variants!.length,
                  itemBuilder: (context, index) {
                    final variant = product.variants![index];
                    return Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:
                              Text(variant.title ?? '-', style: smallTextStyle),
                        )),
                        Expanded(
                            child: Text(variant.sku ?? '-',
                                style: smallTextStyle)),
                        Expanded(
                            child: Text(variant.ean ?? '-',
                                style: smallTextStyle)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                  child: Text(
                                      variant.inventoryQuantity?.toString() ??
                                          '-',
                                      style: smallTextStyle)),
                              IconButton(
                                  onPressed: () async {
                                    await showModalActionSheet<int>(
                                        context: context,
                                        actions: <SheetAction<int>>[
                                          const SheetAction(
                                              label: 'Edit Variant', key: 0),
                                          const SheetAction(
                                              label: 'Delete Variant',
                                              key: 1,
                                              isDestructiveAction: true),
                                        ]).then((result) async {
                                      switch (result) {
                                        case 0:
                                          await context.pushRoute(
                                              ProductAddVariantRoute(
                                                  productVariantReq:
                                                      ProductVariantReq(
                                                          product: product,
                                                          productVariant:
                                                              variant)));
                                        case 1:
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.more_horiz))
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
