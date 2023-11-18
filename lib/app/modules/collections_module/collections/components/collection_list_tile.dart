import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/product_collection.dart';
import '../../../../routes/app_pages.dart';

class CollectionListTile extends StatelessWidget {
  const CollectionListTile(this.collection, {super.key, this.tileColor});
  final ProductCollection collection;
  final Color? tileColor;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return ListTile(
      tileColor: tileColor ?? Theme.of(context).listTileTheme.tileColor,
      onTap: () => Get.toNamed(Routes.COLLECTION_DETAILS, arguments: collection.id!),
      title: Text(collection.title ?? '', style: largeTextStyle),
      subtitle: Text('/${collection.handle ?? ''}', style: smallTextStyle!.copyWith(color: lightWhite)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (collection.updatedAt != null) Text(collection.updatedAt.formatDate(), style: smallTextStyle),
          if (collection.products != null)
            Text('Products: ${collection.products?.length ?? ''}', style: smallTextStyle),
        ],
      ),
    );
  }
}
