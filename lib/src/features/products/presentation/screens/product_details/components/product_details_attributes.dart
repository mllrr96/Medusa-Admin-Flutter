import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductDetailsAttributes extends StatelessWidget {
  const ProductDetailsAttributes({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    return FlexExpansionTile(
      onExpansionChanged: (expanded) async {
        if (expanded && key is GlobalKey) {
          await (key as GlobalKey).currentContext.ensureVisibility();
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Attributes'),
      trailing: TextButton(
          onPressed: () async {
            // await context
            //     .pushRoute(AddUpdateProductRoute(
            //         updateProductReq:
            //             UpdateProductReq(product: product, number: 3)))
            //     .then((result) async {
            //   if (result != null) {
            //     context
            //         .read<ProductCrudBloc>()
            //         .add(ProductCrudEvent.loadProductVariants(product.id));
            //   }
            // });
          },
          child: const Text('Edit')),
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
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
                          style: mediumTextStyle!.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.height?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Width',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.width?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Length',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.length?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Weight',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.weight?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
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
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.midCode?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('HS Code',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Expanded(
                      flex: 2,
                      child: Text(product.hsCode?.toString() ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Country of origin',
                      style: mediumTextStyle.copyWith(color: manatee)),
                  Row(
                    children: [
                      Text(
                          countries
                                  .where((element) =>
                                      element.iso2 == product.originCountry)
                                  .firstOrNull
                                  ?.displayOnStore ??
                              '-',
                          style: mediumTextStyle.copyWith(color: manatee),
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
      ),
    );
  }
}
