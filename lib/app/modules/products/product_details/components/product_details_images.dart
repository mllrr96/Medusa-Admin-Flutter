import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class ProductDetailsImages extends StatelessWidget {
  const ProductDetailsImages({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text('Images', style: Theme.of(context).textTheme.bodyLarge),
        trailing: GetPlatform.isAndroid
            ? TextButton(onPressed: () {}, child: const Text('Edit'))
            : CupertinoButton(onPressed: () {}, padding: EdgeInsets.zero, child: const Text('Edit')),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        children: [
          if (product.images != null)
            Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: product.images!
                    .map((e) => SizedBox(height: 120, width: 90, child: CachedNetworkImage(imageUrl: e.url!)))
                    .toList()),
          space,
        ],
      ),
    );
  }
}
