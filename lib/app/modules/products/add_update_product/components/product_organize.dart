import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';

class ProductOrganize extends StatelessWidget {
  const ProductOrganize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return ExpansionTile(
      title: Text('Organize', style: Theme.of(context).textTheme.bodyLarge),
      initiallyExpanded: true,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      children: [
        Row(
          children: [
            Text('Organize Product', style: largeTextStyle),
          ],
        ),
        space,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type', style: mediumTextStyle),
            const SizedBox(height: 6.0),
            TextFormField(
              style: mediumTextStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
            )
          ],
        ),
        space,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Collection', style: mediumTextStyle),
            const SizedBox(height: 6.0),
            TextFormField(
              style: mediumTextStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
            )
          ],
        ),
        space,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tags (comma separated)', style: mediumTextStyle),
            const SizedBox(height: 6.0),
            TextFormField(
              style: mediumTextStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
            )
          ],
        ),
        space,
        space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sales channels', style: largeTextStyle),
            Switch.adaptive(value: true, onChanged: (val) {}, activeColor: ColorManager.primary)
          ],
        ),
        Text('This product will only be available in the default sales channel if left untouched.',
            style: smallTextStyle!.copyWith(color: lightWhite)),
      ],
    );
  }
}
