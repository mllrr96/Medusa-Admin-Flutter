import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/date_time_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class CollectionListTile extends StatelessWidget {
  const CollectionListTile(this.collection, {super.key, this.tileColor, this.onTap});

  final ProductCollection collection;
  final Color? tileColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        tileColor: tileColor ?? Theme.of(context).listTileTheme.tileColor,
        onTap: onTap,
        title: Text(collection.title, style: largeTextStyle),
        subtitle:
            Text('/${collection.handle}', style: smallTextStyle!.copyWith(color: manatee)),
        trailing: collection.updatedAt == null
            ? null
            : Text(
                collection.updatedAt.formatDate(),
                style: smallTextStyle,
              ),
      ),
    );
  }
}
