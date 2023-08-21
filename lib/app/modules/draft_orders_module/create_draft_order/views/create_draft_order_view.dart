import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/choose_region_view.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../components/index.dart';
import '../components/pick_product_variants/controllers/pick_product_variants_controller.dart';
import '../controllers/create_draft_order_controller.dart';

class CreateDraftOrderView extends GetView<CreateDraftOrderController> {
  const CreateDraftOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);

    Future<void> addItems() async {
      final result = await Get.toNamed(Routes.PICK_PRODUCT_VARIANTS,
          arguments: SelectProductsReq(selectedProducts: controller.variants));
      if (result is SelectProductsRes) {
        final variants = result.selectedProductVariants;
        if (variants?.isNotEmpty ?? false) {
          controller.variants = variants!;
          controller.update();
        }
      }
    }

    return GetBuilder<CreateDraftOrderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: const Text('Create Draft Order'),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom),
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(onPressed: () {}, child: const Text('Back')),
                  AdaptiveButton(onPressed: () {}, child: const Text('Next')),
                  AdaptiveButton(onPressed: () {
                    print(controller.formKey.currentState!.validate());
                  }, child: const Text('Create')),
                ],
              ),
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    ChooseRegionView(
                      onRegionChanged: (region) {
                        controller.selectedRegion = region;
                        controller.update();
                      },
                    ),
                    space,
                    SlidableAutoCloseBehavior(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: CustomExpansionTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text('Order items', style: smallTextStyle),
                          trailing: AdaptiveIcon(
                              onPressed: () async => addItems(),
                              icon: const Icon(Icons.add)),
                          children: [
                            if (controller.variants.isEmpty)
                              Column(
                                children: [
                                  Text('No items has been added yet',
                                      style: smallTextStyle),
                                  AdaptiveButton(
                                      onPressed: () async => addItems(),
                                      child: const Text('Add items'))
                                ],
                              ),
                            if (controller.variants.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Slide left to delete a variant',
                                      style: smallTextStyle?.copyWith(
                                          color: lightWhite)),
                                  const SizedBox(height: 6.0),
                                  ...controller.variants
                                      .map((e) => VariantListTile(
                                            e,
                                            onDelete: () {
                                              controller.variants.removeWhere(
                                                  (variant) =>
                                                      variant.id == e.id);
                                              controller.update();
                                            },
                                          ))
                                      .toList(),
                                  const SizedBox(height: 6.0),
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                    space,
                    if (controller.selectedRegion != null)
                      ChooseShippingMethodView(
                          regionId: controller.selectedRegion!.id!),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class VariantListTile extends StatelessWidget {
  const VariantListTile(this.productVariant,
      {super.key, this.onDelete, this.onAddTap, this.onRemoveTap});
  final ProductVariant productVariant;
  final void Function()? onDelete;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;

    String getCurrencyText() {
      var value = productVariant.prices?[0].amount?.roundToDouble() ?? 0.0;
      final valueFormatter =
          NumberFormat.currency(name: productVariant.prices?[0].currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

    const space = SizedBox(width: 12.0);
    return Slidable(
      groupTag: const Key('variants'),
      key: ValueKey(productVariant.id!),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              if (onDelete != null) {
                onDelete!();
              }
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                //Image
                if (productVariant.product?.thumbnail != null)
                  SizedBox(
                      width: 45,
                      child: CachedNetworkImage(
                        key: ValueKey(productVariant.product!.thumbnail!),
                        imageUrl: productVariant.product!.thumbnail!,
                        placeholder: (context, text) => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        errorWidget: (context, string, error) => const Icon(
                            Icons.warning_rounded,
                            color: Colors.redAccent),
                      )),
                space,
                // Product, Variant name and price
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productVariant.product?.title ?? '',
                        style: mediumTextStyle,
                      ),
                      Text(productVariant.title ?? '',
                          style: smallTextStyle?.copyWith(color: lightWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(getCurrencyText(),
                          style: smallTextStyle?.copyWith(color: lightWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Variant quantity
          Row(
            children: [
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.remove),
                padding: EdgeInsets.zero,
              ),
              Text('1'),
              IconButton(
                onPressed: onAddTap,
                icon: const Icon(Icons.add),
                padding: EdgeInsets.zero,
              ),
            ],
          )
        ],
      ),
    );
  }
}
