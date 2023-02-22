import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/product.dart';

class ProductDetailsAttributes extends StatelessWidget {
  const ProductDetailsAttributes({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: ExpansionTile(
          maintainState: true,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('Attributes', style: Theme.of(context).textTheme.bodyLarge),
          trailing: GetPlatform.isAndroid
              ? TextButton(onPressed: () {}, child: const Text('Edit'))
              : CupertinoButton(onPressed: () {}, padding: EdgeInsets.zero, child: const Text('Edit')),
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
        ),
      ),
    );
  }
}
