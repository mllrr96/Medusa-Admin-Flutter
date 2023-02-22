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
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: ExpansionTile(
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
            if (product.options != null)
              ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: product.options!.length,
                  itemBuilder: (context, index) {
                    final option = product.options![index];
                    final seen = <String>{};
                    final List<ProductOptionValue> values = product.options![index].values!;
                    final unique = values.where((str) => seen.add(str.value!)).toList();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option.title ?? '', style: mediumTextStyle),
                        Wrap(
                          spacing: 8.0,
                          children:
                            unique.map((e) => Chip(label: Text(e.value ?? '', style: smallTextStyle))).toList(),
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
                                  Center(
                                      child: Text(variant.inventoryQuantity?.toString() ?? '-', style: smallTextStyle)),
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
        ),
      ),
    );
  }
}
