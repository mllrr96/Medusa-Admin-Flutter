import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/discount_module/add_update_discount/components/index.dart';
import '../../../../../../data/models/store/fulfillment_option.dart';
import '../controllers/add_update_shipping_option_controller.dart';

class AddUpdateShippingOptionView extends GetView<AddUpdateShippingOptionController> {
  const AddUpdateShippingOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    const border = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)));
    return GetBuilder<AddUpdateShippingOptionController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: controller.updateMode ? const Text('Update Shipping Option') : const Text('Add Shipping Option'),
              actions: [
                AdaptiveButton(onPressed: () async => await controller.createShippingOption(), child: Text('Add'))
              ],
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  children: [
                    ConfigSwitchTile(
                      title: 'Visible in store',
                      subtitle: 'Enable or disable the shipping option visibility in store.',
                      tileValue: controller.visibleInStore,
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
                          Text('Details', style: Theme.of(context).textTheme.displayLarge),
                          space,
                          CustomTextField(
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
                                      },
                                    ),
                                    space,
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Flexible(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.selectedPriceType == ShippingOptionPriceType.flatRate
                                      ? CustomTextField(
                                          label: 'Price',
                                          controller: TextEditingController(),
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
                          Text('Requirements', style: Theme.of(context).textTheme.displayLarge),
                          space,
                          CustomTextField(
                            label: 'Min. subtotal (Tax excl. price)',
                            controller: TextEditingController(),
                            hintText: '-',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            label: 'Max. subtotal (Tax excl. price)',
                            controller: TextEditingController(),
                            hintText: '-',
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
