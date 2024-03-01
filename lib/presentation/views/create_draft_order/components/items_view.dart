import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/extension/copy_with_line_item.dart';
import 'package:medusa_admin/domain/use_case/region/regions_use_case.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'add_custom_item_view.dart';
import 'choose_shipping_option.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

import 'pick_product_variants/controllers/pick_product_variants_controller.dart';
import 'variant_list_tile.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class CreateDraftOrderItemsView extends StatefulWidget {
  const CreateDraftOrderItemsView({super.key, this.onSaved});
  final void Function(
    List<LineItem> lineItems,
    List<LineItem> customLineItems,
    Region selectedRegion,
    ShippingOption selectedShippingOption,
  )? onSaved;
  @override
  State<CreateDraftOrderItemsView> createState() =>
      _CreateDraftOrderItemsViewState();
}

class _CreateDraftOrderItemsViewState extends State<CreateDraftOrderItemsView> {
  late Future<Result<UserRegionsRes, Failure>> regionsFuture;

  @override
  void initState() {
    regionsFuture = fetchRegions();
    super.initState();
  }

  Future<Result<UserRegionsRes, Failure>> fetchRegions() async {
    return await RegionCrudUseCase.instance.loadAll();
  }

  final expansionController = FlexExpansionTileController();
  List<LineItem> lineItems = [];
  List<LineItem> customLineItems = [];
  Region? selectedRegion;
  ShippingOption? selectedShippingOption;

  Future<void> addItems(FormFieldState<List<LineItem>> field) async {
    final result = await context.pushRoute(PickProductVariantsRoute(
        selectProductsReq: SelectProductsReq(
            selectedProducts: lineItems.map((e) => e.variant!).toList())));
    if (result is! SelectProductsRes) {
      return;
    }
    final variants = result.selectedProductVariants;
    if (variants?.isEmpty ?? true) {
      return;
    }

    if (lineItems.isEmpty) {
      for (var variant in variants!) {
        lineItems.add(LineItem(
          variantId: variant.id,
          variant: variant,
          quantity: 1,
        ));
      }
    } else {
      // Checking if there's any variants got removed and remove them
      lineItems.retainWhere((element) => variants!.contains(element.variant));
      var newItems = variants;
      newItems!.removeWhere((element) =>
          lineItems.map((e) => e.variantId).toList().contains(element.id));
      for (var element in newItems) {
        lineItems.add(
            LineItem(variantId: element.id, variant: element, quantity: 1));
      }
    }

    setState(() {});
    field.didChange(lineItems);
  }

  void onRegionChanged(Region? region) {
    // if the selected region is the same then just return
    if (selectedRegion?.id == region?.id) {
      return;
    }
    setState(() {
      selectedRegion = region;
    });
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);

