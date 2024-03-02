import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/shipping_option_crud/shipping_option_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../controllers/add_update_shipping_option_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class AddUpdateShippingOptionView extends StatefulWidget {
  const AddUpdateShippingOptionView(this.addUpdateShippingOptionReq,
      {super.key});
  final AddUpdateShippingOptionReq addUpdateShippingOptionReq;

  @override
  State<AddUpdateShippingOptionView> createState() =>
      _AddUpdateShippingOptionViewState();
}

class _AddUpdateShippingOptionViewState
    extends State<AddUpdateShippingOptionView> {
  late ShippingOptionCrudBloc shippingOptionCrudBloc;
  AddUpdateShippingOptionReq get addUpdateShippingOptionReq =>
      widget.addUpdateShippingOptionReq;
  bool get updateMode => addUpdateShippingOptionReq.shippingOption != null;
  bool visibleInStore = false;
  final titleCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final minSubtotalCtrl = TextEditingController();
  final maxSubtotalCtrl = TextEditingController();
  ShippingOptionPriceType? selectedPriceType;
  ShippingProfile? selectedShippingProfile;
  FulfillmentOption? selectedFulfillmentOption;
  final formKey = GlobalKey<FormState>();

  List<FulfillmentOption>? fulfillmentOptions;
  List<ShippingProfile>? shippingProfiles;

  @override
  void initState() {
    shippingOptionCrudBloc = ShippingOptionCrudBloc.instance;
    super.initState();
  }

  @override
  void dispose() {
    shippingOptionCrudBloc.close();
    titleCtrl.dispose();
    priceCtrl.dispose();
    minSubtotalCtrl.dispose();
    maxSubtotalCtrl.dispose();
    super.dispose();
  }

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
    final inputFormatter = [
      CurrencyTextInputFormatter(
          name: addUpdateShippingOptionReq.region.currencyCode)
    ];
    final decoration = InputDecoration(
      prefixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
      prefixIcon: Text(
          '   ${addUpdateShippingOptionReq.region.currencyCode.getCurrencySymbol}   ',
          style: smallTextStyle?.copyWith(color: manatee)),
    );
    return BlocListener<ShippingOptionCrudBloc, ShippingOptionCrudState>(
      bloc: shippingOptionCrudBloc,
      listener: (context, state) {
        state.maybeMap(
            shippingOption: (_) {
              dismissLoading();
              context.showSnackBar(updateMode
                  ? 'Shipping option updated'
                  : 'Shipping option created');
              context.popRoute();
            },
            loading: (_) => loading(),
            error: (e) {
              dismissLoading();
              context.showSnackBar(e.failure.toSnackBarString());
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: updateMode
                ? const Text('Update Shipping Option')
                : const Text('Add Shipping Option'),
            actions: [
              TextButton(
                  onPressed: save,
                  child: updateMode ? const Text('Update') : const Text('Add'))
            ],
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: [
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Visible in store'),
                    subtitle: const Text(
                      'Enable or disable the shipping option visibility in store.',
                      style: TextStyle(color: manatee),
                    ),
                    value: visibleInStore,
                    onChanged: (val) {
                      setState(() => visibleInStore = val);
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
                          controller: titleCtrl,
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
                          value: selectedPriceType,
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
                                    child: Text(
                                        e == ShippingOptionPriceType.calculated
                                            ? 'Calculated'
                                            : 'Flat Rate'),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() => selectedPriceType = val);
                          },
                        ),
                        halfSpace,
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: selectedPriceType ==
                                  ShippingOptionPriceType.flatRate
                              ? LabeledTextField(
                                  label: 'Price',
                                  includeSpace: false,
                                  keyboardType: TextInputType.number,
                                  decoration: decoration,
                                  inputFormatters: inputFormatter,
                                  controller: priceCtrl,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Field is required';
                                    }

                                    return null;
                                  },
                                )
                              : const SizedBox.shrink(),
                        ),
                        if (!updateMode)
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
                                child: shippingProfiles != null
                                    ? DropdownButtonFormField<ShippingProfile>(
                                        style: context.bodyMedium,
                                        value: selectedShippingProfile,
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
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: border,
                                        ),
                                        items: shippingProfiles!
                                            .map((e) => DropdownMenuItem<
                                                    ShippingProfile>(
                                                  value: e,
                                                  child: Text(e.name ?? ''),
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          setState(() =>
                                              selectedShippingProfile = val);
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
                        if (!updateMode)
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
                                child: fulfillmentOptions != null
                                    ? DropdownButtonFormField<
                                        FulfillmentOption>(
                                        style: context.bodyMedium,
                                        value: selectedFulfillmentOption,
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
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          filled: true,
                                          fillColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: border,
                                        ),
                                        items: fulfillmentOptions!
                                            .map((e) => DropdownMenuItem<
                                                    FulfillmentOption>(
                                                  value: e,
                                                  child:
                                                      Text(e.providerId ?? ''),
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          setState(() =>
                                              selectedFulfillmentOption = val);
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
                          controller: minSubtotalCtrl,
                          hintText: '-',
                          decoration: decoration,
                          keyboardType: TextInputType.number,
                          inputFormatters: inputFormatter,
                          validator: (val) {
                            // When creating a new shipping option, minSubtotal is optional
                            if (!updateMode) {
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
                          controller: maxSubtotalCtrl,
                          hintText: '-',
                          decoration: decoration,
                          inputFormatters: inputFormatter,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            // When creating a new shipping option, maxSubtotal is optional
                            if (!updateMode) {
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
      ),
    );
  }

  void save() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.unfocus();
    final price =
        int.tryParse(priceCtrl.text.replaceAll('.', '').replaceAll(',', ''));
    final minSubtotal = int.tryParse(
        minSubtotalCtrl.text.replaceAll('.', '').replaceAll(',', ''));
    final maxSubtotal = int.tryParse(
        maxSubtotalCtrl.text.replaceAll('.', '').replaceAll(',', ''));
    List<ShippingOptionRequirement>? requirements = [
      if (minSubtotal != null)
        ShippingOptionRequirement(
            type: RequirementType.minSubtotal,
            amount: minSubtotal,
            shippingOptionId: null),
      if (maxSubtotal != null)
        ShippingOptionRequirement(
            type: RequirementType.maxSubtotal,
            amount: maxSubtotal,
            shippingOptionId: null),
    ];
    if (updateMode) {
      final shippingOption = addUpdateShippingOptionReq.shippingOption!;
      shippingOptionCrudBloc.add(ShippingOptionCrudEvent.update(
        shippingOption.id!,
        UserUpdateShippingOptionReq(
          shippingOption: ShippingOption(
            name: shippingOption.name == titleCtrl.text ? null : titleCtrl.text,
            regionId: null,
            profileId: null,
            providerId: null,
            priceType: null,
            amount: selectedPriceType == ShippingOptionPriceType.flatRate
                ? price
                : null,
            requirements: requirements.isNotEmpty ? requirements : null,
          ),
        ),
      ));
    } else {
      shippingOptionCrudBloc.add(ShippingOptionCrudEvent.create(
        UserCreateShippingOptionReq(
          shippingOption: ShippingOption(
            name: titleCtrl.text,
            regionId: addUpdateShippingOptionReq.region.id!,
            profileId: null,
            isReturn: addUpdateShippingOptionReq.returnShippingOption,
            data: {},
            providerId: selectedFulfillmentOption!.providerId,
            priceType: selectedPriceType,
            amount: selectedPriceType == ShippingOptionPriceType.flatRate
                ? price
                : null,
            requirements: requirements.isNotEmpty ? requirements : null,
          ),
        ),
      ));
    }
  }
}
