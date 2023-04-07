import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/store/product_collection.dart';
import '../../../../routes/app_pages.dart';


class CollectionListTile extends StatelessWidget {
  const CollectionListTile(this.collection, {super.key, this.tileColor});
  final ProductCollection collection;
  final Color? tileColor;
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return ListTile(
      tileColor:tileColor ?? Theme.of(context).listTileTheme.tileColor,
      onTap: () => Get.toNamed(Routes.COLLECTION_DETAILS, arguments: collection.id!),
      title: Text(collection.title ?? '', style: largeTextStyle),
      subtitle: Text('/${collection.handle ?? ''}', style: smallTextStyle!.copyWith(color: lightWhite)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (collection.updatedAt != null)
            Text(DateFormat.yMMMd().format(collection.updatedAt!), style: smallTextStyle),
          if (collection.products != null)
            Text('Products: ${collection.products?.length ?? ''}', style: smallTextStyle),
        ],
      ),
    );
  }
}
