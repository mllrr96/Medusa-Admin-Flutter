import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/app/modules/pick_regions/views/pick_regions_view.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/adaptive_date_picker.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/date_time_card.dart';
import '../../../components/labeled_numeric_text_field.dart';
import '../../discount_conditions/components/condition_card.dart';
import '../../discount_conditions/controllers/discount_conditions_controller.dart';
import '../components/index.dart';
import '../controllers/add_update_discount_controller.dart';

class AddUpdateDiscountView extends GetView<AddUpdateDiscountController> {
  const AddUpdateDiscountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);

    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint =
            controller.scrollController.offset + yPosition - (context.mediaQueryPadding.top + kToolbarHeight);
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
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
                  await scrollToSelectedContent(globalKey: controller.discountKey);
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
                ...DiscountRuleType.values
                    .map((e) => Column(
                          children: [
                            DiscountTypeCard(
                              discountType: e,
                              groupValue: controller.discountRuleType.value,
                              onTap: (val) {
                                if (controller.discountRuleType.value != val) {
                                  controller.discountRuleType.value = val;
                                  controller.formKey.currentState!.reset();
                                }
                              },
                            ),
                            space,
                          ],
                        ))
                    .toList(),
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
                            ...AllocationType.values
                                .map((e) => Column(
                                      children: [
                                        DiscountAllocationTypeDiscount(
                                          allocationType: e,
                                          groupValue: controller.allocationType.value,
                                          onTap: (val) => controller.allocationType.value = val,
                                        ),
                                        space,
                                      ],
                                    ))
                                .toList(),
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
                  await scrollToSelectedContent(globalKey: controller.generalKey);
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
                LabeledTextField(
                  label: controller.discountRuleType.value == DiscountRuleType.fixed
                      ? 'Choose valid region'
                      : 'Choose valid regions',
                  controller: controller.regionCtrl,
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
                            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                            label: Text(controller.selectedRegions.length.toString()),
                            labelStyle: smallTextStyle,
                            side: const BorderSide(color: Colors.grey),
                          )
                        : null,
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                  required: true,
                  readOnly: true,
                  onTap: () async {
                    final regionReq = PickRegionsReq(
                      multipleSelect: controller.discountRuleType.value == DiscountRuleType.fixed ? false : true,
                      selectedRegions: controller.discountRuleType.value == DiscountRuleType.fixed
                          ? controller.selectedRegions.isNotEmpty
                              ? [controller.selectedRegions.first]
                              : []
                          : [...controller.selectedRegions],
                    );
                    await showBarModalBottomSheet(
                        context: context,
                        builder: (context) => PickRegionsView(pickRegionsReq: regionReq)).then((result) {
                      if (result is PickRegionsRes) {
                        controller.selectedRegions.value = result.regions;
                        final regionsName = result.regions.map((e) => e.name).toList();
                        controller.regionCtrl.text = regionsName.toString().replaceAll('[', '').replaceAll(']', '');
                        if (controller.discountRuleType.value == DiscountRuleType.fixed) {
                          controller.amountCtrl.text = CurrencyTextInputFormatter(
                            name: controller.selectedRegions.first.currencyCode,
                          ).format(controller.amountCtrl.text);
                        }
                      }
                    });
                  },
                  validator: (val) {
                    if (controller.selectedRegions.isEmpty) {
                      return 'Select at least one region';
                    }
                    return null;
                  },
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.discountRuleType.value == DiscountRuleType.percentage
                      ? LabeledNumericTextField(
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
                      : controller.discountRuleType.value == DiscountRuleType.fixed
                          ? LabeledNumericTextField(
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
                          : const SizedBox.shrink(
                              key: Key('noPercentage'),
                            ),
                ),
                space,
                LabeledTextField(
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
                LabeledTextField(
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
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.showTemplateDiscountInfo.value
                      ? Text(
                          'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.',
                          key: const Key('template'),
                          style: smallTextStyle.copyWith(color: lightWhite),
                        )
                      : const SizedBox.shrink(
                          key: Key('templateDisabled'),
                        ),
                ),
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
                await scrollToSelectedContent(globalKey: controller.configKey);
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
              ConfigSwitchTile(
                title: 'Start date',
                subtitle: 'Schedule the discount to activate in the future.',
                tileValue: controller.hasStartDate.value,
                onChanged: (val) async {
                  controller.hasStartDate.value = val;
                  if (!val) {
                    controller.startDate.value = null;
                  } else {
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.hasStartDate.value
                    ? DateTimeCard(
                        dateTime: controller.startDate.value,
                        dateText: 'Start',
                        onTap: () async {
                          await adaptiveDateTimePicker(date: controller.startDate.value, context: context)
                              .then((result) {
                            if (result != null) {
                              controller.startDate.value = result;
                            }
                          });
                        },
                      )
                    : const SizedBox.shrink(),
              ),
              space,
              ConfigSwitchTile(
                title: 'Discount has an expiry date?',
                subtitle: 'Schedule the discount to deactivate in the future.',
                tileValue: controller.hasEndDate.value,
                onChanged: (val) async {
                  controller.hasEndDate.value = val;
                  if (!val) {
                    controller.endDate.value = null;
                  } else {
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.hasEndDate.value
                    ? DateTimeCard(
                        dateTime: controller.endDate.value,
                        dateText: 'Expiry',
                        onTap: () async {
                          await adaptiveDateTimePicker(date: controller.endDate.value, context: context).then((result) {
                            if (result != null) {
                              controller.endDate.value = result;
                            }
                          });
                        },
                      )
                    : const SizedBox.shrink(),
              ),
              space,
              ConfigSwitchTile(
                title: 'Limit the number of redemptions?',
                subtitle: 'Limit applies across all customers, not per customer.',
                tileValue: controller.hasLimit.value,
                onChanged: (val) async {
                  controller.hasLimit.value = val;
                  if (!val) {
                    controller.limitCtrl.clear();
                  } else {
                    await scrollToSelectedContent(globalKey: controller.configKey);
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.hasLimit.value
                    ? Row(
                        children: [
                          Flexible(
                            child: LabeledNumericTextField(
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
                      )
                    : const SizedBox.shrink(),
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
                await scrollToSelectedContent(globalKey: controller.conditionsKey);
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
                        await scrollToSelectedContent(globalKey: controller.conditionsKey);
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
          leading: AdaptiveCloseButton(onPressed: () async {
            if (controller.updateMode && !controller.sameDiscount()) {
              await showOkCancelAlertDialog(
                context: context,
                title: 'Discard changes',
                message: 'Are you sure you want to discard changes?',
                okLabel: 'Discard',
                isDestructiveAction: true,
              ).then((result) => result == OkCancelResult.ok ? Get.back() : null);
            } else {
              Get.back();
            }
          }),
          title: controller.updateMode ? const Text('Update discount') : const Text('Create new discount'),
          actions: [
            AdaptiveButton(
                onPressed: () async => controller.updateMode
                    ? await controller.updateDiscount(context)
                    : await controller.createDiscount(context),
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
