import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/add_update_product_controller.dart';

class ProductVariants extends GetView<AddUpdateProductController> {
  const ProductVariants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final optionCtrl = TextEditingController();
    final variationsCtrl = TextEditingController();
    const space = SizedBox(height: 12.0);
    var product = controller.product;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text('Variants', style: Theme.of(context).textTheme.bodyLarge),
        initiallyExpanded: true,
        expandedAlignment: Alignment.centerLeft,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        children: [
          Text(
              'Add variations of this product.\nOffer your customers different options for color, format, size, shape, etc.',
              style: smallTextStyle!.copyWith(color: lightWhite)),
          space,
          Row(
            children: [
              Text('Product options', style: largeTextStyle),
            ],
          ),
          space,
          if (product.options != null)
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductOptionCard(
                      productOption: product.options![index],
                      delete: () {
                        controller.product.options?.removeAt(index);
                        controller.update();
                      },
                    ),
                separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                itemCount: product.options!.length),
          space,
          if (GetPlatform.isAndroid)
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(Icons.add), Text('Add an option')],
                )),
          if (GetPlatform.isIOS)
            CupertinoButton(
                onPressed: () async {
                  await showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 8.0,
                              left: 12.0,
                              right: 12.0,
                              bottom: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if (GetPlatform.isIOS)
                                    CupertinoButton(child: const Text('Cancel'), onPressed: () => Get.back()),
                                  if (GetPlatform.isIOS)
                                    CupertinoButton(
                                        child: const Text('Add'),
                                        onPressed: () {
                                          if (optionCtrl.text.removeAllWhitespace.isNotEmpty &&
                                              variationsCtrl.text.removeAllWhitespace.isNotEmpty) {
                                            List<ProductOption>? options = product.options;
                                            List<String> variations =
                                                variationsCtrl.text.removeAllWhitespace.split(',');
                                            var variationsValue = <ProductOptionValue>[];
                                            if (variations.isNotEmpty) {
                                              variations.removeWhere((element) => element == '');
                                              for (var element in variations) {
                                                variationsValue.add(ProductOptionValue(value: element));
                                              }
                                            }
                                            ProductOption newOption = ProductOption(
                                                title: optionCtrl.text.removeAllWhitespace, values: variationsValue);
                                            if (options != null) {
                                              options.add(newOption);
                                            } else {
                                              options = [newOption];
                                            }
                                            controller.product = product.copyWith(options: options);
                                          } else {
                                            // Show fields are required
                                          }
                                          Get.back();
                                          controller.update();
                                        }),
                                  if (GetPlatform.isAndroid)
                                    TextButton(child: const Text('Cancel'), onPressed: () => Get.back()),
                                  if (GetPlatform.isAndroid)
                                    CupertinoButton(child: const Text('Add'), onPressed: () => Get.back()),
                                ],
                              ),
                              ProductTextField(
                                label: 'Option title',
                                controller: optionCtrl,
                                hintText: 'Color...',
                              ),
                              ProductTextField(
                                label: 'Variations (comma separated)',
                                controller: variationsCtrl,
                                hintText: 'Blue, Red, Black...',
                              ),
                            ],
                          ),
                        );
                      });
                  optionCtrl.clear();
                  variationsCtrl.clear();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(Icons.add), Text('Add an option')],
                )),
          space,
          Row(
            children: [
              Text('Product variants', style: largeTextStyle),
            ],
          ),
          if (GetPlatform.isAndroid)
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(Icons.add), Text('Add a variant')],
                )),
          if (GetPlatform.isIOS)
            CupertinoButton(
              onPressed: () {
                if (controller.product.options == null) {
                  return;
                }
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => ProductAddVariant(
                    currencies: StoreService.store.currencies ?? [],
                    options: controller.product.options!,
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [Icon(Icons.add), Text('Add a variant')],
              ),
            ),
        ],
      ),
    );
  }
}

class ProductOptionCard extends StatelessWidget {
  const ProductOptionCard({super.key, required this.productOption, this.delete});
  final ProductOption productOption;
  final void Function()? delete;
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Option title', style: smallTextStyle!.copyWith(color: lightWhite)),
                    Text(productOption.title ?? '', style: smallTextStyle),
                  ],
                ),
              ),
              IconButton(onPressed: delete, icon: const Icon(Icons.delete_forever, color: Colors.red))
            ],
          ),
          space,
          Text('Variations', style: smallTextStyle.copyWith(color: lightWhite)),
          if (productOption.values != null)
            Wrap(
              runSpacing: 5.0,
              spacing: 5.0,
              children:
                  productOption.values!.map((e) => Chip(label: Text(e.value!), labelStyle: smallTextStyle)).toList(),
            ),
        ],
      ),
    );
  }
}
