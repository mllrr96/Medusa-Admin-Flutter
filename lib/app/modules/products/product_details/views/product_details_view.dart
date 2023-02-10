import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          if (controller.state != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(controller.state!.status.name.capitalize ?? controller.state!.status.name,
                  style: smallTextStyle),
            ),
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (product) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            children: [
              buildProductOverview(context, product),
              space,
              buildVariantsExpansionTile(context, product),
            ],
          ),
          onError: (e) => const Center(child: Text('Error loading product')),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }

  ExpansionTile buildVariantsExpansionTile(BuildContext context, Product? product) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Variants', style: Theme.of(context).textTheme.bodyLarge),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product!.options != null)
              ListView.builder(
                shrinkWrap: true,
                itemCount: product.options!.length,
                itemBuilder: (context, index) {
                  final option = product.options![index];
                  print(option.toJson());
                  return Text('');
                },
              ),
            // Do not remove the row
            Row(
              children: [
                Text(product.options?[0].title ?? 'Sized', style: mediumTextStyle),
              ],
            ),
            if (product.variants != null)
              Wrap(
                spacing: 8.0,
                children:
                    product.variants!.map((e) => Chip(label: Text(e.title ?? '', style: smallTextStyle))).toList(),
              ),
          ],
        ),
        space,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Product Variants (${product.variants?.length ?? ''})', style: mediumTextStyle),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Center(child: Text('Title', style: smallTextStyle))),
                Expanded(child: Center(child: Text('SKU', style: smallTextStyle))),
                Expanded(child: Center(child: Text('EAN', style: smallTextStyle))),
                Expanded(
                  child: Text('Inventory', style: smallTextStyle),
                )
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Center(child: Text(variant.title ?? '-', style: smallTextStyle))),
                        Expanded(child: Center(child: Text(variant.sku ?? '-', style: smallTextStyle))),
                        Expanded(child: Center(child: Text(variant.ean ?? '-', style: smallTextStyle))),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(child: Text(variant.inventoryQuantity?.toString() ?? '-', style: smallTextStyle)),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
                            ],
                          ),
                        )
                      ],
                    );
                  })
          ],
        ),
      ],
    );
  }

  Container buildProductOverview(BuildContext context, Product? product) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).expansionTileTheme.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(product!.title ?? '')),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          space,
          Text(product.description ?? '', style: mediumTextStyle!.copyWith(color: lightWhite)),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Details', style: mediumTextStyle),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Subtitle', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.subtitle ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Handle', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.handle ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Type', style: mediumTextStyle.copyWith(color: lightWhite))),
                  // TODO : Implement product type
                  Expanded(
                      flex: 2,
                      child: Text('Not implemented yet',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Collection', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.collection?.title ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Discountable', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.discountable.toString().capitalize ?? product.discountable.toString(),
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              space,
              Text('Sales Channel', style: mediumTextStyle),
              space,
            ],
          )
        ],
      ),
    );
  }
}
