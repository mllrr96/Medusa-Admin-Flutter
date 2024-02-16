import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/copy_with_address.dart';
import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class CreateDraftOrderAddressView extends StatefulWidget {
  const CreateDraftOrderAddressView(this.countries, {super.key, this.onSaved});
  final List<Country> countries;
  final void Function(
    Customer customer,
    Address shippingAddress,
    Address billingAddress,
  )? onSaved;
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
  Address shippingAddress = const Address();
  Address billingAddress = const Address();
  Customer? selectedCustomer;
  bool customCustomer = true;
  bool sameAddress = false;
  List<Country> get countries => widget.countries;

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
    const space = Gap(12);
    const halfSpace = Gap(6);
    const manatee = ColorManager.manatee;
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
                    selectedCustomers: selectedCustomer != null
                        ? [selectedCustomer!]
                        : null)));
            if (result is PickCustomerRes) {
              final customer = result.selectedCustomers.first;
              selectedCustomer = customer;
              customCustomer = false;
              customerCtrl.text = customer.fullName ?? customer.email;
              emailCtrl.text = customer.email;
              firstNameCtrl.text = customer.firstName ?? '';
              lastNameCtrl.text = customer.lastName ?? '';
              phoneCtrl.text = customer.phone ?? '';
              setState(() {});
            }
          },
          decoration: InputDecoration(
            hintText: 'Choose customer',
            suffixIcon: selectedCustomer != null && !customCustomer
                ? IconButton(
                    onPressed: () {
                      selectedCustomer = null;
                      customCustomer = true;
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
          style:
              customCustomer ? null : smallTextStyle?.copyWith(color: manatee),
          onChanged: (val) {
            if (!customCustomer && selectedCustomer == null) {
              customCustomer = true;
            }
            if (val.removeAllWhitespace.isNotEmpty) {
              selectedCustomer = Customer(email: val);
            }
          },
          validator: (val) {
            if (customerCtrl.text.isNotEmpty && (val?.isEmpty ?? true)) {
              return null;
            }

            if (customerCtrl.text.isEmpty && (val?.isEmpty ?? true)) {
              return 'Field is required';
            }

            if(val != null && val.isNotEmpty && !val.isEmail) {
              return 'Invalid email';
            }

            return null;
          },
          required: true,
          controller: emailCtrl,
          readOnly: !customCustomer,
          hintText: 'lebron@james.com',
          decoration: InputDecoration(
              prefixIcon: customCustomer
                  ? null
                  : const Icon(CupertinoIcons.lock_fill, color: manatee)),
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
                onSaved: (val) {
                  shippingAddress = shippingAddress.copyWith(firstName: val);
                  if (sameAddress) {
                    widget.onSaved?.call(
                      selectedCustomer!,
                      shippingAddress,
                      shippingAddress,
                    );
                  } else {
                    widget.onSaved?.call(
                      selectedCustomer!,
                      shippingAddress,
                      billingAddress,
                    );
                  }
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                onChanged: (val) {
                  shippingAddress = shippingAddress.copyWith(firstName: val);
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Last Name',
                controller: lastNameCtrl,
                onChanged: (val) {
                  shippingAddress = shippingAddress.copyWith(lastName: val);
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
                  shippingAddress = shippingAddress.copyWith(company: val);
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                controller: phoneCtrl,
                onChanged: (val) {
                  shippingAddress = shippingAddress.copyWith(phone: val);
                },
              ),
            ],
          ),
        ),
        space,
        FlexExpansionTile(
          key: shippingAddressKey,
          maintainState: true,
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
                  shippingAddress = shippingAddress.copyWith(address1: val);
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
                  shippingAddress = shippingAddress.copyWith(address2: val);
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                controller: postalCodeCtrl,
                onChanged: (val) {
                  shippingAddress = shippingAddress.copyWith(postalCode: val);
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
                  shippingAddress = shippingAddress.copyWith(city: val);
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
                  shippingAddress = shippingAddress.copyWith(province: val);
                },
              ),
              if (countries.isNotEmpty)
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
                      value: countries.first,
                      onSaved: (country) {
                        shippingAddress =
                            shippingAddress.copyWith(country: country);
                      },
                      items: countries
                          .map((e) => DropdownMenuItem<Country>(
                                value: e,
                                child: Text(e.name?.capitalize ?? ''),
                              ))
                          .toList(),
                      onChanged: (Country? country) {
                        shippingAddress =
                            shippingAddress.copyWith(country: country);
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
          value: sameAddress,
          onChanged: (val) {
            if (val == null) return;
            if (val) {
              sameAddress = true;
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
              billingAddress = const Address();
              sameAddress = false;
            }
            setState(() {});

            // controller.update();
          },
          title: Text('Use same as shipping', style: smallTextStyle),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        space,
        FlexExpansionTile(
          key: billingGeneralKey,
          maintainState: true,
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingFirstNameCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(firstName: val);
                },
                validator: (val) {
                  if (sameAddress) {
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingLastNameCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(lastName: val);
                },
                validator: (val) {
                  if (sameAddress) {
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingCompanyCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(company: val);
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingPhoneCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(phone: val);
                },
              ),
            ],
          ),
        ),
        space,
        FlexExpansionTile(
          key: billingAddressKey,
          maintainState: true,
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingAddress1Ctrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(address1: val);
                },
                validator: (val) {
                  if (sameAddress) {
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingAddress2Ctrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(address2: val);
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingPostalCodeCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(postalCode: val);
                },
                validator: (val) {
                  if (sameAddress) {
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingCityCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(city: val);
                },
                validator: (val) {
                  if (sameAddress) {
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
                lightLabelColor: sameAddress,
                readOnly: sameAddress,
                controller: billingProvinceCtrl,
                onChanged: (val) {
                  billingAddress = billingAddress.copyWith(province: val);
                },
              ),
              if (countries.isNotEmpty)
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
                      value: countries.first,
                      items: countries
                          .map((e) => DropdownMenuItem<Country>(
                                value: e,
                                child: Text(e.name?.capitalize ?? ''),
                              ))
                          .toList(),
                      onChanged: (Country? country) {
                        billingAddress =
                            billingAddress.copyWith(country: country);
                      },
                      validator: (val) {
                        if (sameAddress) {
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
