import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/discount_rule.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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

    final discountType = Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Obx(() {
            return ExpansionTile(
              maintainState: true,
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
                InkWell(
                  onTap: () => controller.discountRuleType.value = DiscountRuleType.percentage,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                            color: controller.discountRuleType.value == DiscountRuleType.percentage
                                ? ColorManager.primary
                                : Colors.transparent)),
                    child: Row(
                      children: [
                        Radio<DiscountRuleType>(
                            value: DiscountRuleType.percentage,
                            groupValue: controller.discountRuleType.value,
                            onChanged: (val) {
                              if (val != null) {
                                controller.discountRuleType.value = val;
                              }
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Percentage', style: mediumTextStyle),
                            Text(
                              'Discount applied in % ',
                              style: smallTextStyle.copyWith(color: lightWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                space,
                InkWell(
                  onTap: () => controller.discountRuleType.value = DiscountRuleType.fixed,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                            color: controller.discountRuleType.value == DiscountRuleType.fixed
                                ? ColorManager.primary
                                : Colors.transparent)),
                    child: Row(
                      children: [
                        Radio<DiscountRuleType>(
                            value: DiscountRuleType.fixed,
                            groupValue: controller.discountRuleType.value,
                            onChanged: (val) {
                              if (val != null) {
                                controller.discountRuleType.value = val;
                              }
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fixed amount', style: mediumTextStyle),
                            Text(
                              'Discount in whole numbers',
                              style: smallTextStyle.copyWith(color: lightWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                space,
                InkWell(
                  onTap: () => controller.discountRuleType.value = DiscountRuleType.freeShipping,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                            color: controller.discountRuleType.value == DiscountRuleType.freeShipping
                                ? ColorManager.primary
                                : Colors.transparent)),
                    child: Row(
                      children: [
                        Radio<DiscountRuleType>(
                            value: DiscountRuleType.freeShipping,
                            groupValue: controller.discountRuleType.value,
                            onChanged: (val) {
                              if (val != null) {
                                controller.discountRuleType.value = val;
                              }
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Free shipping', style: mediumTextStyle),
                            Text(
                              'Override delivery amount',
                              style: smallTextStyle.copyWith(color: lightWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                space,
                if (controller.discountRuleType.value == DiscountRuleType.fixed)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text('Allocation', style: Theme.of(context).textTheme.bodyLarge),
                            Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                          ],
                        ),
                      ),
                      halfSpace,
                      InkWell(
                        onTap: () => controller.allocationType.value = AllocationType.total,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  color: controller.allocationType.value == AllocationType.total
                                      ? ColorManager.primary
                                      : Colors.transparent)),
                          child: Row(
                            children: [
                              Radio<AllocationType>(
                                  value: AllocationType.total,
                                  groupValue: controller.allocationType.value,
                                  onChanged: (val) {
                                    if (val != null) {
                                      controller.allocationType.value = val;
                                    }
                                  }),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total amount', style: mediumTextStyle),
                                  Text(
                                    'Apply to the total amount',
                                    style: smallTextStyle.copyWith(color: lightWhite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      space,
                      InkWell(
                        onTap: () => controller.allocationType.value = AllocationType.item,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  color: controller.allocationType.value == AllocationType.item
                                      ? ColorManager.primary
                                      : Colors.transparent)),
                          child: Row(
                            children: [
                              Radio<AllocationType>(
                                  value: AllocationType.item,
                                  groupValue: controller.allocationType.value,
                                  onChanged: (val) {
                                    if (val != null) {
                                      controller.allocationType.value = val;
                                    }
                                  }),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Item specific', style: mediumTextStyle),
                                  Text(
                                    'Apply to every allowed item.',
                                    style: smallTextStyle.copyWith(color: lightWhite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      space,
                    ],
                  ),
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
            initiallyExpanded: controller.updateMode,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: CustomTextField(
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
                  )),
                  const SizedBox(width: 12.0),
                  if (controller.discountRuleType.value == DiscountRuleType.fixed)
                    Flexible(
                      child: NumericTextField(
                        label: 'Amount',
                        required: true,
                        hintText: '0.00',
                        controller: controller.amountCtrl,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  if (controller.discountRuleType.value == DiscountRuleType.percentage)
                    Flexible(
                      child: NumericTextField(
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
                      ),
                    ),
                ],
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
                            onPressed: () =>
                                controller.showTemplateDiscountInfo.value = !controller.showTemplateDiscountInfo.value,
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
        }),
      ),
    );
    final configuration = Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Obx(() {
          return ExpansionTile(
            maintainState: true,
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
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
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
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
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
        child: ExpansionTile(
          maintainState: true,
          initiallyExpanded: controller.updateMode,
          title: Text('Conditions', style: Theme.of(context).textTheme.bodyLarge),
          expandedAlignment: Alignment.center,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          children: [
            Text(
              'Discount code apply to all products if left untouched.',
              style: smallTextStyle?.copyWith(color: lightWhite),
            ),
            space,
            AdaptiveButton(onPressed: () {}, child: const Text('Add condition'))
          ],
        ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    if(!controller.updateMode)
                    discountType,
                    if(!controller.updateMode)
                      space,
                    general,
                    space,
                    configuration,
                    space,
                    conditions,
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
