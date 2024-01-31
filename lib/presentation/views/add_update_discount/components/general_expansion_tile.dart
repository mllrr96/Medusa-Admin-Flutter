import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/views/pick_regions_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class GeneralExpansionTile extends StatefulWidget {
  const GeneralExpansionTile({
    super.key,
    required this.discountType,
    this.tileController,
    this.onExpansionChanged,
    required this.onSaved,
    this.discount,
  });
  final FlexExpansionTileController? tileController;
  final void Function(bool)? onExpansionChanged;
  final DiscountRuleType discountType;
  final Discount? discount;
  final void Function(
    List<Region> regions,
    String code,
    String description,
    int? value,
  ) onSaved;
  @override
  State<GeneralExpansionTile> createState() => _GeneralExpansionTileState();
}

class _GeneralExpansionTileState extends State<GeneralExpansionTile> {
  DiscountRuleType get discountType => widget.discountType;
  final regionCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final percentageCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final codeCtrl = TextEditingController();
  List<Region> selectedRegions = [];

  @override
  void initState() {
    if (widget.discount != null) {
      selectedRegions = widget.discount!.regions ?? [];
      regionCtrl.text = selectedRegions
          .map((e) => e.name)
          .toList()
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '');
      if (discountType == DiscountRuleType.fixed) {
        // widget.discount?.rule;
        amountCtrl.text = widget.discount!.rule?.value
                ?.formatAsPrice(selectedRegions.firstOrNull?.currencyCode) ??
            '';
      } else {
        percentageCtrl.text = widget.discount!.rule?.value
                ?.formatAsPrice(selectedRegions.firstOrNull?.currencyCode) ??
            '';
      }
      descriptionCtrl.text = widget.discount!.rule?.description ?? '';
      codeCtrl.text = widget.discount!.code ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    regionCtrl.dispose();
    amountCtrl.dispose();
    percentageCtrl.dispose();
    descriptionCtrl.dispose();
    codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    // final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return FlexExpansionTile(
      // key: controller.generalKey,
      controller: widget.tileController,
      initiallyExpanded: widget.discount !=null,
      onExpansionChanged: (expanded) async {
        if (expanded && widget.key is GlobalKey) {
          await (widget.key as GlobalKey).currentContext.ensureVisibility();
        }
      },
      maintainState: true,
      title: const Text('General'),
      // expandedAlignment: Alignment.centerLeft,
      childPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          LabeledTextField(
            onSaved: (_) {
              widget.onSaved(
             selectedRegions,
              codeCtrl.text,
             descriptionCtrl.text,
            discountType == DiscountRuleType.fixed
                      ? int.tryParse(
                          amountCtrl.text.replaceAll(RegExp('[^0-9]'), ''))
                      : int.tryParse(percentageCtrl.text
                          .replaceAll(RegExp('[^0-9]'), '')));
            },
            label: discountType == DiscountRuleType.fixed
                ? 'Choose valid region'
                : 'Choose valid regions',
            controller: regionCtrl,
            decoration: InputDecoration(
              hintText: selectedRegions.isNotEmpty
                  ? selectedRegions.length == 1
                      ? 'Region'
                      : 'Regions'
                  : 'Select ... ',
              suffixIcon: const Icon(Icons.arrow_drop_down_outlined),
              prefixIconConstraints: const BoxConstraints(minWidth: 48 * 1.5),
              prefixIcon: selectedRegions.isNotEmpty
                  ? Chip(
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      label: Text(selectedRegions.length.toString()),
                      labelStyle: smallTextStyle,
                      side: const BorderSide(color: Colors.grey),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    )
                  : null,
            ),
            required: true,
            readOnly: true,
            onTap: () async {
              final regionReq = PickRegionsReq(
                multipleSelect:
                    discountType == DiscountRuleType.fixed ? false : true,
                selectedRegions: discountType == DiscountRuleType.fixed
                    ? selectedRegions.isNotEmpty
                        ? [selectedRegions.first]
                        : []
                    : [...selectedRegions],
              );
              await showBarModalBottomSheet(
                  context: context,
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                  overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                  builder: (context) =>
                      PickRegionsView(pickRegionsReq: regionReq)).then(
                  (result) {
                if (result is PickRegionsRes) {
                  selectedRegions = result.regions;
                  final regionsName =
                      result.regions.map((e) => e.name).toList();
                  regionCtrl.text = regionsName
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '');
                  if (discountType == DiscountRuleType.fixed) {
                    amountCtrl.text = int.tryParse(
                            amountCtrl.text.replaceAll(RegExp('[^0-9]'), ''))
                        .formatAsPrice(selectedRegions.first.currencyCode);
                  }
                  // controller.update([1]);
                }
              });
            },
            validator: (val) {
              if (selectedRegions.isEmpty) {
                return 'Select at least one region';
              }
              return null;
            },
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: discountType == DiscountRuleType.percentage
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
                    controller: percentageCtrl,
                  )
                : discountType == DiscountRuleType.fixed
                    ? LabeledNumericTextField(
                        key: const Key('amount'),
                        label: 'Amount',
                        required: true,
                        hintText: '0.00',
                        controller: amountCtrl,
                        onPlusPressed: () {
                          var text = amountCtrl.text;
                          text = text.replaceAll(RegExp(r'[^0-9]'), '');
                          var val = int.tryParse(text);
                          val ??= 0;
                          amountCtrl.text = (val + 1).formatAsPrice(
                              selectedRegions.first.currencyCode,
                              includeSymbol: false);
                        },
                        onMinusPressed: () {
                          var text = amountCtrl.text;
                          text = text.replaceAll(RegExp(r'[^0-9]'), '');
                          var val = int.tryParse(text);
                          val ??= 0;
                          if (val == 0) {
                            return;
                          }
                          amountCtrl.text = (val - 1).formatAsPrice(
                              selectedRegions.first.currencyCode,
                              includeSymbol: false);
                        },
                        inputFormatters: [
                          if (selectedRegions.isNotEmpty)
                            CurrencyTextInputFormatter(
                              name: selectedRegions.first.currencyCode,
                            )
                        ],
                        prefixText:
                            '   ${selectedRegions.isNotEmpty ? NumberFormat.simpleCurrency(name: selectedRegions.first.currencyCode?.toUpperCase()).currencySymbol : ''} ',
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
            controller: codeCtrl,
            hintText: 'SUMMERSALE10',
          ),
          Text(
            'The code your customers will enter during checkout. This will appear on your customer’s invoice. \nUppercase letters and numbers only.',
            style: smallTextStyle!.copyWith(color: manatee),
          ),
          space,
          LabeledTextField(
            label: 'Description',
            controller: descriptionCtrl,
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
          // if (!controller.updateMode)
          //   SwitchListTile.adaptive(
          //     contentPadding: EdgeInsets.zero,
          //     title: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text('This is a template discount',
          //             style: mediumTextStyle),
          //         IconButton(
          //             onPressed: () {
          //               controller.showTemplateDiscountInfo =
          //                   !controller.showTemplateDiscountInfo;
          //               controller.update([1]);
          //             },
          //             icon: const Icon(Icons.info_outline, color: manatee))
          //       ],
          //     ),
          //     subtitle: AnimatedSwitcher(
          //       duration: const Duration(milliseconds: 200),
          //       child: controller.showTemplateDiscountInfo
          //           ? Text(
          //               'Template discounts allow you to define a set of rules that can be used across a group of discounts. This is useful in campaigns that should generate unique codes for each user, but where the rules for all unique codes should be the same.',
          //               style: smallTextStyle.copyWith(color: manatee),
          //             )
          //           : null,
          //     ),
          //     value: controller.templateDiscount,
          //     onChanged: (val) {
          //       controller.templateDiscount = val;
          //       controller.update([1]);
          //     },
          //   ),
        ],
      ),
    );
  }
}
