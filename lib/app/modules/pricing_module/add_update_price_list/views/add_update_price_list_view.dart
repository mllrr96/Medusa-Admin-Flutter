import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/discount_module/add_update_discount/components/config_switch_tile.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_date_picker.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/date_time_card.dart';
import '../../../components/pick_products/controllers/pick_products_controller.dart';
import '../components/index.dart';
import '../controllers/add_update_price_list_controller.dart';

class AddUpdatePriceListView extends GetView<AddUpdatePriceListController> {
  const AddUpdatePriceListView({Key? key}) : super(key: key);
  static const kDuration = Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
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
            title: Row(
              children: [
                Text('Price list type', style: Theme.of(context).textTheme.bodyLarge),
                Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
              ],
            ),
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
            title: Row(
              children: [
                Text('General', style: Theme.of(context).textTheme.bodyLarge),
                Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
              ],
            ),
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
                controller: TextEditingController(),
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
                controller: TextEditingController(),
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
            title: Text('Configuration', style: Theme.of(context).textTheme.bodyLarge),
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
                tileValue: controller.priceList.customerGroups != null,
                onChanged: (val) async {
                  if (val) {
                    controller.priceList = controller.priceList.copyWith.customerGroups([]);
                    controller.update([2]);
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  } else {
                    controller.priceList = controller.priceList.copyWith.customerGroups(null);
                    controller.update([2]);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: kDuration,
                  child: controller.priceList.customerGroups != null
                      ? LabeledTextField(
                          key: const Key('group'), label: 'Customer Groups', controller: TextEditingController())
                      : const SizedBox.shrink(key: Key('noGroup')))
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
            title: Row(
              children: [
                Text('Prices', style: Theme.of(context).textTheme.bodyLarge),
                Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
              ],
            ),
            expandedAlignment: Alignment.centerLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'You will be able to override the prices for the products you add here',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              AdaptiveButton(
                  onPressed: () => Get.toNamed(Routes.PICK_PRODUCTS, arguments: PickProductsReq(
                    includeVariantCount: true,
                  )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (Platform.isIOS) const Icon(CupertinoIcons.add),
                      if (Platform.isAndroid) const Icon(Icons.add),
                      const SizedBox(width: 6.0),
                      const Text('Add Products Manually'),
                    ],
                  ))
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
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  children: [
                    buildPriceListType(),
                    space,
                    buildGeneral(),
                    space,
                    buildConfig(),
                    space,
                    buildPrices(),
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
