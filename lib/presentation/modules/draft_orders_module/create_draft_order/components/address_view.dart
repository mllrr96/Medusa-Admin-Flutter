import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

import '../controllers/create_draft_order_controller.dart';
import 'pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CreateDraftOrderAddressView extends StatefulWidget {
  const CreateDraftOrderAddressView(this.controller, {super.key});
  final CreateDraftOrderController controller;
  @override
  State<CreateDraftOrderAddressView> createState() =>
      _CreateDraftOrderAddressViewState();
}

class _CreateDraftOrderAddressViewState
    extends State<CreateDraftOrderAddressView> {
  final customerCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final companyCtrl = TextEditingController();

  final address1Ctrl = TextEditingController();
  final address2Ctrl = TextEditingController();
  final postalCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final shippingGeneralKey = GlobalKey();
  final billingGeneralKey = GlobalKey();
  final shippingAddressKey = GlobalKey();
  final billingAddressKey = GlobalKey();

  final billingFirstNameCtrl = TextEditingController();
  final billingLastNameCtrl = TextEditingController();
  final billingPhoneCtrl = TextEditingController();
  final billingCompanyCtrl = TextEditingController();

  final billingAddress1Ctrl = TextEditingController();
  final billingAddress2Ctrl = TextEditingController();
  final billingPostalCodeCtrl = TextEditingController();
  final billingCityCtrl = TextEditingController();
  final billingProvinceCtrl = TextEditingController();

  @override
  void dispose() {
    customerCtrl.dispose();
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    phoneCtrl.dispose();
    companyCtrl.dispose();
    address1Ctrl.dispose();
    address2Ctrl.dispose();
    postalCodeCtrl.dispose();
    cityCtrl.dispose();
    provinceCtrl.dispose();
    billingFirstNameCtrl.dispose();
    billingLastNameCtrl.dispose();
    billingPhoneCtrl.dispose();
    billingCompanyCtrl.dispose();
    billingAddress1Ctrl.dispose();
    billingAddress2Ctrl.dispose();
    billingPostalCodeCtrl.dispose();
    billingCityCtrl.dispose();
    billingProvinceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    const space = Gap(12);
    const halfSpace = Gap(6);
    final countries = controller.selectedRegion?.countries;
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    return Column(
      children: [
        LabeledTextField(
          label: 'Customer',
          controller: customerCtrl,
          readOnly: true,
          onTap: () async {
            final result = await context.pushRoute(PickCustomerRoute(
                pickCustomerReq: PickCustomerReq(
                    selectedCustomers: controller.selectedCustomer != null
                        ? [controller.selectedCustomer!]
                        : null)));
            if (result is PickCustomerRes) {
              final customer = result.selectedCustomers.first;
              controller.selectedCustomer = customer;
              controller.customCustomer = false;
              customerCtrl.text = customer.firstName != null
                  ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                  : customer.email;
              emailCtrl.text = customer.email;
              firstNameCtrl.text = customer.firstName ?? '';
              lastNameCtrl.text = customer.lastName ?? '';
              phoneCtrl.text = customer.phone ?? '';
              setState(() {});
            }
          },
          decoration: InputDecoration(
            hintText: 'Choose customer',
            suffixIcon: controller.selectedCustomer != null &&
                    !controller.customCustomer
                ? IconButton(
                    onPressed: () {
                      controller.selectedCustomer = null;
                      controller.customCustomer = true;
                      customerCtrl.clear();
                      firstNameCtrl.clear();
                      lastNameCtrl.clear();
                      phoneCtrl.clear();
                      emailCtrl.clear();
                      setState(() {});
                    },
                    icon: const Icon(CupertinoIcons.clear_circled))
                : const Icon(Icons.arrow_drop_down),
          ),
          validator: (val) {
            if (emailCtrl.text.removeAllWhitespace.isNotEmpty &&
                (val?.isEmpty ?? true)) {
              return null;
            }

            if (emailCtrl.text.removeAllWhitespace.isEmpty &&
                (val?.isEmpty ?? true)) {
              return 'Field is required';
            }

            return null;
          },
        ),
        LabeledTextField(
          label: 'Email',
          style: controller.customCustomer
              ? null
              : smallTextStyle?.copyWith(color: lightWhite),
          onChanged: (val) {
            if (!controller.customCustomer &&
                controller.selectedCustomer == null) {
              controller.customCustomer = true;
            }
            if (val.removeAllWhitespace.isNotEmpty) {
              controller.selectedCustomer = Customer(email: val);
            }
          },
          validator: (val) {
            if (customerCtrl.text.isNotEmpty && (val?.isEmpty ?? true)) {
              return null;
            }

            if (customerCtrl.text.isEmpty && (val?.isEmpty ?? true)) {
              return 'Field is required';
            }

            return null;
          },
          required: true,
          controller: emailCtrl,
          readOnly: !controller.customCustomer,
          hintText: 'lebron@james.com',
          decoration: InputDecoration(
              prefixIcon: controller.customCustomer
                  ? null
                  : Icon(CupertinoIcons.lock_fill, color: lightWhite)),
        ),
        space,
        const Text('Shipping Details'),
        space,
        FlexExpansionTile(
          key: shippingGeneralKey,
          title: const Text('General'),
          onExpansionChanged: (expanded) async {
            await shippingGeneralKey.currentContext.ensureVisibility();
          },
          child: Column(
            children: <Widget>[
              LabeledTextField(
                label: 'First Name',
                controller: firstNameCtrl,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(firstName: val);
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Last Name',
                controller: lastNameCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(lastName: val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Company',
                controller: companyCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(company: val);
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                controller: phoneCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(phone: val);
                },
              ),
            ],
          ),
        ),
        space,
        FlexExpansionTile(
          key: shippingAddressKey,
          // label: 'Shipping Address',
          title: const Text('Shipping Address'),
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await shippingAddressKey.currentContext.ensureVisibility();
            }
          },
          child: Column(
            children: <Widget>[
              LabeledTextField(
                label: 'Address 1',
                controller: address1Ctrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(address1: val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Address 2',
                controller: address2Ctrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(address2: val);
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                controller: postalCodeCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(postalCode: val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'City',
                controller: cityCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(city: val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Province',
                controller: provinceCtrl,
                onChanged: (val) {
                  controller.shippingAddress =
                      controller.shippingAddress.copyWith(province: val);
                },
              ),
              if (countries?.isNotEmpty ?? false)
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Country', style: mediumTextStyle),
                        Text('*',
                            style: mediumTextStyle?.copyWith(color: Colors.red))
                      ],
                    ),
                    halfSpace,
                    DropdownButtonFormField<Country>(
                      style: context.bodyMedium,
                      value: countries?.first,
                      items: countries
                          ?.map((e) => DropdownMenuItem<Country>(
                                value: e,
                                child: Text(e.name?.capitalize ?? ''),
                              ))
                          .toList(),
                      onChanged: (Country? country) {
                        controller.shippingAddress = controller.shippingAddress
                            .copyWith(country: country);
                      },
                      validator: (val) {
                        if (val == null) {
                          return 'Country is required';
                        }
                        return null;
                      },
                    ),
                    space,
                  ],
                ),
            ],
          ),
        ),
        halfSpace,
        const Divider(),
        const Text('Billing Details'),
        space,
        CheckboxListTile(
          value: controller.sameAddress,
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              controller.sameAddress = true;
              billingFirstNameCtrl.clear();
              billingLastNameCtrl.clear();
              billingCompanyCtrl.clear();
              billingPhoneCtrl.clear();
              billingAddress1Ctrl.clear();
              billingAddress2Ctrl.clear();
              billingPostalCodeCtrl.clear();
              billingCityCtrl.clear();
              billingProvinceCtrl.clear();
            } else {
              controller.billingAddress = const Address();
              controller.sameAddress = false;
            }
            controller.update();
          },
          title: Text('Use same as shipping', style: smallTextStyle),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        space,
        FlexExpansionTile(
          key: billingGeneralKey,
          // label: 'General',
          title: const Text('General'),
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await billingGeneralKey.currentContext.ensureVisibility();
            }
          },
          child: Column(
            children: <Widget>[
              LabeledTextField(
                label: 'First Name',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingFirstNameCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(firstName: val);
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Last Name',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingLastNameCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(lastName: val);
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Company',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingCompanyCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(company: val);
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingPhoneCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(phone: val);
                },
              ),
            ],
          ),
        ),
        space,
        FlexExpansionTile(
          key: billingAddressKey,
          // label: 'Billing Address',
          title: const Text('Billing Address'),
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await billingAddressKey.currentContext.ensureVisibility();
            }
          },
          child: Column(
            children: <Widget>[
              LabeledTextField(
                label: 'Address 1',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingAddress1Ctrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(address1: val);
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Address 2',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingAddress2Ctrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(address2: val);
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingPostalCodeCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(postalCode: val);
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'City',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingCityCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(city: val);
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Province',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingProvinceCtrl,
                onChanged: (val) {
                  controller.billingAddress =
                      controller.billingAddress.copyWith(province: val);
                },
              ),
              if (countries?.isNotEmpty ?? false)
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Country', style: mediumTextStyle),
                        Text('*',
                            style: mediumTextStyle?.copyWith(color: Colors.red))
                      ],
                    ),
                    halfSpace,
                    DropdownButtonFormField<Country>(
                      style: context.bodyMedium,
                      value: countries?.first,
                      items: countries
                          ?.map((e) => DropdownMenuItem<Country>(
                                value: e,
                                child: Text(e.name?.capitalize ?? ''),
                              ))
                          .toList(),
                      onChanged: (Country? country) {
                        controller.billingAddress = controller.billingAddress
                            .copyWith(country: country);
                      },
                      validator: (val) {
                        if (controller.sameAddress) {
                          return null;
                        }
                        if (val == null) {
                          return 'Country is required';
                        }
                        return null;
                      },
                    ),
                    space,
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
