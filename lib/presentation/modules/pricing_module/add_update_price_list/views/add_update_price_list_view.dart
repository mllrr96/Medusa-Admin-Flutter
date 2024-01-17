import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/update_price_list_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/adaptive_date_picker.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/controllers/pick_groups_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/views/pick_groups_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/index.dart';
import '../controllers/add_update_price_list_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

@RoutePage()
class AddUpdatePriceListView extends StatelessWidget {
  const AddUpdatePriceListView({super.key, this.id});
  final String? id;
  static const kDuration = Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);

    Widget buildPriceListType() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 0,
        builder: (controller) {
          return FlexExpansionTile(
              key: controller.priceListTypeKey,
              initiallyExpanded: true,
              onExpansionChanged: (expanded) async {
                if (expanded) {
                  await controller.priceListTypeKey.currentContext
                      .ensureVisibility();
                } else {
                  context.unfocus();
                }
              },
              title: const Text('Price List Type'),
              childPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select the type of the price list',
                    style: smallTextStyle!.copyWith(color: manatee),
                  ),
                  space,
                  PriceListTypeCard(
                    priceListType: PriceListType.sale,
                    groupValue: controller.priceList.type,
                    onTap: (val) {
                      controller.priceList =
                          controller.priceList.copyWith(type: val);
                      controller.update([0]);
                    },
                  ),
                  space,
                  PriceListTypeCard(
                    priceListType: PriceListType.override,
                    groupValue: controller.priceList.type,
                    onTap: (val) {
                      controller.priceList =
                          controller.priceList.copyWith(type: val);
                      controller.update([0]);
                    },
                  ),
                  halfSpace,
                ],
              ));
        },
      );
    }

    Widget buildGeneral() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 1,
        builder: (controller) {
          return FlexExpansionTile(
            key: controller.generalKey,
            controller: controller.generalController,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await controller.generalKey.currentContext.ensureVisibility();
              } else {
                context.unfocus();
              }
            },
            title: const Text('General'),
            childPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General information for the price list.',
                  style: smallTextStyle!.copyWith(color: manatee),
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
            ),
          );
        },
      );
    }

    Widget buildConfig() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 2,
        builder: (controller) {
          return FlexExpansionTile(
              key: controller.configKey,
              controller: controller.configController,
              maintainState: true,
              onExpansionChanged: (expanded) async {
                if (expanded) {
                  await controller.configKey.currentContext.ensureVisibility();
                } else {
                  context.unfocus();
                }
              },
              title: const Text('Configuration'),
              childPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The price overrides apply from the time you hit the publish button and forever if left untouched.',
                    style: smallTextStyle!.copyWith(color: manatee),
                  ),
                  space,
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Price overrides has a start date?'),
                    subtitle: Text(
                        'Schedule the price overrides to activate in the future.',
                        style: TextStyle(color: manatee)),
                    value: controller.priceList.startsAt != null,
                    onChanged: (val) async {
                      if (val) {
                        controller.priceList = controller.priceList.copyWith
                            .startsAt(DateTime.now());
                        controller.update([2]);
                        await controller.configKey.currentContext
                            .ensureVisibility();
                      } else {
                        controller.priceList =
                            controller.priceList.copyWith.startsAt(null);
                        controller.update([2]);
                      }
                    },
                  ),
                  halfSpace,
                  AnimatedSwitcher(
                      duration: kDuration,
                      child: controller.priceList.startsAt != null
                          ? DateTimeCard(
                              validator: (date) {
                                if (date == null) {
                                  return 'Required';
                                }
                                return null;
                              },
                              onTap: () async {
                                final result = await adaptiveDateTimePicker(
                                    date: controller.priceList.startsAt,
                                    context: context);
                                if (result != null) {
                                  controller.priceList = controller
                                      .priceList.copyWith
                                      .startsAt(result);
                                  controller.update([2]);
                                }
                              },
                              dateTime: controller.priceList.startsAt,
                              dateText: 'Start',
                            )
                          : const SizedBox.shrink()),
                  space,
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Price overrides has a expiry date?'),
                    subtitle: Text(
                        'Schedule the price overrides to deactivate in the future.',
                        style: TextStyle(color: manatee)),
                    value: controller.priceList.endsAt != null,
                    onChanged: (val) async {
                      if (val) {
                        controller.priceList = controller.priceList.copyWith
                            .endsAt(
                                DateTime.now().add(const Duration(days: 7)));
                        controller.update([2]);
                        await controller.configKey.currentContext
                            .ensureVisibility();
                      } else {
                        controller.priceList =
                            controller.priceList.copyWith.endsAt(null);
                        controller.update([2]);
                      }
                    },
                  ),
                  halfSpace,
                  AnimatedSwitcher(
                      duration: kDuration,
                      child: controller.priceList.endsAt != null
                          ? DateTimeCard(
                              validator: (date) {
                                if (date == null) {
                                  return 'Required';
                                }
                                return null;
                              },
                              onTap: () async {
                                final result = await adaptiveDateTimePicker(
                                    date: controller.priceList.endsAt,
                                    context: context);
                                if (result != null) {
                                  controller.priceList = controller
                                      .priceList.copyWith
                                      .endsAt(result);
                                  controller.update([2]);
                                }
                              },
                              dateTime: controller.priceList.endsAt,
                              dateText: 'Expiry')
                          : const SizedBox.shrink()),
                  space,
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Customer availability'),
                    subtitle: Text(
                        'Specify which customer groups the price overrides should apply for.',
                        style: TextStyle(color: manatee)),
                    value: controller.specifyCustomers,
                    onChanged: (val) async {
                      if (val) {
                        controller.specifyCustomers = val;
                        controller.update([2]);
                        await controller.configKey.currentContext
                            .ensureVisibility();
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
                                    backgroundColor: context.theme.scaffoldBackgroundColor,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) => PickGroupsView(
                                        pickGroupsReq: PickGroupsReq(
                                            multipleSelect: true,
                                            selectedGroups: controller
                                                .priceList.customerGroups)));
                                if (result is List<CustomerGroup>) {
                                  controller.priceList = controller
                                      .priceList.copyWith
                                      .customerGroups(result);
                                  controller.groupCtrl.text = result
                                      .map((e) => e.name)
                                      .toList()
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(']', '');
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
                                suffixIcon: controller.priceList.customerGroups
                                            ?.isEmpty ??
                                        true
                                    ? const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                    : IconButton(
                                        onPressed: () {
                                          controller.priceList = controller
                                              .priceList.copyWith
                                              .customerGroups(null);
                                          controller.groupCtrl.clear();
                                          controller.update([2]);
                                        },
                                        icon: const Icon(CupertinoIcons
                                            .clear_circled_solid)),
                                filled: true,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink())
                ],
              ));
        },
      );
    }

    Widget buildPrices() {
      return GetBuilder<AddUpdatePriceListController>(
        id: 3,
        builder: (controller) {
          return FlexExpansionTile(
            key: controller.pricesKey,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await controller.pricesKey.currentContext.ensureVisibility();
              } else {
                context.unfocus();
              }
            },
            title: const Text('Prices'),
            childPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You will be able to override the prices for the products you add here',
                    style: smallTextStyle!.copyWith(color: manatee),
                  ),
                  space,
                  ...controller.products.map((product) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            onTap: () async {
                              await showModalActionSheet<int>(
                                  title: 'Manage Product',
                                  message: product.title ?? '',
                                  context: context,
                                  actions: <SheetAction<int>>[
                                    const SheetAction(
                                        label: 'Edit prices', key: 0),
                                    const SheetAction(
                                        label: 'Remove',
                                        isDestructiveAction: true,
                                        key: 1),
                                  ]).then((result) async {
                                switch (result) {
                                  case 0:
                                    final result =
                                        await showBarModalBottomSheet(
                                          backgroundColor: context.theme.scaffoldBackgroundColor,
                                          overlayStyle: context
                                          .theme.appBarTheme.systemOverlayStyle,
                                      context: context,
                                      builder: (context) =>
                                          AddUpdateVariantsPriceView(
                                              product: product,
                                              prices:
                                                  controller.priceList.prices),
                                    );
                                    if (result is List<MoneyAmount>) {
                                      final originalPrices =
                                          controller.priceList.prices ?? [];
                                      controller.priceList = controller
                                          .priceList.copyWith
                                          .prices(result + originalPrices);
                                      controller.update([3]);
                                    }
                                    return;
                                  case 1:
                                    controller.products.removeWhere(
                                        (element) => element.id == product.id);
                                    controller.update([3]);
                                    return;
                                }
                              });
                            },
                            child: Ink(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12.0),
                              // margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.title ?? '',
                                      style: smallTextStyle),
                                  const Icon(Icons.more_horiz)
                                ],
                              ),
                            ),
                          ),
                          const Gap(6.0),
                          if (product.variants != null &&
                              product.variants!.isNotEmpty &&
                              controller.priceList.prices != null)
                            ...product.variants!.map((e) {
                              final priceCount = controller.priceList.prices!
                                  .where((element) => element.variantId == e.id)
                                  .toList()
                                  .length;
                              if (priceCount == 0) {
                                return const SizedBox.shrink();
                              }
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                margin: const EdgeInsets.only(
                                    bottom: 10.0, left: 14),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(e.title ?? '', style: smallTextStyle),
                                    if (controller.priceList.prices != null)
                                      Text(
                                          '${priceCount == 0 ? 'Add' : priceCount} prices',
                                          style: smallTextStyle),
                                  ],
                                ),
                              );
                            }),
                        ],
                      )),
                  space,
                  TextButton(
                    onPressed: () async {
                      final result = await context.pushRoute(PickProductsRoute(
                          pickProductsReq:
                              PickProductsReq(includeVariantCount: true)));
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
                ]),
          );
        },
      );
    }

    return GetBuilder<AddUpdatePriceListController>(
      init: AddUpdatePriceListController(
          updatePriceListUseCase: UpdatePriceListUseCase.instance, id: id),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              leading: const CloseButton(),
              title: controller.updateMode
                  ? const Text('Update price list')
                  : const Text('Create price list'),
              actions: [
                TextButton(
                  onPressed: () async => controller.updateMode
                      ? await controller.updatePriceList(context)
                      : await controller.create(context),
                  child: controller.updateMode
                      ? const Text('Update')
                      : const Text('Create'),
                )
              ],
            ),
            body: SafeArea(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                children: [
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    value: controller.saveAsDraft,
                    onChanged: (val) {
                      controller.saveAsDraft = val;
                      controller.update();
                    },
                    title: controller.updateMode
                        ? const Text('Unpublish')
                        : const Text('Save as draft'),
                  ),
                  const Divider(),
                  buildPriceListType(),
                  space,
                  Form(key: controller.generalFormKey, child: buildGeneral()),
                  space,
                  Form(key: controller.configFormKey, child: buildConfig()),
                  space,
                  buildPrices(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
