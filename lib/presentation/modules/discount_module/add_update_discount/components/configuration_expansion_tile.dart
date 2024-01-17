import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';

import '../../../../widgets/adaptive_date_picker.dart';

import '../controllers/add_update_discount_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ConfigurationExpansionTile extends GetView<AddUpdateDiscountController> {
  const ConfigurationExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);

    return GetBuilder<AddUpdateDiscountController>(
        id: 2,
        builder: (controller) {
          final disableStartDate = controller.updateMode && controller.discount?.startsAt !=null ;
          return FlexExpansionTile(
            key: controller.configKey,
            controller: controller.configTileController,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await controller.configKey.currentContext.ensureVisibility();
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Configuration',
                style: Theme.of(context).textTheme.bodyLarge),
            // expandedAlignment: Alignment.centerLeft,
            childPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Discount code applies from you hit the publish button and forever if left untouched.',
                  style: smallTextStyle!.copyWith(color: manatee),
                ),
                IgnorePointer(
                  ignoring: disableStartDate,
                  child: Opacity(
                    opacity:disableStartDate? 0.5 : 1.0,
                    child: Column(
                      children: [
                        space,
                        SwitchListTile.adaptive(
                          contentPadding: EdgeInsets.zero,
                          value: controller.hasStartDate,
                          onChanged: (val) async {
                            controller.hasStartDate = val;
                            controller.update([2]);
                            if (!val) {
                              controller.startDate = null;
                            } else {
                              await controller.configKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                          title: const Text('Start date'),
                          subtitle: Text(
                              'Schedule the discount to activate in the future.',
                              style: TextStyle(color: manatee)),
                        ),
                        halfSpace,
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: controller.hasStartDate
                              ? DateTimeCard(
                            validator: (date) {
                              if (date == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            dateTime: controller.startDate,
                            dateText: 'Start',
                            onTap: () async {
                              await adaptiveDateTimePicker(
                                  date: controller.startDate, context: context)
                                  .then((result) {
                                if (result != null) {
                                  controller.startDate = result;
                                  controller.update([2]);
                                }
                              });
                            },
                          )
                              : const SizedBox.shrink(),
                        ),
                        space,
                      ],
                    ),
                  ),
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Discount has an expiry date?'),
                  subtitle: Text(
                      'Schedule the discount to deactivate in the future.',
                      style: TextStyle(color: manatee)),
                  onChanged: (val) async {
                    controller.hasEndDate = val;
                    controller.update([2]);
                    if (!val) {
                      controller.endDate = null;
                    } else {
                      await controller.configKey.currentContext
                          .ensureVisibility();
                    }
                  },
                  value: controller.hasEndDate,
                ),
                halfSpace,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.hasEndDate
                      ? DateTimeCard(
                    validator: (date) {
                      if (date == null) {
                        return 'Required';
                      }
                      return null;
                    },
                    dateTime: controller.endDate,
                    dateText: 'Expiry',
                    onTap: () async {
                      await adaptiveDateTimePicker(
                          date: controller.endDate, context: context)
                          .then((result) {
                        if (result != null) {
                          controller.endDate = result;
                          controller.update([2]);
                        }
                      });
                    },
                  )
                      : const SizedBox.shrink(),
                ),
                space,
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Limit the number of redemptions?'),
                  subtitle: Text(
                      'Limit applies across all customers, not per customer.',
                      style: TextStyle(color: manatee)),
                  value: controller.hasLimit,
                  onChanged: (val) async {
                    controller.hasLimit = val;
                    controller.update([2]);
                    if (!val) {
                      controller.limitCtrl.clear();
                    } else {
                      await controller.configKey.currentContext
                          .ensureVisibility();
                    }
                  },
                ),
                halfSpace,
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.hasLimit
                      ? Row(
                    children: [
                      Flexible(
                        child: LabeledNumericTextField(
                          label: 'Number of redemptions',
                          controller: controller.limitCtrl,
                          hintText: '...',
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
            ),
          );
        });
  }
}
