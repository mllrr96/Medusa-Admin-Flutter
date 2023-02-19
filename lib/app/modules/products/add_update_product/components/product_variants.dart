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
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final optionCtrl = TextEditingController();
    final variationsCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    const space = SizedBox(height: 12.0);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        title: Text('Variants', style: Theme.of(context).textTheme.bodyLarge),
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
          if (controller.product.options != null)
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductOptionCard(
                      productOption: controller.product.options![index],
                      delete: () {
                        controller.product.options?.removeAt(index);
                        controller.update();
                      },
                    ),
                separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                itemCount: controller.product.options!.length),
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
                              Form(
                                key: formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (GetPlatform.isIOS)
                                      CupertinoButton(child: const Text('Cancel'), onPressed: () => Get.back()),
                                    if (GetPlatform.isIOS)
                                      CupertinoButton(
                                          child: const Text('Add'),
                                          onPressed: () {
                                            print(formKey.currentState!.validate());
                                            if (!formKey.currentState!.validate()) {
                                              return;
                                            }
                                            if (optionCtrl.text.removeAllWhitespace.isNotEmpty &&
                                                variationsCtrl.text.removeAllWhitespace.isNotEmpty) {
                                              List<ProductOption>? options = controller.product.options;
                                              List<String> variations =
                                                  variationsCtrl.text.removeAllWhitespace.split(',');
                                              var variationsValue = <ProductOptionValue>[];
                                              if (variations.isNotEmpty) {
                                                variations
                                                    .removeWhere((element) => element.removeAllWhitespace.isEmpty);
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
                                              controller.product = controller.product.copyWith(options: options);
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
                              ),
                              ProductTextField(
                                label: 'Option title',
                                controller: optionCtrl,
                                hintText: 'Color...',
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
                              ),
                              ProductTextField(
                                label: 'Variations (comma separated)',
                                controller: variationsCtrl,
                                hintText: 'Blue, Red, Black...',
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
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
          space,
          if (controller.product.variants != null)
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductVariantCard(variant: controller.product.variants![index]),
                separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                itemCount: controller.product.variants!.length),
          if (GetPlatform.isAndroid)
            TextButton(
                onPressed: controller.product.options == null || controller.product.options!.isEmpty
                    ? null
                    : () async {
                        final result = await Get.to(
                            () => ProductAddVariant(
                                currencies: StoreService.store.currencies ?? [], options: controller.product.options!),
                            fullscreenDialog: true);
                        if (result != null) {
                          if (controller.product.variants != null) {
                            List<ProductVariant> variants = controller.product.variants!;
                            variants.add(result);
                            controller.product = controller.product.copyWith(variants: variants);
                          } else {
                            controller.product = controller.product.copyWith(variants: [result]);
                          }
                        }
                        controller.update();
                      },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(Icons.add), Text('Add a variant')],
                )),
          if (GetPlatform.isIOS)
            CupertinoButton(
              onPressed: controller.product.options == null || controller.product.options!.isEmpty
                  ? null
                  : () async {
                      final result = await Get.to(
                          () => ProductAddVariant(
                              currencies: StoreService.store.currencies ?? [], options: controller.product.options!),
                          fullscreenDialog: true);
                      if (result != null) {
                        if (controller.product.variants != null) {
                          List<ProductVariant> variants = controller.product.variants!;
                          variants.add(result);
                          controller.product = controller.product.copyWith(variants: variants);
                        } else {
                          controller.product = controller.product.copyWith(variants: [result]);
                        }
                      }
                      controller.update();
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

class ProductVariantCard extends StatelessWidget {
  const ProductVariantCard({
    super.key,
    required this.variant,
  });

  final ProductVariant variant;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            variant.title!,
            style: mediumTextStyle!.copyWith(fontWeight: FontWeight.bold),
          )),
          Row(
            children: [
              Text(variant.inventoryQuantity?.toString() ?? '', style: mediumTextStyle),
              const SizedBox(width: 10.0),
              if (isVariantCompleted(variant)) const Icon(Icons.check_circle, color: Colors.green),
              if (!isVariantCompleted(variant)) const Icon(Icons.error, color: Colors.orange),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          )
        ],
      ),
    );
  }

  bool isVariantCompleted(ProductVariant variant) {
    if (variant.inventoryQuantity == null ||
        variant.length == null ||
        variant.width == null ||
        variant.height == null ||
        variant.weight == null ||
        variant.originCountry == null) {
      return false;
    }

    return true;
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
