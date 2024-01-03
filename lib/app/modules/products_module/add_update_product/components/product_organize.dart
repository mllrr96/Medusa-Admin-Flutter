import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../core/utils/colors.dart';
import '../../../components/labeled_chip_input_text_field.dart';
import '../controllers/add_update_product_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductOrganize extends GetView<AddUpdateProductController> {
  const ProductOrganize({super.key, this.onExpansionChanged});
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return GetBuilder<AddUpdateProductController>(
      id: 1,
      builder: (logic) {
        return FlexExpansionTile(
          controller: controller.organizeTileCtrl,
          onExpansionChanged: onExpansionChanged,
          title: const Text('Organize'),
          child: Column(
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
                  Row(
                    children: [
                      Text('Type', style: mediumTextStyle),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.productTypes != null
                        ? DropdownButtonFormField<ProductType>(
                            style: context.bodyMedium,
                            value: controller.selectedProductType,
                            disabledHint: const Text('No options'),
                            onChanged: (type) {
                              if (type != null) {
                                controller.selectedProductType = type;
                              }
                            },
                            items: controller.productTypes!
                                .map((e) => DropdownMenuItem<ProductType>(
                                    value: e,
                                    child:
                                        Text(e.value?.capitalize ?? e.value!)))
                                .toList(),
                            decoration: const InputDecoration(
                                hintText: 'Choose a type'),
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive()),
                  )
                ],
              ),
              space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Collection', style: mediumTextStyle),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.collections != null
                        ? DropdownButtonFormField<ProductCollection>(
                            style: context.bodyMedium,
                            value: controller.selectedCollection,
                            disabledHint: const Text('No options'),
                            onChanged: (collection) {
                              if (collection != null) {
                                controller.selectedCollection = collection;
                              }
                            },
                            items: controller.collections!
                                .map((e) => DropdownMenuItem<ProductCollection>(
                                    value: e,
                                    child:
                                        Text(e.title?.capitalize ?? e.title!)))
                                .toList(),
                            decoration: InputDecoration(
                              hintText: 'Choose a collection',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator.adaptive()),
                  )
                ],
              ),
              space,
              LabeledChipTextField(
                label: 'Tags',
                initialValue: controller.product.tags
                        ?.map((e) => e.value ?? '')
                        .toList() ??
                    [],
                onChanged: (List<String> value) {
                  final tags = value.map((e) => ProductTag(value: e)).toList();
                  controller.product = controller.product.copyWith(tags: tags);
                },
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                inputDecoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  hintText: 'Tags (comma separated)',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              space,
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Text('Sales channels', style: largeTextStyle),

                subtitle: Text(
                  'This product will only be available in the default sales channel if left untouched.',
                  style: TextStyle(color: lightWhite),
                ),
                value: controller.enableSalesChannels,
                onChanged:controller.updateMode ? null : (val) async {
                  controller.enableSalesChannels = val;
                  controller.update([1]);
                },
                activeColor: GetPlatform.isIOS ? ColorManager.primary : null,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.enableSalesChannels
                    ? Column(
                        children: [
                          if (controller.salesChannels != null)
                            ...controller.salesChannels!
                                .map((channel) => CheckboxListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(channel.name ?? ''),
                                      value: controller.selectedSalesChannels
                                              .contains(channel.id),
                                      onChanged: (val) {
                                        if (val != null) {
                                          if (val) {
                                            controller.selectedSalesChannels
                                                .add(channel.id!);
                                          } else {
                                            controller.selectedSalesChannels
                                                .remove(channel.id);
                                          }
                                          controller.update([1]);
                                        }
                                      },
                                    ))
                        ],
                      )
                    : const SizedBox.shrink(),
              )
            ],
          ),
        );
      },
    );
  }
}
