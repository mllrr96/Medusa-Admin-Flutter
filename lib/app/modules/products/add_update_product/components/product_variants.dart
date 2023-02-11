import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return ExpansionTile(
      title: Text('Variants', style: Theme.of(context).textTheme.bodyLarge),
      initiallyExpanded: true,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Text(
            'Add variations of this product.\nOffer your customers different options for color, format, size, shape, etc.',
            style: smallTextStyle!.copyWith(color: lightWhite)),
      ],
    );
  }
}
