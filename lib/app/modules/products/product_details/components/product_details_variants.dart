import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class ProductDetailsVariants extends StatelessWidget {
  const ProductDetailsVariants({Key? key, required this.product}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    return ExpansionTile(
      maintainState: true,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Variants', style: Theme.of(context).textTheme.bodyLarge),
      trailing: IconButton(
          onPressed: () async {
            final result = await showModalActionSheet(context: context, actions: <SheetAction>[
              const SheetAction(label: 'Add Variants'),
              const SheetAction(label: 'Edit Variants'),
              const SheetAction(label: 'Edit Options'),
            ]);
          },
          icon: const Icon(Icons.more_horiz)),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.options != null)
              ListView.builder(
                shrinkWrap: true,
                itemCount: product.options!.length,
                itemBuilder: (context, index) {
                  final option = product.options![index];
                  // print(option.);
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
}