    return Column(
      children: [
        FutureBuilder<Result<UserRegionsRes, Failure>>(
            future: regionsFuture,
            builder: (context, asyncSnapshot) {
              final result = asyncSnapshot.data;
              switch (asyncSnapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Skeletonizer(
                    enabled: true,
                    child: LabeledTextField(
                      label: 'Choose region',
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'North America',
                        suffixIcon: Icon(Icons.add),
                      ),
                    ),
                  );
                case ConnectionState.done:
                  if (result == null) {
                    return const SizedBox();
                  }
                  return result.when((success) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choose region', style: smallTextStyle),
                        space,
                        DropdownButtonFormField<Region>(
                          style: context.bodyMedium,
                          validator: (val) {
                            if (val == null) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          items: success.regions!
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.name!)))
                              .toList(),
                          hint: const Text('Region'),
                          onChanged: onRegionChanged,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                          ),
                        ),
                      ],
                    );
                  }, (error) {
                    return Center(
                        child: Text('Error loading regions, ${error.message}'));
                  });
              }
            }),
        space,
        ChooseShippingOptionView(
          region: selectedRegion,
          onShippingOptionChanged: (shippingOption) {
            if (shippingOption != null) {
              selectedShippingOption = shippingOption;
            }
          },
        ),
        space,
        FormField<List<LineItem>>(
          onSaved: (val) {
            if (selectedRegion != null && selectedShippingOption != null) {
              widget.onSaved?.call(lineItems, customLineItems, selectedRegion!,
                  selectedShippingOption!);
            }
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              if (!expansionController.isExpanded) {
                expansionController.expand();
              }
              return 'At least one item is required';
            }
            return null;
          },
          builder: (FormFieldState<List<LineItem>> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlidableAutoCloseBehavior(
                  child: FlexExpansionTile(
                    controller: expansionController,
                    childPadding: EdgeInsets.zero,
                    title: const Text('Order items'),
                    child: Column(
                      children: [
                        if (lineItems.isEmpty && customLineItems.isEmpty)
                          Column(
                            children: [
                              Text('No items has been added yet',
                                  style: smallTextStyle),
                              space,
                            ],
                          ),
                        if (lineItems.isNotEmpty || customLineItems.isNotEmpty)
                          Text('Slide left to delete a variant',
                              style: smallTextStyle?.copyWith(color: manatee)),
                        if (lineItems.isNotEmpty)
                          ListView.builder(
                              itemCount: lineItems.length,
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 4.0, 0.0, 4.0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final lineItem = lineItems[index];
                                return VariantListTile(
                                  lineItem,
                                  onDelete: () {
                                    lineItems.removeAt(index);
                                    field
                                        .didChange(lineItems + customLineItems);
                                    setState(() {});
                                  },
                                  onAddTap: () {
                                    var quantity = lineItems[index].quantity;
                                    quantity = quantity! + 1;
                                    lineItems[index] = lineItems
                                        .elementAt(index)
                                        .copyWith(quantity: quantity);
                                    field
                                        .didChange(lineItems + customLineItems);
                                    setState(() {});
                                  },
                                  onRemoveTap: lineItem.quantity! > 1
                                      ? () {
                                          var quantity =
                                              lineItems[index].quantity;
                                          if (quantity! > 1) {
                                            quantity = quantity - 1;
                                            lineItems[index] = lineItems[index]
                                                .copyWith(quantity: quantity);
                                          }
                                          field.didChange(
                                              lineItems + customLineItems);
                                          setState(() {});
                                        }
                                      : null,
                                  selectedRegion: selectedRegion,
                                );
                              }),
                        if (lineItems.isNotEmpty && customLineItems.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(),
                                Text('Custom Items',
                                    style: smallTextStyle?.copyWith(
                                        color: manatee)),
                              ],
                            ),
                          ),
                        if (customLineItems.isNotEmpty)
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: customLineItems.length,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              itemBuilder: (context, index) {
                                final customLineItem = customLineItems[index];
                                return CustomVariantListTile(
                                  customLineItem,
                                  currencyCode: selectedRegion!.currencyCode!,
                                  onDelete: () {
                                    customLineItems.removeAt(index);
                                    field
                                        .didChange(lineItems + customLineItems);
                                    setState(() {});
                                  },
                                  onAddTap: () {
                                    customLineItems[index] = customLineItems
                                        .elementAt(index)
                                        .copyWith(
                                            quantity: customLineItems[index]
                                                    .quantity! +
                                                1);
                                    field
                                        .didChange(lineItems + customLineItems);
                                    setState(() {});
                                  },
                                  onRemoveTap: customLineItems[index]
                                              .quantity! >
                                          1
                                      ? () {
                                          if (customLineItems[index].quantity! >
                                              1) {
                                            customLineItems[index] =
                                                customLineItems[index].copyWith(
                                                    quantity:
                                                        customLineItems[index]
                                                                .quantity! -
                                                            1);
                                          }
                                          field.didChange(
                                              lineItems + customLineItems);
                                          setState(() {});
                                        }
                                      : null,
                                );
                              }),
                        const Divider(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: selectedRegion != null
                                    ? () async {
                                        final result =
                                            await showBarModalBottomSheet(
                                                context: context,
                                                backgroundColor: context.theme
                                                    .scaffoldBackgroundColor,
                                                overlayStyle: context
                                                    .theme
                                                    .appBarTheme
                                                    .systemOverlayStyle,
                                                builder: (context) {
                                                  return AddCustomItemView(
                                                      currencyCode:
                                                          selectedRegion
                                                              ?.currencyCode);
                                                });
                                        if (result is LineItem) {
                                          customLineItems.add(result);
                                          field.didChange(
                                              lineItems + customLineItems);
                                          setState(() {});
                                        }
                                      }
                                    : null,
                                child: const Row(
                                  children: [
                                    Icon(Icons.add),
                                    Text('Add Custom'),
                                  ],
                                )),
                            TextButton(
                              onPressed: () async => addItems(field),
                              child: const Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Add Existing'),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (field.hasError)
                  Column(
                    children: [
                      const Gap(5.0),
                      Row(
                        children: [
                          const Gap(10.0),
                          Text(field.errorText!,
                              style: context.bodySmall
                                  ?.copyWith(color: Colors.redAccent)),
                        ],
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
