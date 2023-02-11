import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    const space = SizedBox(height: 12.0);
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
          const ProductOptionCard(),
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
                onPressed: () {
                  showCupertinoModalBottomSheet(
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
                                    CupertinoButton(child: const Text('Add'), onPressed: () => Get.back()),
                                  if (GetPlatform.isAndroid)
                                    TextButton(child: const Text('Cancel'), onPressed: () => Get.back()),
                                  if (GetPlatform.isAndroid)
                                    CupertinoButton(child: const Text('Add'), onPressed: () => Get.back()),
                                ],
                              ),
                              ProductTextField(
                                label: 'Option title',
                                controller: TextEditingController(),
                                hintText: 'Color...',
                              ),
                              ProductTextField(
                                label: 'Variations (comma separated)',
                                controller: TextEditingController(),
                                hintText: 'Blue, Red, Black...',
                              ),
                            ],
                          ),
                        );
                      });
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
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => ProductAddVariant(currencies: StoreService.store.currencies ?? []),
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
  const ProductOptionCard({
    super.key,
  });

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
                    Text('Color', style: smallTextStyle),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red))
            ],
          ),
          space,
          Text('Variations', style: smallTextStyle.copyWith(color: lightWhite)),
          Wrap(
            runSpacing: 5.0,
            spacing: 5.0,
            children: [
              Chip(label: const Text('Blue'), labelStyle: smallTextStyle),
              Chip(label: const Text('Red'), labelStyle: smallTextStyle),
              Chip(label: const Text('Green'), labelStyle: smallTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
