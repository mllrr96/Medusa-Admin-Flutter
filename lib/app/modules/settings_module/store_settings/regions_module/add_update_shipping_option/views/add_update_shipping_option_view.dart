import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../data/models/store/fulfillment_option.dart';
import '../../../../../components/currency_formatter.dart';
import '../controllers/add_update_shipping_option_controller.dart';

class AddUpdateShippingOptionView extends GetView<AddUpdateShippingOptionController> {
  const AddUpdateShippingOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const halfSpace = Gap(6);
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final headlineMediumTextStyle = context.headlineMedium;
    const border = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)));
    final inputFormatter = [
      CurrencyTextInputFormatter(name: controller.addUpdateShippingOptionReq.region.currencyCode)
    ];
    final decoration = InputDecoration(
      prefixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
      prefixIcon: Text('   ${controller.addUpdateShippingOptionReq.region.currencyCode?.toUpperCase() ?? ''}   ',
          style: smallTextStyle?.copyWith(color: lightWhite)),
    );
    return GetBuilder<AddUpdateShippingOptionController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: controller.updateMode ? const Text('Update Shipping Option') : const Text('Add Shipping Option'),
              actions: [
                AdaptiveButton(
                    onPressed: () async => controller.updateMode
                        ? null
                        : await controller.createShippingOption(context),
                    child: controller.updateMode ? const Text('Update') : const Text('Add'))
              ],
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  children: [
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Visible in store'),
                      subtitle: Text('Enable or disable the shipping option visibility in store.', style: TextStyle(color: lightWhite),),
                      value: controller.visibleInStore,
                      onChanged: (val) {
                        controller.visibleInStore = val;
                        controller.update();
                      },
                    ),
                    space,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details', style: headlineMediumTextStyle),
                          space,
                          LabeledTextField(
                            label: 'Title',
                            controller: controller.titleCtrl,
                            required: true,
                            hintText: 'Title...',
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Price Type', style: mediumTextStyle!),
                                        Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                                      ],
                                    ),
                                    halfSpace,
                                    DropdownButtonFormField<ShippingOptionPriceType>(
                                      value: controller.selectedPriceType,
                                      style: smallTextStyle,
                                      hint: const Text('Choose a price type'),
                                      iconSize: 20,
                                      dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
                                      validator: (val) {
                                        if (val == null) {
                                          return 'Field is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                                        border: border,
                                      ),
                                      items: ShippingOptionPriceType.values
                                          .map((e) => DropdownMenuItem<ShippingOptionPriceType>(
                                                value: e,
                                                child: Text(e == ShippingOptionPriceType.calculated
                                                    ? 'Calculated'
                                                    : 'Flat Rate'),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        controller.selectedPriceType = val;
                                        controller.update();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (controller.selectedPriceType == ShippingOptionPriceType.flatRate)
                                const SizedBox(width: 12.0),
                              Flexible(
                                flex: controller.selectedPriceType == ShippingOptionPriceType.flatRate ? 1 : 0,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.selectedPriceType == ShippingOptionPriceType.flatRate
                                      ? LabeledTextField(
                                          label: 'Price',
                                          includeSpace: false,
                                          keyboardType: TextInputType.number,
                                          decoration: decoration,
                                          inputFormatters: inputFormatter,
                                          controller: controller.priceCtrl,
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return 'Field is required';
                                            }

                                            return null;
                                          },
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              )
                            ],
                          ),
                          if (!controller.updateMode)
                            Column(
                              children: [
                                space,
                                Row(
                                  children: [
                                    Text('Shipping Profile', style: mediumTextStyle),
                                    Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                                  ],
                                ),
                                halfSpace,
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.shippingProfiles != null
                                      ? DropdownButtonFormField<ShippingProfile>(
                                          value: controller.selectedShippingProfile,
                                          hint: const Text('Choose a shipping profile'),
                                          style: smallTextStyle,
                                          dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
                                          validator: (val) {
                                            if (val == null) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            filled: true,
                                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                                            border: border,
                                          ),
                                          items: controller.shippingProfiles!
                                              .map((e) => DropdownMenuItem<ShippingProfile>(
                                                    value: e,
                                                    child: Text(e.name ?? ''),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            controller.selectedShippingProfile = val;
                                            controller.update();
                                          },
                                        )
                                      : const Center(child: CircularProgressIndicator.adaptive()),
                                ),
                              ],
                            ),
                          if (!controller.updateMode)
                            Column(
                              children: [
                                space,
                                Row(
                                  children: [
                                    Text('Fulfillment Method', style: mediumTextStyle),
                                    Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                                  ],
                                ),
                                halfSpace,
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.fulfillmentOptions != null
                                      ? DropdownButtonFormField<FulfillmentOption>(
                                          value: controller.selectedFulfillmentOption,
                                          hint: const Text('Choose a fulfillment method'),
                                          style: smallTextStyle,
                                          dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
                                          validator: (val) {
                                            if (val == null) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            filled: true,
                                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                                            border: border,
                                          ),
                                          items: controller.fulfillmentOptions!
                                              .map((e) => DropdownMenuItem<FulfillmentOption>(
                                                    value: e,
                                                    child: Text(e.providerId ?? ''),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            controller.selectedFulfillmentOption = val;
                                            controller.update();
                                          },
                                        )
                                      : const Center(child: CircularProgressIndicator.adaptive()),
                                ),
                              ],
                            ),
                          space,
                        ],
                      ),
                    ),
                    space,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Requirements', style: headlineMediumTextStyle),
                          space,
                          LabeledTextField(
                            label: 'Min. subtotal (Tax excl. price)',
                            controller: controller.minSubtotalCtrl,
                            hintText: '-',
                            decoration: decoration,
                            keyboardType: TextInputType.number,
                            inputFormatters: inputFormatter,
                          ),
                          LabeledTextField(
                            label: 'Max. subtotal (Tax excl. price)',
                            controller: controller.maxSubtotalCtrl,
                            hintText: '-',
                            decoration: decoration,
                            inputFormatters: inputFormatter,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
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
