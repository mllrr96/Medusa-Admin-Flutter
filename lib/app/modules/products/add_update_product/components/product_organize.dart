import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/controllers/add_update_product_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';

class ProductOrganize extends GetView<AddUpdateProductController> {
  const ProductOrganize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: ExpansionTile(
          maintainState:true,
          title: Text('Organize', style: Theme.of(context).textTheme.bodyLarge),
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
                Obx(() {
                  return Switch.adaptive(
                      value: controller.salesChannels.value,
                      onChanged: (val) => controller.salesChannels.value = val,
                      activeColor: ColorManager.primary);
                })
              ],
            ),
            Text('This product will only be available in the default sales channel if left untouched.',
                style: smallTextStyle!.copyWith(color: lightWhite)),
          ],
        ),
      ),
    );
  }
}
