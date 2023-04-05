import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../components/currency_formatter.dart';
import '../components/index.dart';
import '../controllers/add_update_discount_controller.dart';

class AddUpdateDiscountView extends GetView<AddUpdateDiscountController> {
  const AddUpdateDiscountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);

    Future<DateTime?> adaptiveDateTimePicker(DateTime? date) async {
      DateTime? selectedDate;
      if (Platform.isIOS) {
        return await showCupertinoModalBottomSheet(
            // isDismissible: false,
            context: context,
            builder: (context) {
              return SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdaptiveButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                        AdaptiveButton(
                            onPressed: () => Get.back(
                                  result: selectedDate ?? date ?? DateTime.now(),
                                ),
                            child: const Text('Done')),
                      ],
                    ),
                    Flexible(
                      child: CupertinoDatePicker(
                        initialDateTime: date,
                        onDateTimeChanged: (DateTime value) {
                          selectedDate = value;
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
      } else {
        return await showDatePicker(
                context: context,
                initialDate: date ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)))
            .then((value) async {
          if (value != null) {
            final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: date?.hour ?? value.hour, minute: date?.minute ?? value.minute));
            if (time != null) {
              return DateTime(value.year, value.month, value.day, time.hour, time.minute);
            }
          }
          return null;
        });
      }
    }

    Future<void> scrollToSelectedContent({required GlobalKey expansionTileKey}) async {
      await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
        final box = expansionTileKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0;
        final scrollPoint = controller.scrollController.offset + yPosition - context.mediaQuery.padding.top - 56;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }

    final discountType = Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Obx(() {
            return ExpansionTile(
              key: controller.discountKey,
              maintainState: true,
              onExpansionChanged: (expanded) async {
                if (expanded) {
                  await scrollToSelectedContent(expansionTileKey: controller.discountKey);
                }
              },
              initiallyExpanded: true,
              title: Row(
                children: [
                  Text('Discount Type', style: Theme.of(context).textTheme.bodyLarge),
                  Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                ],
              ),
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              children: [
                Text(
                  'Select a discount type',
                  style: smallTextStyle!.copyWith(color: lightWhite),
                ),
                halfSpace,
                DiscountTypeCard(
                  discountType: DiscountRuleType.percentage,
                  groupValue: controller.discountRuleType.value,
                  onTap: (val) => controller.discountRuleType.value = val,
                ),
                space,
                DiscountTypeCard(
                  discountType: DiscountRuleType.fixed,
                  groupValue: controller.discountRuleType.value,
                  onTap: (val) => controller.discountRuleType.value = val,
                  disabled: controller.selectedRegions.length > 1,
                ),
                space,
                DiscountTypeCard(
                  discountType: DiscountRuleType.freeShipping,
                  groupValue: controller.discountRuleType.value,
                  onTap: (val) => controller.discountRuleType.value = val,
                ),
                space,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.discountRuleType.value == DiscountRuleType.fixed
                      ? Column(
                          key: const Key('allocation'),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Text('Allocation', style: Theme.of(context).textTheme.bodyLarge),
                                  Text('*',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                                ],
                              ),
                            ),
                            halfSpace,
                            DiscountAllocationTypeDiscount(
                              allocationType: AllocationType.total,
                              groupValue: controller.allocationType.value,
                              onTap: (val) => controller.allocationType.value = val,
                            ),
                            space,
                            DiscountAllocationTypeDiscount(
                              allocationType: AllocationType.item,
                              groupValue: controller.allocationType.value,
                              onTap: (val) => controller.allocationType.value = val,
                            ),
                            space,
                          ],
                        )
                      : const SizedBox.shrink(
                          key: Key('noAllocation'),
                        ),
                )
              ],
            );
          }),
        ));
    final general = Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Obx(() {
            return ExpansionTile(
              key: controller.generalKey,
              initiallyExpanded: controller.updateMode,
              onExpansionChanged: (expanded) async {
                if (expanded) {
                  await scrollToSelectedContent(expansionTileKey: controller.generalKey);
                }
              },
              maintainState: true,
              title: Row(
                children: [
                  Text('General', style: Theme.of(context).textTheme.bodyLarge),
                  Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                ],
              ),
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              children: [
                Row(
                  children: [
                    Text('Choose valid regions', style: mediumTextStyle),
                    Text('*', style: mediumTextStyle?.copyWith(color: Colors.red)),
                  ],
                ),
                halfSpace,
                TextFormField(
                  style: Theme.of(context).textTheme.titleSmall,
                  onTap: () async {
                    await Get.toNamed(Routes.PICK_REGIONS,
                        arguments: PickRegionsReq(
                          multipleSelect: controller.discountRuleType.value == DiscountRuleType.fixed ? false : true,
                          selectedRegions: controller.discountRuleType.value == DiscountRuleType.fixed
                              ? controller.selectedRegions.isNotEmpty
                                  ? [controller.selectedRegions.first]
                                  : []
                              : [...controller.selectedRegions],
                        ))?.then((result) {
                      if (result is PickRegionsRes) {
                        controller.selectedRegions.value = result.regions;
                        if (controller.discountRuleType.value == DiscountRuleType.fixed) {
                          controller.amountCtrl.text = CurrencyTextInputFormatter(
                            name: controller.selectedRegions.first.currencyCode,
                          ).format(controller.amountCtrl.text);
                        }
                      }
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    hintText: controller.selectedRegions.isNotEmpty
                        ? controller.selectedRegions.length == 1
                            ? 'Region'
                            : 'Regions'
                        : 'Select ... ',
                    suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
                    prefixIconConstraints: const BoxConstraints(minWidth: 48 * 1.5),
                    prefixIcon: controller.selectedRegions.isNotEmpty
                        ? Chip(
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            label: Text(controller.selectedRegions.length.toString()),
                            labelStyle: smallTextStyle,
                            side: const BorderSide(color: Colors.transparent),
                          )
                        : null,
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                ),
                space,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.discountRuleType.value == DiscountRuleType.fixed
                      ? NumericTextField(
                          key: const Key('amount'),
                          label: 'Amount',
                          required: true,
                          hintText: '0.00',
                          controller: controller.amountCtrl,
                          onPlusPressed: () {
                            var text = controller.amountCtrl.text;
                            text = text.replaceAll(RegExp(r'[^0-9]'), '');
                            var val = int.tryParse(text);
                            val ??= 0;
                            controller.amountCtrl.text = CurrencyTextInputFormatter(
                              name: controller.selectedRegions.first.currencyCode,
                            ).format((val + 1).toString());
                          },
                          onMinusPressed: () {
                            var text = controller.amountCtrl.text;
                            text = text.replaceAll(RegExp(r'[^0-9]'), '');
                            var val = int.tryParse(text);
                            val ??= 0;
                            if (val == 0) {
                              return;
                            }
                            controller.amountCtrl.text = CurrencyTextInputFormatter(
                              name: controller.selectedRegions.first.currencyCode,
                            ).format((val - 1).toString());
                          },
                          inputFormatters: [
                            if (controller.selectedRegions.isNotEmpty)
                              CurrencyTextInputFormatter(
                                name: controller.selectedRegions.first.currencyCode,
                              )
                          ],
                          prefixText:
                              '   ${controller.selectedRegions.isNotEmpty ? controller.selectedRegions.first.currencyCode?.toUpperCase() : ''} ',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        )
                      : const SizedBox.shrink(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.discountRuleType.value == DiscountRuleType.percentage
                      ? NumericTextField(
                          key: const Key('percentage'),
                          label: 'Percentage',
                          required: true,
                          prefixText: '  % ',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          hintText: '10',
                          controller: controller.percentageCtrl,
                        )
                      : const SizedBox.shrink(
                          key: Key('noPercentage'),
                        ),
                ),
                space,
                CustomTextField(
                  label: 'Code',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  required: true,
                  controller: controller.codeCtrl,
                  hintText: 'SUMMERSALE10',
                ),
                Text(
                  'The code your customers will enter during checkout. This will appear on your customer’s invoice. \nUppercase letters and numbers only.',
                  style: smallTextStyle!.copyWith(color: lightWhite),
                ),
                space,
                CustomTextField(
                  label: 'Description',
                  controller: controller.descriptionCtrl,
                  required: true,
                  hintText: 'Summer Sale 2022...',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(child: Text('This is a template discount', style: mediumTextStyle)),
                          AdaptiveIcon(
                              onPressed: () => controller.showTemplateDiscountInfo.value =
                                  !controller.showTemplateDiscountInfo.value,
                              icon: Icon(Icons.info_outline, color: lightWhite))
                        ],
                      ),
                    ),
                    Switch.adaptive(
                        activeColor: ColorManager.primary,
                        value: controller.templateDiscount.value,
                        onChanged: (val) => controller.templateDiscount.value = val)
                  ],
                ),
                if (controller.showTemplateDiscountInfo.value)
                  Text(
                    'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.',
                    style: smallTextStyle.copyWith(color: lightWhite),
                  ),
                if (controller.showTemplateDiscountInfo.value) space,
              ],
            );
          })),
    );
    final configuration = Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Obx(() {
          return ExpansionTile(
            key: controller.configKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(expansionTileKey: controller.configKey);
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Configuration', style: Theme.of(context).textTheme.bodyLarge),
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'Discount code applies from you hit the publish button and forever if left untouched.',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start date', style: mediumTextStyle),
                      Text(
                        'Schedule the discount to activate in the future.',
                        style: smallTextStyle.copyWith(color: lightWhite),
                      ),
                    ],
                  ),
                  Switch.adaptive(
                      activeColor: ColorManager.primary,
                      value: controller.hasStartDate.value,
                      onChanged: (val) {
                        controller.hasStartDate.value = val;
                        if (!val) {
                          controller.startDate.value = null;
                        }
                      })
                ],
              ),
              halfSpace,
              if (controller.hasStartDate.value)
                InkWell(
                  onTap: () async {
                    await adaptiveDateTimePicker(controller.startDate.value).then((result) {
                      if (result != null) {
                        controller.startDate.value = result;
                      }
                    });
                  },
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border:
                              Border.all(color: controller.startDate.value != null ? Colors.grey : Colors.transparent)),
                      child: controller.startDate.value == null
                          ? Center(
                              child: Text(
                              'Tap to select start date',
                              style: largeTextStyle?.copyWith(color: lightWhite),
                            ))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start Date', style: mediumTextStyle?.copyWith(color: lightWhite)),
                                    halfSpace,
                                    Text(DateFormat.yMMMEd().format(controller.startDate.value!)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start Time', style: mediumTextStyle?.copyWith(color: lightWhite)),
                                    halfSpace,
                                    Text(DateFormat.jm().format(controller.startDate.value!)),
                                  ],
                                ),
                              ],
                            )),
                ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Discount has an expiry date?', style: mediumTextStyle),
                        Text(
                          'Schedule the discount to deactivate in the future.',
                          style: smallTextStyle.copyWith(color: lightWhite),
                        ),
                      ],
                    ),
                  ),
                  Switch.adaptive(
                    activeColor: ColorManager.primary,
                    value: controller.hasEndDate.value,
                    onChanged: (val) {
                      controller.hasEndDate.value = val;
                      if (!val) {
                        controller.endDate.value = null;
                      }
                    },
                  )
                ],
              ),
              halfSpace,
              if (controller.hasEndDate.value)
                InkWell(
                  onTap: () async {
                    await adaptiveDateTimePicker(controller.endDate.value).then((result) {
                      if (result != null) {
                        controller.endDate.value = result;
                      }
                    });
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(color: controller.endDate.value != null ? Colors.grey : Colors.transparent)),
                    child: controller.endDate.value == null
                        ? Center(
                            child: Text(
                            'Tap to select expiry date',
                            style: largeTextStyle?.copyWith(color: lightWhite),
                          ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expiry Date', style: mediumTextStyle?.copyWith(color: lightWhite)),
                                  halfSpace,
                                  Text(DateFormat.yMMMEd().format(controller.endDate.value!)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expiry Time', style: mediumTextStyle?.copyWith(color: lightWhite)),
                                  halfSpace,
                                  Text(DateFormat.jm().format(controller.endDate.value!)),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Limit the number of redemptions?', style: mediumTextStyle),
                        Text(
                          'Limit applies across all customers, not per customer.',
                          style: smallTextStyle.copyWith(color: lightWhite),
                        ),
                      ],
                    ),
                  ),
                  Switch.adaptive(
                      activeColor: ColorManager.primary,
                      value: controller.hasLimit.value,
                      onChanged: (val) {
                        controller.hasLimit.value = val;
                        if (!val) {
                          controller.limitCtrl.clear();
                        }
                      })
                ],
              ),
              halfSpace,
              if (controller.hasLimit.value)
                Row(
                  children: [
                    Flexible(
                      child: NumericTextField(
                        label: 'Number of redemptions',
                        controller: controller.limitCtrl,
                        hintText: '5',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Flexible(child: SizedBox())
                  ],
                ),
              space,
            ],
          );
        }),
      ),
    );
    final conditions = Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Obx(() {
          return ExpansionTile(
            key: controller.conditionsKey,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(expansionTileKey: controller.conditionsKey);
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Conditions', style: Theme.of(context).textTheme.bodyLarge),
            expandedAlignment: Alignment.center,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              if (controller.discountConditions.isEmpty)
                Text(
                  'Discount code apply to all products if left untouched.',
                  style: smallTextStyle?.copyWith(color: lightWhite),
                ),
              if (controller.discountConditions.isEmpty) space,
              if (controller.discountConditions.isNotEmpty)
                ListView.separated(
                    separatorBuilder: (_, __) => space,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.discountConditions.length,
                    itemBuilder: (context, index) {
                      final condition = controller.discountConditions[index];
                      return DetailedConditionCard(
                        discountCondition: condition,
                        onDeleteTap: () async {
                          controller.discountConditions.remove(condition);
                        },
                      );
                    }),
              if (controller.discountConditions.length < 5)
                AdaptiveButton(
                    onPressed: () async {
                      final result = await Get.toNamed(Routes.DISCOUNT_CONDITIONS,
                          arguments: DiscountConditionReq(
                              discountTypes: controller.discountConditions.map((e) => e.type!).toList()));
                      if (result != null && result is DiscountConditionRes) {
                        controller.discountConditions.add(DiscountCondition(
                          type: result.conditionType,
                          operator: result.operator,
                          products: result.products?.map((e) => e.id!).toList(),
                          productTags: result.productTags?.map((e) => e.id!).toList(),
                          productCollections: result.productCollections?.map((e) => e.id!).toList(),
                          productTypes: result.productTypes?.map((e) => e.id!).toList(),
                        ));
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (Platform.isAndroid) const Icon(Icons.add),
                        if (Platform.isIOS) const Icon(CupertinoIcons.add),
                        const SizedBox(width: 6.0),
                        const Text('Add Condition'),
                      ],
                    ))
            ],
          );
        }),
      ),
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateMode ? const Text('Update discount') : const Text('Create new discount'),
          actions: [
            AdaptiveButton(
                onPressed: () async =>
                    controller.updateMode ? await controller.updateDiscount() : await controller.createDiscount(),
                child: controller.updateMode ? const Text('Update') : const Text('Create')),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    if (!controller.updateMode) discountType,
                    if (!controller.updateMode) space,
                    general,
                    space,
                    configuration,
                    space,
                    if (!controller.updateMode) conditions,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
