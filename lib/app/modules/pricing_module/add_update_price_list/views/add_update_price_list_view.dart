import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/components/pick_groups/views/pick_groups_view.dart';
import 'package:medusa_admin/app/modules/discount_module/add_update_discount/components/config_switch_tile.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_date_picker.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/date_time_card.dart';
import '../../../components/pick_groups/controllers/pick_groups_controller.dart';
import '../../../components/pick_products/controllers/pick_products_controller.dart';
import '../components/index.dart';
import '../controllers/add_update_price_list_controller.dart';

class AddUpdatePriceListView extends GetView<AddUpdatePriceListController> {
  const AddUpdatePriceListView({Key? key}) : super(key: key);
  static const kDuration = Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const halfSpace = SizedBox(height: 6.0);
    const space = SizedBox(height: 12.0);
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQuery.padding.top - 56;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: kDuration, curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: kDuration, curve: Curves.fastOutSlowIn);
        }
      });
    }

    Widget buildPriceListType() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 0,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.priceListTypeKey,
            initiallyExpanded: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.priceListTypeKey);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            label: 'Price List Type',
            required: true,
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'Select the type of the price list',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              PriceListTypeCard(
                priceListType: PriceListType.sale,
                groupValue: controller.priceList.type,
                onTap: (val) {
                  controller.priceList = controller.priceList.copyWith(type: val);
                  controller.update([0]);
                },
              ),
              space,
              PriceListTypeCard(
                priceListType: PriceListType.override,
                groupValue: controller.priceList.type,
                onTap: (val) {
                  controller.priceList = controller.priceList.copyWith(type: val);
                  controller.update([0]);
                },
              ),
              halfSpace,
            ],
          );
        },
      );
    }

    Widget buildGeneral() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 1,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.generalKey,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.generalKey);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            label: 'General',
            required: true,
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'General information for the price list.',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              LabeledTextField(
                label: 'Name',
                controller: controller.nameCtrl,
                required: true,
                hintText: 'B2B, Black Friday...',
                validator: (val) {
                  if (val == null || val.removeAllWhitespace.isEmpty) {
                    return 'Price list must have a name';
                  }
                  return null;
                },
              ),
              LabeledTextField(
                label: 'Description',
                controller: controller.descriptionCtrl,
                required: true,
                hintText: 'For our business partners',
                validator: (val) {
                  if (val == null || val.removeAllWhitespace.isEmpty) {
                    return 'Price list must have a description';
                  }
                  return null;
                },
              ),
            ],
          );
        },
      );
    }

    Widget buildConfig() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 2,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.configKey,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.configKey);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            label: 'Configuration',
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'The price overrides apply from the time you hit the publish button and forever if left untouched.',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              ConfigSwitchTile(
                title: 'Price overrides has a start date?',
                subtitle: 'Schedule the price overrides to activate in the future.',
                tileValue: controller.priceList.startsAt != null,
                onChanged: (val) async {
                  if (val) {
                    controller.priceList = controller.priceList.copyWith.startsAt(DateTime.now());
                    controller.update([2]);
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  } else {
                    controller.priceList = controller.priceList.copyWith.startsAt(null);
                    controller.update([2]);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: kDuration,
                  child: controller.priceList.startsAt != null
                      ? DateTimeCard(
                          onTap: () async {
                            final result =
                                await adaptiveDateTimePicker(date: controller.priceList.startsAt, context: context);
                            if (result != null) {
                              controller.priceList = controller.priceList.copyWith.startsAt(result);
                              controller.update([2]);
                            }
                          },
                          key: const Key('start'),
                          dateTime: controller.priceList.startsAt,
                          dateText: 'Start')
                      : const SizedBox.shrink(
                          key: Key('noStart'),
                        )),
              space,
              ConfigSwitchTile(
                title: 'Price overrides has a expiry date?',
                subtitle: 'Schedule the price overrides to deactivate in the future.',
                tileValue: controller.priceList.endsAt != null,
                onChanged: (val) async {
                  if (val) {
                    controller.priceList = controller.priceList.copyWith.endsAt(DateTime.now());
                    controller.update([2]);
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  } else {
                    controller.priceList = controller.priceList.copyWith.endsAt(null);
                    controller.update([2]);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: kDuration,
                  child: controller.priceList.endsAt != null
                      ? DateTimeCard(
                          onTap: () async {
                            final result =
                                await adaptiveDateTimePicker(date: controller.priceList.endsAt, context: context);
                            if (result != null) {
                              controller.priceList = controller.priceList.copyWith.endsAt(result);
                              controller.update([2]);
                            }
                          },
                          key: const Key('expiry'),
                          dateTime: controller.priceList.startsAt,
                          dateText: 'Expiry')
                      : const SizedBox.shrink(
                          key: Key('noExpiry'),
                        )),
              space,
              ConfigSwitchTile(
                title: 'Customer availability',
                subtitle: 'Specify which customer groups the price overrides should apply for.',
                tileValue: controller.specifyCustomers,
                onChanged: (val) async {
                  if (val) {
                    controller.specifyCustomers = val;
                    controller.update([2]);
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  } else {
                    controller.specifyCustomers = val;
                    controller.update([2]);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: kDuration,
                  child: controller.specifyCustomers
                      ? LabeledTextField(
                          validator: (val) {
                            if (!controller.specifyCustomers) {
                              return null;
                            }
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            final result = await showBarModalBottomSheet(
                                context: context,
                                builder: (context) => PickGroupsView(
                                    pickGroupsReq: PickGroupsReq(
                                        multipleSelect: true, selectedGroups: controller.priceList.customerGroups)));
                            if (result is List<CustomerGroup>) {
                              controller.priceList = controller.priceList.copyWith.customerGroups(result);
                              controller.groupCtrl.text =
                                  result.map((e) => e.name).toList().toString().replaceAll('[', '').replaceAll(']', '');
                              controller.update([2]);
                            }
                          },
                          label: 'Customer Groups',
                          controller: controller.groupCtrl,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: 'Select group(s)',
                            suffixIcon: controller.priceList.customerGroups?.isEmpty ?? true
                                ? const Icon(Icons.keyboard_arrow_down_outlined)
                                : AdaptiveIcon(
                                    onPressed: () {
                                      controller.priceList = controller.priceList.copyWith.customerGroups(null);
                                      controller.groupCtrl.clear();
                                      controller.update([2]);
                                    },
                                    icon: const Icon(CupertinoIcons.clear_circled_solid)),
                            filled: true,
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink())
            ],
          );
        },
      );
    }

    Widget buildPrices() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 3,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.pricesKey,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.pricesKey);
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            label: 'Prices',
            required: true,
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'You will be able to override the prices for the products you add here',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              ...controller.products
                  .map((product) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(Radius.circular(6))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.title ?? '', style: smallTextStyle),
                                AdaptiveIcon(
                                    onPressed: () async {
                                      await showModalActionSheet<int>(
                                          title: 'Manage Product',
                                          message: product.title ?? '',
                                          context: context,
                                          actions: <SheetAction<int>>[
                                            const SheetAction(label: 'Edit prices', key: 0),
                                            const SheetAction(label: 'Remove', isDestructiveAction: true, key: 1),
                                          ]).then((result) async {
                                        switch (result) {
                                          case 0:
                                            // Get.to(()=> ProductPriceList(product: product));
                                            final result = await showBarModalBottomSheet(
                                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                              context: context,
                                              builder: (context) => ProductPriceList(product: product),
                                            );
                                            if (result is List<MoneyAmount>) {
                                              controller.priceList = controller.priceList.copyWith.prices(result);
                                              controller.update([3]);
                                            }
                                            return;
                                          case 1:
                                            return;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.more_horiz))
                              ],
                            ),
                          ),
                          if (product.variants != null && controller.priceList.prices !=null)
                            ...product.variants!.map((e) {
                              final priceCount = controller.priceList.prices!
                                  .where((element) => element.variantId == e.id)
                                  .toList()
                                  .length;
                              return Container(
                                width: Get.width * 0.85,
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.title ?? '', style: smallTextStyle),
                                    if (controller.priceList.prices != null)
                                      Text('${priceCount == 0 ? 'Add' : priceCount} prices', style: smallTextStyle),
                                  ],
                                ),
                              );
                            }).toList(),
                        ],
                      ))
                  .toList(),
              space,
              AdaptiveButton(
                onPressed: () async {
                  final result =
                      await Get.toNamed(Routes.PICK_PRODUCTS, arguments: PickProductsReq(includeVariantCount: true));
                  if (result is PickProductsRes) {
                    controller.products = result.selectedProducts;
                    controller.update([3]);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (Platform.isIOS) const Icon(CupertinoIcons.add),
                    if (Platform.isAndroid) const Icon(Icons.add),
                    const SizedBox(width: 6.0),
                    const Text('Add Products Manually'),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return GetBuilder<AddUpdatePriceListController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: controller.updateMode ? const Text('Update price list') : const Text('Create price list'),
              actions: [
                AdaptiveButton(
                  onPressed: () async =>
                      controller.updateMode ? await controller.updatePriceList() : await controller.create(),
                  child: controller.updateMode ? const Text('Update') : const Text('Create'),
                )
              ],
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  children: [
                    SwitchListTile.adaptive(
                      activeColor: ColorManager.primary,
                      value: controller.saveAsDraft,
                      onChanged: (val) {
                        controller.saveAsDraft = val;
                        controller.update();
                      },
                      title: controller.updateMode ? const Text('Unpublish') : const Text('Save as draft'),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const Divider(),
                    buildPriceListType(),
                    space,
                    buildGeneral(),
                    space,
                    buildConfig(),
                    space,
                    if (!controller.updateMode) buildPrices(),
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
