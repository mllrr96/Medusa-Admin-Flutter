import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'product_add_option.dart';
import 'product_add_variant.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class ProductVariants extends StatefulWidget {
  const ProductVariants(
      {super.key, this.controller, this.product, this.onSaved});
  final FlexExpansionTileController? controller;
  final Product? product;
  final void Function(Product product)? onSaved;

  @override
  State<ProductVariants> createState() => _ProductVariantsState();
}

class _ProductVariantsState extends State<ProductVariants> {
  late Product product;
  List<ProductOption> options = [];
  List<ProductVariant> variants = [];
  final key = GlobalKey();

  @override
  void initState() {
    product = widget.product ?? const Product();
    product.options?.forEach((option) {
      options.add(option);
    });
    product.variants?.forEach((variant) {
      variants.add(variant);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return FormField(
      onSaved: (_) {
        widget.onSaved?.call(Product(
          options: options,
          variants: variants,
        ));
      },
      builder: (_) => FlexExpansionTile(
        key: key,
        controller: widget.controller,
        maintainState: true,
        onExpansionChanged: (expanded) async {
          if (expanded) {
            await key.currentContext.ensureVisibility();
          }
        },
        title: Text('Variants', style: context.theme.textTheme.bodyLarge),
        childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          children: [
            Text(
                'Add variations of this product.\nOffer your customers different options for color, format, size, shape, etc.',
                style: smallTextStyle!.copyWith(color: manatee)),
            space,
            Row(
              children: [
                Text('Product options', style: largeTextStyle),
              ],
            ),
            if (options.isNotEmpty) space,
            if (options.isNotEmpty)
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProductOptionCard(
                        productOption: options[index],
                        delete: () {
                          setState(() => options.removeAt(index));
                        },
                      ),
                  separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                  itemCount: options.length),
            space,
            TextButton(
                onPressed: () async {
                  final result = await showModalBottomSheet(
                      context: context,
                      builder: (context) => const AddOptionView(),
                      isScrollControlled: true);
                  if (result is ProductOption) {
                    setState(() => options.add(result));
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Add an option')],
                )),
            space,
            Row(
              children: [
                Text('Product variants', style: largeTextStyle),
              ],
            ),
            if (variants.isNotEmpty) space,
            if (variants.isNotEmpty)
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      ProductVariantCard(variant: variants[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                  itemCount: variants.length),
            TextButton(
              onPressed: options.isEmpty
                  ? null
                  : () async {
                      final result = await context.pushRoute(
                          ProductAddVariantRoute(
                              productVariantReq:
                                  ProductVariantReq(product: product)));
                      if (result is ProductVariant) {
                        setState(() => variants.add(result));
                      }
                    },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.add), Text('Add a variant')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductVariantCard extends StatelessWidget {
  const ProductVariantCard({
    super.key,
    required this.variant,
  });

  final ProductVariant variant;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            variant.title!,
            style: mediumTextStyle!.copyWith(fontWeight: FontWeight.bold),
          )),
          Row(
            children: [
              Text(variant.inventoryQuantity?.toString() ?? '',
                  style: mediumTextStyle),
              const SizedBox(width: 10.0),
              if (isVariantCompleted(variant))
                const Icon(Icons.check_circle, color: Colors.green),
              if (!isVariantCompleted(variant))
                const Icon(Icons.error, color: Colors.orange),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          )
        ],
      ),
    );
  }

  bool isVariantCompleted(ProductVariant variant) {
    if (variant.inventoryQuantity == null ||
        variant.length == null ||
        variant.width == null ||
        variant.height == null ||
        variant.weight == null ||
        variant.originCountry == null) {
      return false;
    }

    return true;
  }
}

class ProductOptionCard extends StatelessWidget {
  const ProductOptionCard(
      {super.key, required this.productOption, this.delete});

  final ProductOption productOption;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Option title',
                        style: smallTextStyle!.copyWith(color: manatee)),
                    Text(productOption.title ?? '', style: smallTextStyle),
                  ],
                ),
              ),
              IconButton(
                  onPressed: delete,
                  icon: const Icon(Icons.delete_forever, color: Colors.red))
            ],
          ),
          space,
          Text('Variations', style: smallTextStyle.copyWith(color: manatee)),
          if (productOption.values != null)
            Wrap(
              runSpacing: 5.0,
              spacing: 5.0,
              children: productOption.values!
                  .map((e) =>
                      Chip(label: Text(e.value!), labelStyle: smallTextStyle))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
