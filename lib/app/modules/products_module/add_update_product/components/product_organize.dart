import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/labeled_chip_input_text_field.dart';
import '../controllers/add_update_product_controller.dart';

class ProductOrganize extends GetView<AddUpdateProductController> {
  const ProductOrganize({Key? key, this.onExpansionChanged}) : super(key: key);
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return GetBuilder<AddUpdateProductController>(
      id: 1,
      builder: (logic) {
        return CustomExpansionTile(
          onExpansionChanged: onExpansionChanged,
          label: 'Organize',
          expandedAlignment: Alignment.centerLeft,
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
                          value: controller.selectedProductType,
                          disabledHint: const Text('No options'),
                          onChanged: (type) {
                            if (type != null) {
                              controller.selectedProductType = type;
                            }
                          },
                          items: controller.productTypes!
                              .map((e) =>
                                  DropdownMenuItem<ProductType>(value: e, child: Text(e.value?.capitalize ?? e.value!)))
                              .toList(),
                          decoration: const InputDecoration(hintText: 'Choose a type'),
                        )
                      : const Center(child: CircularProgressIndicator.adaptive()),
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
                          value: controller.selectedCollection,
                          disabledHint: const Text('No options'),
                          onChanged: (collection) {
                            if (collection != null) {
                              controller.selectedCollection = collection;
                            }
                          },
                          items: controller.collections!
                              .map((e) => DropdownMenuItem<ProductCollection>(
                                  value: e, child: Text(e.title?.capitalize ?? e.title!)))
                              .toList(),
                          decoration: InputDecoration(
                              hintText: 'Choose a collection',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              )),
                        )
                      : const Center(child: CircularProgressIndicator.adaptive()),
                )
              ],
            ),
            space,
            LabeledChipTextField(
              label: 'Tags',
              onChanged: (List<String> value) {},
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
            Obx(() {

              return SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Sales channels', style: largeTextStyle),
                  subtitle: Text('This product will only be available in the default sales channel if left untouched.', style: TextStyle(color:lightWhite),),
                  value: controller.salesChannels.value,
                  onChanged: (val) => controller.salesChannels.value = val,
              );
            }),
          ],
        );
      },
    );
  }
}
