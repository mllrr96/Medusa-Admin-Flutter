import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/app/modules/products_module/product_details/components/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductDetailsLoadingPage extends StatelessWidget {
  const ProductDetailsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const product = Product(
      title: 'Medusa LongSleeve',
      description:
          'Reimagine the feeling of a classic long-sleeve. With our cotton long-sleeve, everyday essentials no longer have to be ordinary. Made with 100% cotton.',
      subtitle: 'subtitle',
      handle: 'medusa-longsleeve',
    );
    const space = Gap(12);
    return const Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
          children: [
            ProductDetailsOverview(product: product),
            space,
            FlexExpansionTile(
              leading: Icon(Icons.info),
              title: Text('Variants'),
            ),
            space,
            FlexExpansionTile(
              leading: Icon(Icons.info),
              title: Text('Attributes'),
            ),
            space,
            FlexExpansionTile(
              leading: Icon(Icons.info),
              title: Text('Thumbnail'),
            ),
            space,
            FlexExpansionTile(
              leading: Icon(Icons.info),
              title: Text('Images'),
            ),
          ],
        ),
      ),
    );
  }
}
