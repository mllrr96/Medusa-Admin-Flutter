import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PriceListProductsLoadingPage extends StatelessWidget {
  const PriceListProductsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          ListTile(
            leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
            title: const Text('Medusa Product'),
            subtitle: Text('collection',
                style:
                smallTextStyle?.copyWith(color: manatee))
            ,
            trailing: Text(
                'Variants: N/A',
                style: mediumTextStyle),
          ),
          ListTile(
            leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
            title: const Text('Medusa Product'),
            subtitle: Text('collection',
                style:
                smallTextStyle?.copyWith(color: manatee))
            ,
            trailing: Text(
                'Variants: N/A',
                style: mediumTextStyle),
          ),
          ListTile(
            leading: Container(width: 45,color: ColorManager.manatee,child: const Icon(Icons.image_not_supported),),
            title: const Text('Medusa Product'),
            subtitle: Text('collection',
                style:
                smallTextStyle?.copyWith(color: manatee))
            ,
            trailing: Text(
                'Variants: N/A',
                style: mediumTextStyle),
          ),
        ],
      ),
    );
  }
}
