import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../data/models/store/discount_rule.dart';
import '../../../components/adaptive_icon.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/labeled_numeric_text_field.dart';
import '../../../components/pick_regions/controllers/pick_regions_controller.dart';
import '../../../components/pick_regions/views/pick_regions_view.dart';
import '../../../components/simple_currency_format.dart';
import '../controllers/add_update_discount_controller.dart';

class GeneralExpansionTile extends GetView<AddUpdateDiscountController> {
  const GeneralExpansionTile(this.viewContext, {super.key});

  final BuildContext viewContext;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final box = globalKey.currentContext?.findRenderObject() as RenderBox?;
        final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0.0;
        final scrollPoint =
            controller.scrollController.offset + yPosition - (viewContext.mediaQueryPadding.top + kToolbarHeight);
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }

    return GetBuilder<AddUpdateDiscountController>(
      id: 1,
      builder: (controller) {
        return CustomExpansionTile(
          key: controller.generalKey,
          controller: controller.generalTileController,
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
              label: controller.discountRuleType == DiscountRuleType.fixed
                  ? 'Choose valid region'
                  : 'Choose valid regions',
              controller: controller.regionCtrl,
              decoration: InputDecoration(
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
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      )
                    : null,
              ),
              required: true,
              readOnly: true,
              onTap: () async {
                final regionReq = PickRegionsReq(
                  multipleSelect: controller.discountRuleType == DiscountRuleType.fixed ? false : true,
                  selectedRegions: controller.discountRuleType == DiscountRuleType.fixed
                      ? controller.selectedRegions.isNotEmpty
                          ? [controller.selectedRegions.first]
                          : []
                      : [...controller.selectedRegions],
                );
                await showBarModalBottomSheet(
                    context: context, builder: (context) => PickRegionsView(pickRegionsReq: regionReq)).then((result) {
                  if (result is PickRegionsRes) {
                    controller.selectedRegions = result.regions;
                    final regionsName = result.regions.map((e) => e.name).toList();
                    controller.regionCtrl.text = regionsName.toString().replaceAll('[', '').replaceAll(']', '');
                    if (controller.discountRuleType == DiscountRuleType.fixed) {
                      controller.amountCtrl.text = formatPrice(
                          int.tryParse(controller.amountCtrl.text.replaceAll(RegExp('[^0-9]'), '')),
                          controller.selectedRegions.first.currencyCode);
                    }
                    controller.update([1]);
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
              child: controller.discountRuleType == DiscountRuleType.percentage
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
                  : controller.discountRuleType == DiscountRuleType.fixed
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
                            controller.amountCtrl.text = formatPrice(
                                val + 1, controller.selectedRegions.first.currencyCode,
                                includeSymbol: false);
                          },
                          onMinusPressed: () {
                            var text = controller.amountCtrl.text;
                            text = text.replaceAll(RegExp(r'[^0-9]'), '');
                            var val = int.tryParse(text);
                            val ??= 0;
                            if (val == 0) {
                              return;
                            }
                            controller.amountCtrl.text = formatPrice(
                                val - 1, controller.selectedRegions.first.currencyCode,
                                includeSymbol: false);
                          },
                          inputFormatters: [
                            if (controller.selectedRegions.isNotEmpty)
                              CurrencyTextInputFormatter(
                                name: controller.selectedRegions.first.currencyCode,
                              )
                          ],
                          prefixText:
                              '   ${controller.selectedRegions.isNotEmpty ? NumberFormat.simpleCurrency(name:controller.selectedRegions.first.currencyCode?.toUpperCase()).currencySymbol : ''} ',
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
            if (!controller.updateMode)
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('This is a template discount', style: mediumTextStyle),
                    AdaptiveIcon(
                        onPressed: () {
                          controller.showTemplateDiscountInfo = !controller.showTemplateDiscountInfo;
                          controller.update([1]);
                        },
                        icon: Icon(Icons.info_outline, color: lightWhite))
                  ],
                ),
                subtitle: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: controller.showTemplateDiscountInfo
                      ? Text(
                          'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.',
                          style: smallTextStyle.copyWith(color: lightWhite),
                        )
                      : null,
                ),
                value: controller.templateDiscount,
                onChanged: (val) {
                  controller.templateDiscount = val;
                  controller.update([1]);
                },
              ),
          ],
        );
      },
    );
  }
}
