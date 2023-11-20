import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/pick_product_variants/controllers/pick_product_variants_controller.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/variant_list_tile.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../data/models/store/line_item.dart';
import '../../../../data/models/store/region.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/custom_expansion_tile.dart';
import '../controllers/create_draft_order_controller.dart';
import 'add_custom_item_view.dart';
import 'choose_region_view.dart';
import 'choose_shipping_option.dart';

class ItemsView extends StatelessWidget {
  const ItemsView(this.controller, {super.key});
  final CreateDraftOrderController controller;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    final lineItems = controller.lineItems;
    final customLineItems = controller.customLineItems;

    Future<void> addItems() async {
      final result = await Get.toNamed(Routes.PICK_PRODUCT_VARIANTS,
          arguments: SelectProductsReq(selectedProducts: controller.lineItems.map((e) => e.variant!).toList()));
      if (result is SelectProductsRes) {
        final variants = result.selectedProductVariants;
        if (variants?.isEmpty ?? true) {
          return;
        }

        if (controller.lineItems.isEmpty) {
          for (var variant in variants!) {
            controller.lineItems.add(LineItem(
              variantId: variant.id,
              variant: variant,
              quantity: 1,
            ));
          }
        } else {
          // Checking if there's any variants got removed and remove them
          controller.lineItems.retainWhere((element) => variants!.contains(element.variant));
          var newItems = variants;
          newItems!
              .removeWhere((element) => controller.lineItems.map((e) => e.variantId).toList().contains(element.id));
          for (var element in newItems) {
            controller.lineItems.add(LineItem(variantId: element.id, variant: element, quantity: 1));
          }
        }
        controller.update();
      }
    }

    void onRegionChanged(Region? region) {
      if (controller.selectedRegion == null && lineItems.isEmpty && customLineItems.isEmpty) {
        controller.expansionController.expand();
      }
      // if the selected region is the same then just return
      if (controller.selectedRegion?.id == region?.id) {
        return;
      }
      controller.selectedRegion = region;
      controller.shippingAddress.country = region?.countries?.first;
      controller.billingAddress.country = region?.countries?.first;

      controller.update();
    }

    return SafeArea(
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            ChooseRegionView(
              onRegionChanged: onRegionChanged,
            ),
            space,
            SlidableAutoCloseBehavior(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomExpansionTile(
                  controller: controller.expansionController,
                  childrenPadding: EdgeInsets.zero,
                  title: Text('Order items', style: smallTextStyle),
                  children: [
                    if (lineItems.isEmpty && customLineItems.isEmpty)
                      Column(
                        children: [
                          Text('No items has been added yet', style: smallTextStyle),
                          space,
                        ],
                      ),
                    if (lineItems.isNotEmpty || customLineItems.isNotEmpty)
                      Text('Slide left to delete a variant', style: smallTextStyle?.copyWith(color: lightWhite)),
                    if (lineItems.isNotEmpty)
                      ListView.builder(
                          itemCount: lineItems.length,
                          padding: const EdgeInsets.fromLTRB(12.0, 4.0, 0.0, 4.0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final lineItem = lineItems[index];
                            return VariantListTile(
                              lineItem,
                              onDelete: () {
                                controller.lineItems.removeAt(index);
                                controller.update();
                              },
                              onAddTap: () {
                                var quantity = controller.lineItems[index].quantity;
                                quantity = quantity! + 1;
                                controller.lineItems[index] =
                                    controller.lineItems.elementAt(index).copyWith(quantity: quantity);
                                print(quantity);
                                controller.update();
                              },
                              onRemoveTap: lineItem.quantity! > 1
                                  ? () {
                                      var quantity = controller.lineItems[index].quantity;
                                      if (quantity! > 1) {
                                        quantity = quantity - 1;
                                        controller.lineItems[index] =
                                            controller.lineItems[index].copyWith.quantity(quantity);
                                        controller.update();
                                      }
                                    }
                                  : null,
                              selectedRegion: controller.selectedRegion,
                            );
                          }),
                    if (lineItems.isNotEmpty && customLineItems.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            Text('Custom Items', style: smallTextStyle?.copyWith(color: lightWhite)),
                          ],
                        ),
                      ),
                    if (customLineItems.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customLineItems.length,
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          itemBuilder: (context, index) {
                            final customLineItem = customLineItems[index];
                            return CustomVariantListTile(
                              customLineItem,
                              currencyCode: controller.selectedRegion!.currencyCode!,
                              onDelete: () {
                                controller.customLineItems.removeAt(index);
                                controller.update();
                              },
                              onAddTap: () {
                                controller.customLineItems[index] = controller.customLineItems
                                    .elementAt(index)
                                    .copyWith(quantity: customLineItems[index].quantity! + 1);
                                controller.update();
                              },
                              onRemoveTap: customLineItems[index].quantity! > 1
                                  ? () {
                                      if (customLineItems[index].quantity! > 1) {
                                        controller.customLineItems[index] = controller.customLineItems[index].copyWith
                                            .quantity(customLineItems[index].quantity! - 1);
                                        controller.update();
                                      }
                                    }
                                  : null,
                            );
                          }),
                    const Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdaptiveButton(
                              onPressed: controller.selectedRegion != null
                                  ? () async {
                                      final result = await showBarModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return AddCustomItemView(
                                                currencyCode: controller.selectedRegion?.currencyCode);
                                          });
                                      if (result is LineItem) {
                                        controller.customLineItems.add(result);
                                        controller.update();
                                      }
                                    }
                                  : null,
                              child: const Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Add Custom'),
                                ],
                              )),
                          AdaptiveButton(
                            onPressed: () async => addItems(),
                            child: const Row(
                              children: [
                                Icon(Icons.add),
                                Text('Add Existing'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            space,
            if (controller.selectedRegion != null)
              ChooseShippingOptionView(
                region: controller.selectedRegion!,
                onShippingOptionChanged: (shippingOption) {
                  if (shippingOption != null) {
                    controller.selectedShippingOption = shippingOption;
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
