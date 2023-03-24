import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';

import '../../../components/custom_text_field.dart';
import '../controllers/add_update_product_controller.dart';

class ProductGeneralInformation extends GetView<AddUpdateProductController> {
  const ProductGeneralInformation({
    Key? key,
    this.editMode = false,
  }) : super(key: key);
  final bool editMode;
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return EditCard(label: 'General Information', editMode: editMode, children: [
      Text('To start selling, all you need is a name and a price.', style: smallTextStyle!.copyWith(color: lightWhite)),
      space,
      Form(
        key: controller.keyForm,
        child: CustomTextField(
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
      CustomTextField(label: 'Subtitle', hintText: 'Warm and cozy...', controller: controller.subtitleCtrl),
      Text('Give your product a short and clear title.\n50-60 characters is the recommended length for search engines.',
          style: smallTextStyle.copyWith(color: lightWhite)),
      space,
      CustomTextField(label: 'Handle', hintText: '/winter-jacket', controller: controller.handleCtrl),
      CustomTextField(label: 'Material', hintText: '100% cotton', controller: controller.materialCtrl),
      CustomTextField(
        label: 'Description',
        hintText: 'A warm and cozy jacket...',
        maxLines: null,
        controller: controller.descriptionCtrl,
        textInputAction: TextInputAction.done,
      ),
      Text(
          'Give your product a short and clear description.\n120-160 characters is the recommended length for search engines.',
          style: smallTextStyle.copyWith(color: lightWhite)),
      space,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Discountable', style: largeTextStyle),
          Obx(() {
            return Switch.adaptive(
                activeColor: ColorManager.primary,
                value: controller.discountable.value,
                onChanged: (val) {
                  controller.discountable.value = val;
                });
          })
        ],
      ),
      Text('When unchecked discounts will not be applied to this product.',
          style: smallTextStyle.copyWith(color: lightWhite)),
    ]);
  }
}

class EditCard extends StatelessWidget {
  const EditCard({
    Key? key,
    this.editMode = false,
    required this.children,
    required this.label,
    this.maintainState = false,
    this.required = false,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  }) : super(key: key);
  final bool editMode;
  final bool initiallyExpanded;
  final bool required;
  final List<Widget> children;
  final String label;
  final bool maintainState;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    if (editMode) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: Theme.of(context).expansionTileTheme.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      );
    }
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            onExpansionChanged: onExpansionChanged,
            maintainState: maintainState,
            title: required
                ? Row(
                    children: [
                      Text(label, style: Theme.of(context).textTheme.bodyLarge),
                      Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                    ],
                  )
                : Text(label, style: Theme.of(context).textTheme.bodyLarge),
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: children,
          ),
        ));
  }
}
