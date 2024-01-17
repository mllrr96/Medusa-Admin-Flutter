import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/views/pick_regions_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';


import '../controllers/add_update_discount_controller.dart';

class GeneralExpansionTile extends GetView<AddUpdateDiscountController> {
  const GeneralExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);

    return GetBuilder<AddUpdateDiscountController>(
      id: 1,
      builder: (controller) {
        return FlexExpansionTile(
          key: controller.generalKey,
          controller: controller.generalTileController,
          initiallyExpanded: controller.updateMode,
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await controller.generalKey.currentContext.ensureVisibility();
            }
          },
          maintainState: true,
          title: const Text('General'),
          // expandedAlignment: Alignment.centerLeft,
          childPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Column(
            children: <Widget>[
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
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 48 * 1.5),
                  prefixIcon: controller.selectedRegions.isNotEmpty
                      ? Chip(
                          backgroundColor:
                              Theme.of(context).appBarTheme.backgroundColor,
                          label: Text(
                              controller.selectedRegions.length.toString()),
                          labelStyle: smallTextStyle,
                          side: const BorderSide(color: Colors.grey),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                        )
                      : null,
                ),
                required: true,
                readOnly: true,
                onTap: () async {
                  final regionReq = PickRegionsReq(
                    multipleSelect:
                        controller.discountRuleType == DiscountRuleType.fixed
                            ? false
                            : true,
                    selectedRegions:
                        controller.discountRuleType == DiscountRuleType.fixed
                            ? controller.selectedRegions.isNotEmpty
                                ? [controller.selectedRegions.first]
                                : []
                            : [...controller.selectedRegions],
                  );
                  await showBarModalBottomSheet(
                          context: context,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                          overlayStyle:
                              context.theme.appBarTheme.systemOverlayStyle,
                          builder: (context) =>
                              PickRegionsView(pickRegionsReq: regionReq))
                      .then((result) {
                    if (result is PickRegionsRes) {
                      controller.selectedRegions = result.regions;
                      final regionsName =
                          result.regions.map((e) => e.name).toList();
                      controller.regionCtrl.text = regionsName
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '');
                      if (controller.discountRuleType ==
                          DiscountRuleType.fixed) {
                        controller.amountCtrl.text = int.tryParse(controller
                                .amountCtrl.text
                                .replaceAll(RegExp('[^0-9]'), ''))
                            .formatAsPrice(
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
                child:
                    controller.discountRuleType == DiscountRuleType.percentage
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
                                  controller.amountCtrl.text = (val + 1)
                                      .formatAsPrice(
                                          controller.selectedRegions.first
                                              .currencyCode,
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
                                  controller.amountCtrl.text = (val - 1)
                                      .formatAsPrice(
                                          controller.selectedRegions.first
                                              .currencyCode,
                                          includeSymbol: false);
                                },
                                inputFormatters: [
                                  if (controller.selectedRegions.isNotEmpty)
                                    CurrencyTextInputFormatter(
                                      name: controller
                                          .selectedRegions.first.currencyCode,
                                    )
                                ],
                                prefixText:
                                    '   ${controller.selectedRegions.isNotEmpty ? NumberFormat.simpleCurrency(name: controller.selectedRegions.first.currencyCode?.toUpperCase()).currencySymbol : ''} ',
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
                style: smallTextStyle!.copyWith(color: manatee),
              ),
              space,
              LabeledTextField(
                label: 'Description',
                controller: controller.descriptionCtrl,
                required: true,
                hintText: 'Summer Sale 2022...',
                minLines: 4,
                maxLines: null,
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
                      Text('This is a template discount',
                          style: mediumTextStyle),
                      IconButton(
                          onPressed: () {
                            controller.showTemplateDiscountInfo =
                                !controller.showTemplateDiscountInfo;
                            controller.update([1]);
                          },
                          icon: Icon(Icons.info_outline, color: manatee))
                    ],
                  ),
                  subtitle: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: controller.showTemplateDiscountInfo
                        ? Text(
                            'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.',
                            style: smallTextStyle.copyWith(color: manatee),
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
          ),
        );
      },
    );
  }
}
