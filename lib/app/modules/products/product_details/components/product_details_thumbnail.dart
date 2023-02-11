import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class ProductDetailsThumbnail extends StatelessWidget {
  const ProductDetailsThumbnail({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return ExpansionTile(
      maintainState: true,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('Thumbnail', style: Theme.of(context).textTheme.bodyLarge),
      trailing: GetPlatform.isAndroid
          ? TextButton(onPressed: () {}, child: const Text('Edit'))
          : CupertinoButton(onPressed: () {}, padding: EdgeInsets.zero, child: const Text('Edit')),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        if (product.thumbnail != null) SizedBox(height: 120, child: CachedNetworkImage(imageUrl: product.thumbnail!)),
        space,
      ],
    );
  }
}
