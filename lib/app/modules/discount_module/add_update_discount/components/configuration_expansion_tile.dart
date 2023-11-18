import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../components/adaptive_date_picker.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/date_time_card.dart';
import '../../../components/labeled_numeric_text_field.dart';
import '../controllers/add_update_discount_controller.dart';

class ConfigurationExpansionTile extends GetView<AddUpdateDiscountController> {
  const ConfigurationExpansionTile(this.viewContext, {super.key});

  final BuildContext viewContext;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);
    Future<void> scrollToSelectedContent(
        {required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240))
          .then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint = controller.scrollController.offset +
            yPosition -
            (viewContext.mediaQueryPadding.top + kToolbarHeight);
        if (scrollPoint <=
            controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController.animateTo(scrollPoint - 10,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(
              controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        }
      });
    }

    return GetBuilder<AddUpdateDiscountController>(
        id: 2,
        builder: (controller) {
          return CustomExpansionTile(
            key: controller.configKey,
            controller: controller.configTileController,
            maintainState: true,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: controller.configKey);
              }
            },
            initiallyExpanded: controller.updateMode,
            title: Text('Configuration',
                style: Theme.of(context).textTheme.bodyLarge),
            expandedAlignment: Alignment.centerLeft,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            children: [
              Text(
                'Discount code applies from you hit the publish button and forever if left untouched.',
                style: smallTextStyle!.copyWith(color: lightWhite),
              ),
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
                    await scrollToSelectedContent(
                        globalKey: controller.configKey);
                  }
                },
                title: const Text('Start date'),
                subtitle: Text(
                    'Schedule the discount to activate in the future.',
                    style: TextStyle(color: lightWhite)),
              ),
              halfSpace,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.hasStartDate
                    ? DateTimeCard(
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
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Discount has an expiry date?'),
                subtitle: Text(
                    'Schedule the discount to deactivate in the future.',
                    style: TextStyle(color: lightWhite)),
                onChanged: (val) async {
                  controller.hasEndDate = val;
                  controller.update([2]);
                  if (!val) {
                    controller.endDate = null;
                  } else {
                    await scrollToSelectedContent(
                        globalKey: controller.configKey);
                  }
                },
                value: controller.hasEndDate,
              ),
              halfSpace,
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.hasEndDate
                    ? DateTimeCard(
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
                    style: TextStyle(color: lightWhite)),
                value: controller.hasLimit,
                onChanged: (val) async {
                  controller.hasLimit = val;
                  controller.update([2]);
                  if (!val) {
                    controller.limitCtrl.clear();
                  } else {
                    await scrollToSelectedContent(
                        globalKey: controller.configKey);
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
        });
  }
}
