import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class CollectionListTile extends StatelessWidget {
  const CollectionListTile(this.collection, {super.key, this.tileColor});
  final ProductCollection collection;
  final Color? tileColor;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return ListTile(
      tileColor: tileColor ?? Theme.of(context).listTileTheme.tileColor,
      onTap: () => context.pushRoute(CollectionDetailsRoute(collectionId: collection.id!)),
      title: Text(collection.title ?? '', style: largeTextStyle),
      subtitle: Text('/${collection.handle ?? ''}', style: smallTextStyle!.copyWith(color: manatee)),
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
