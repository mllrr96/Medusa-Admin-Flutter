import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'product_list_tile.dart';

class ProductsLoadingPage extends StatelessWidget {
  const ProductsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const product =
        Product(title: 'Medusa Js Product', status: ProductStatus.published);
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          20,
          (index) => index.isEven
              ? const ProductListTile(product: product)
              : const Divider(height: 0, indent: 16),
        ),
      ),
    );
  }
}
