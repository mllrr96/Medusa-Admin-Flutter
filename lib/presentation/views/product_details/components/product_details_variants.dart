import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/product_variant_extension.dart';
import 'package:medusa_admin/data/models/product_variant_req.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductDetailsVariants extends StatelessWidget {
  const ProductDetailsVariants({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return FlexExpansionTile(
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext.ensureVisibility();
        }
      },
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
                          option: element.option,
                          variantId: null));
                    });

                    newVariant = newVariant.copyWith(options: options);
                    if (context.mounted) {
                      context.read<ProductCrudBloc>().add(
                          ProductCrudEvent.update(
                              product.id!,
                              UserPostUpdateProductReq(
                                  variants: [newVariant])));
                    }
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(option.title ?? '', style: mediumTextStyle),
                      Wrap(
                        spacing: 8.0,
                        children: option.values
                                ?.map((e) => Chip(
                                    label: Text(e.value ?? '',
                                        style: smallTextStyle)))
                                .toList() ??
                            [],
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
