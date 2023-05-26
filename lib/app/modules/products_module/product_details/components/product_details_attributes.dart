import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsAttributes extends GetView<ProductDetailsController> {
  const ProductDetailsAttributes({Key? key, required this.product, this.onExpansionChanged, this.expansionKey})
      : super(key: key);
  final Product product;
  final void Function(bool)? onExpansionChanged;
  final Key? expansionKey;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return CustomExpansionTile(
      key: expansionKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      label: 'Attributes',
      trailing: AdaptiveButton(
        padding: EdgeInsets.zero,
          onPressed: () async {
            // await Get.toNamed(Routes.ADD_UPDATE_PRODUCT, arguments: [product, ProductComponents.editAttributes])
            //     ?.then((result) async {
            //   if (result != null) {
            //     await controller.loadProduct();
            //     ProductsController.instance.pagingController.refresh();
            //   }
            // });
          },
          child: const Text('Edit')),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dimensions', style: mediumTextStyle),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Height', style: mediumTextStyle!.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.height?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Width', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.width?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Length', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.length?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Weight', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.weight?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            space,
            Text('Customs', style: mediumTextStyle),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('MID Code', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.midCode?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('HS Code', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.hsCode?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Country of origin', style: mediumTextStyle.copyWith(color: lightWhite))),
                Expanded(
                    flex: 2,
                    child: Text(product.originCountry?.toString() ?? '-',
                        style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
              ],
            ),
            space,
          ],
        )
      ],
    );
  }
}
