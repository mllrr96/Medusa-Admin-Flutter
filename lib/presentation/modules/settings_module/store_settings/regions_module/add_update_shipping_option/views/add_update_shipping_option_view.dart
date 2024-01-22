import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/domain/use_case/region/update_shipping_option_use_case.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../controllers/add_update_shipping_option_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class AddUpdateShippingOptionView extends StatelessWidget {
  const AddUpdateShippingOptionView(this.addUpdateShippingOptionReq,
      {super.key});
  final AddUpdateShippingOptionReq addUpdateShippingOptionReq;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const halfSpace = Gap(6);
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final headlineMediumTextStyle = context.headlineMedium;
    const border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)));

    return GetBuilder<AddUpdateShippingOptionController>(
      init: AddUpdateShippingOptionController(
        addUpdateShippingOptionReq: addUpdateShippingOptionReq,
        updateShippingOptionUseCase: UpdateShippingOptionUseCase.instance,
      ),
      builder: (controller) {
        final inputFormatter = [
          CurrencyTextInputFormatter(
              name: controller.addUpdateShippingOptionReq.region.currencyCode)
        ];
        final decoration = InputDecoration(
          prefixIconConstraints:
              const BoxConstraints(minHeight: 0, minWidth: 0),
          prefixIcon: Text(
              '   ${NumberFormat.simpleCurrency(name: controller.addUpdateShippingOptionReq.region.currencyCode?.toUpperCase()).currencySymbol}   ',
              style: smallTextStyle?.copyWith(color: manatee)),
        );
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: controller.updateMode
                  ? const Text('Update Shipping Option')
                  : const Text('Add Shipping Option'),
              actions: [
                TextButton(
                    onPressed: () async => controller.updateMode
                        ? await controller.updateShippingOption(context)
                        : await controller.createShippingOption(context),
                    child: controller.updateMode
                        ? const Text('Update')
                        : const Text('Add'))
              ],
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  children: [
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Visible in store'),
                      subtitle: const Text(
                        'Enable or disable the shipping option visibility in store.',
                        style: TextStyle(color: manatee),
                      ),
                      value: controller.visibleInStore,
                      onChanged: (val) {
                        controller.visibleInStore = val;
                        controller.update();
                      },
                    ),
                    space,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
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
                            children: [
                              Text('Price Type', style: mediumTextStyle!),
                              Text('*',
                                  style: mediumTextStyle.copyWith(
                                      color: Colors.red)),
                            ],
                          ),
                          halfSpace,
                          DropdownButtonFormField<ShippingOptionPriceType>(
                            style: context.bodyMedium,
                            value: controller.selectedPriceType,
                            hint: const Text('Choose a price type'),
                            iconSize: 20,
                            dropdownColor:
                                Theme.of(context).appBarTheme.backgroundColor,
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
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              border: border,
                            ),
                            items: ShippingOptionPriceType.values
                                .map((e) =>
                                    DropdownMenuItem<ShippingOptionPriceType>(
                                      value: e,
                                      child: Text(e ==
                                              ShippingOptionPriceType.calculated
                                          ? 'Calculated'
                                          : 'Flat Rate'),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              controller.selectedPriceType = val;
                              controller.update();
                            },
                          ),
                          halfSpace,
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.selectedPriceType ==
                                    ShippingOptionPriceType.flatRate
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
                          if (!controller.updateMode)
                            Column(
                              children: [
                                space,
                                Row(
                                  children: [
                                    Text('Shipping Profile',
                                        style: mediumTextStyle),
                                    Text('*',
                                        style: mediumTextStyle.copyWith(
                                            color: Colors.red)),
                                  ],
                                ),
                                halfSpace,
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.shippingProfiles != null
                                      ? DropdownButtonFormField<
                                          ShippingProfile>(
                                          style: context.bodyMedium,
                                          value: controller
                                              .selectedShippingProfile,
                                          hint: const Text(
                                              'Choose a shipping profile'),
                                          dropdownColor: Theme.of(context)
                                              .appBarTheme
                                              .backgroundColor,
                                          validator: (val) {
                                            if (val == null) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            border: border,
                                          ),
                                          items: controller.shippingProfiles!
                                              .map((e) => DropdownMenuItem<
                                                      ShippingProfile>(
                                                    value: e,
                                                    child: Text(e.name ?? ''),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            controller.selectedShippingProfile =
                                                val;
                                            controller.update();
                                          },
                                        )
                                      : const Skeletonizer(
                                          enabled: true,
                                          child: TextField(
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Choose a shipping profile',
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          if (!controller.updateMode)
                            Column(
                              children: [
                                space,
                                Row(
                                  children: [
                                    Text('Fulfillment Method',
                                        style: mediumTextStyle),
                                    Text('*',
                                        style: mediumTextStyle.copyWith(
                                            color: Colors.red)),
                                  ],
                                ),
                                halfSpace,
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.fulfillmentOptions != null
                                      ? DropdownButtonFormField<
                                          FulfillmentOption>(
                                          style: context.bodyMedium,
                                          value: controller
                                              .selectedFulfillmentOption,
                                          hint: const Text(
                                              'Choose a fulfillment method'),
                                          dropdownColor: Theme.of(context)
                                              .appBarTheme
                                              .backgroundColor,
                                          validator: (val) {
                                            if (val == null) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            border: border,
                                          ),
                                          items: controller.fulfillmentOptions!
                                              .map((e) => DropdownMenuItem<
                                                      FulfillmentOption>(
                                                    value: e,
                                                    child: Text(
                                                        e.providerId ?? ''),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            controller
                                                    .selectedFulfillmentOption =
                                                val;
                                            controller.update();
                                          },
                                        )
                                      : const Skeletonizer(
                                          enabled: true,
                                          child: TextField(
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Choose a fulfillment method',
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          space,
                        ],
                      ),
                    ),
                    space,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
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
                            validator: (val) {
                              // When creating a new shipping option, minSubtotal is optional
                              if (!controller.updateMode) {
                                return null;
                              }
                              // when updating a shipping option, minSubtotal is required
                              if (val?.isEmpty ?? true) {
                                return 'Field is required';
                              }
                              return null;
                            },
                          ),
                          LabeledTextField(
                            label: 'Max. subtotal (Tax excl. price)',
                            controller: controller.maxSubtotalCtrl,
                            hintText: '-',
                            decoration: decoration,
                            inputFormatters: inputFormatter,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              // When creating a new shipping option, maxSubtotal is optional
                              if (!controller.updateMode) {
                                return null;
                              }
                              // when updating a shipping option, maxSubtotal is required
                              if (val?.isEmpty ?? true) {
                                return 'Field is required';
                              }
                              return null;
                            },
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
