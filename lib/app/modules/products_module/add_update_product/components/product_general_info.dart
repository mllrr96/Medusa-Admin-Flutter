import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_text_field.dart';
import '../controllers/add_update_product_controller.dart';

class ProductGeneralInformation extends GetView<AddUpdateProductController> {
  const ProductGeneralInformation({
    Key? key,
    this.editMode = false,
    this.onExpansionChanged,
  }) : super(key: key);
  final bool editMode;
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return GetBuilder<AddUpdateProductController>(
      id: 0,
      builder: (logic) {
        return CustomExpansionTile(
          controller: controller.generalTileCtrl,
          label: 'General Information',
          onExpansionChanged: onExpansionChanged,
          children: [
            Text('To start selling, all you need is a name and a price.',
                style: smallTextStyle!.copyWith(color: lightWhite)),
            space,
            Form(
              key: controller.keyForm,
              child: LabeledTextField(
                label: 'Title',
                hintText: 'Winter Jacket',
                controller: controller.titleCtrl,
                required: true,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
            ),
            LabeledTextField(label: 'Subtitle', hintText: 'Warm and cozy...', controller: controller.subtitleCtrl),
            Text(
                'Give your product a short and clear title.\n50-60 characters is the recommended length for search engines.',
                style: smallTextStyle.copyWith(color: lightWhite)),
            space,
            LabeledTextField(label: 'Handle', hintText: '/winter-jacket', controller: controller.handleCtrl),
            LabeledTextField(label: 'Material', hintText: '100% cotton', controller: controller.materialCtrl),
            LabeledTextField(
              label: 'Description',
              hintText: 'A warm and cozy jacket...',
              minLines: 4,
              maxLines: null,
              controller: controller.descriptionCtrl,
              textInputAction: TextInputAction.done,
            ),
            Text(
                'Give your product a short and clear description.\n120-160 characters is the recommended length for search engines.',
                style: smallTextStyle.copyWith(color: lightWhite)),
            space,
            SwitchListTile.adaptive(
              value: controller.discountable,
              activeColor: GetPlatform.isIOS ? ColorManager.primary : null,
              onChanged: (val) {
                controller.discountable = val;
                controller.update([0]);
              },
              contentPadding: EdgeInsets.zero,
              title: Text('Discountable', style: largeTextStyle),
              subtitle: Text('When unchecked discounts will not be applied to this product.',
                  style: smallTextStyle.copyWith(color: lightWhite)),
            ),
          ],
        );
      },
    );
  }
}