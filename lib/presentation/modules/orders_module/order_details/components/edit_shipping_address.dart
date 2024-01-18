import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
class EditAddress extends StatefulWidget {
  const EditAddress(
      {super.key,
      required this.shippingAddress,
      required this.countries,
      required this.context,
      this.appbarTitle});
  final Address shippingAddress;
  final List<Country> countries;
  final BuildContext context;
  final String? appbarTitle;
  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final contactKey = GlobalKey();
  final locationKey = GlobalKey();
  final metadataKey = GlobalKey();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final address1Ctrl = TextEditingController();
  final address2Ctrl = TextEditingController();
  final postalCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Country? selectedCountry;
  late Address address;

  @override
  void initState() {
    address = widget.shippingAddress;
    firstNameCtrl.text = address.firstName ?? '';
    lastNameCtrl.text = address.lastName ?? '';
    companyCtrl.text = address.company ?? '';
    phoneCtrl.text = address.phone?.toString() ?? '';
    address1Ctrl.text = address.address1 ?? '';
    address2Ctrl.text = address.address2 ?? '';
    postalCodeCtrl.text = address.postalCode ?? '';
    cityCtrl.text = address.city ?? '';
    provinceCtrl.text = address.province ?? '';
    selectedCountry = address.country;
    super.initState();
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    companyCtrl.dispose();
    phoneCtrl.dispose();
    address1Ctrl.dispose();
    address2Ctrl.dispose();
    postalCodeCtrl.dispose();
    cityCtrl.dispose();
    provinceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    const halfSpace = Gap(6);
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;

    bool sameAddress() {
      if (firstNameCtrl.text == address.firstName &&
          lastNameCtrl.text == address.lastName &&
          companyCtrl.text == address.company &&
          phoneCtrl.text == address.phone &&
          address1Ctrl.text == address.address1 &&
          address2Ctrl.text == address.address2 &&
          postalCodeCtrl.text == address.postalCode &&
          cityCtrl.text == address.city &&
          provinceCtrl.text == address.province &&
          selectedCountry?.iso2 == address.countryCode) {
        return true;
      }
      return false;
    }

    return GestureDetector(
      onTap: () => context.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(widget.appbarTitle ?? 'Update Address'),
          actions: [
            TextButton(
                onPressed: () {
                  if (sameAddress()) {
                    context.popRoute();
                    return;
                  }
                  final address = Address(
                    firstName: firstNameCtrl.text,
                    lastName: lastNameCtrl.text,
                    company: companyCtrl.text,
                    phone: phoneCtrl.text,
                    address1: address1Ctrl.text,
                    address2: address2Ctrl.text,
                    postalCode: postalCodeCtrl.text,
                    city: cityCtrl.text,
                    province: provinceCtrl.text,
                    countryCode: selectedCountry?.iso2,
                  );
                  context.popRoute(address);
                },
                child: const Text('Save'))
          ],
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                FlexExpansionTile(
                  key: contactKey,
                  title: const Text('Contact'),
                  initiallyExpanded: true,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await contactKey.currentContext.ensureVisibility();
                    }
                  },
                  child: Column(
                    children: [
                      LabeledTextField(
                          label: 'First Name',
                          hintText: 'First Name',
                          controller: firstNameCtrl),
                      LabeledTextField(
                          label: 'Last Name',
                          hintText: 'Last Name',
                          controller: lastNameCtrl),
                      LabeledTextField(
                          label: 'Company',
                          hintText: 'Company',
                          controller: companyCtrl),
                      LabeledTextField(
                        label: 'Phone',
                        hintText: 'Phone',
                        controller: phoneCtrl,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                space,
                FlexExpansionTile(
                  key: locationKey,
                  title: const Text('Location'),
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await locationKey.currentContext.ensureVisibility();
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabeledTextField(
                          label: 'Address 1',
                          hintText: 'Address 1',
                          controller: address1Ctrl),
                      LabeledTextField(
                          label: 'Address 2',
                          hintText: 'Address 2',
                          controller: address2Ctrl),
                      LabeledTextField(
                          label: 'Postal Code',
                          hintText: 'Postal Code',
                          controller: postalCodeCtrl),
                      LabeledTextField(
                          label: 'City',
                          hintText: 'City',
                          controller: cityCtrl),
                      LabeledTextField(
                          label: 'Province',
                          hintText: 'Province',
                          controller: provinceCtrl),
                      Text(
                        'Country',
                        style: mediumTextStyle,
                      ),
                      halfSpace,
                      DropdownButtonFormField<int>(
                        style: context.bodyMedium,
                        items: widget.countries
                            .map((e) => DropdownMenuItem<int>(
                                  value: e.numCode,
                                  child: Text(e.name ?? ''),
                                ))
                            .toList(),
                        hint: Text('Select',
                            style: smallTextStyle?.copyWith(color: manatee)),
                        value: selectedCountry?.numCode,
                        onChanged: (val) {
                          if (val == null) return;
                          setState(() {
                            selectedCountry = countries.firstWhere(
                                (element) => element.numCode == val);
                          });
                        },
                      ),
                      space,
                    ],
                  ),
                ),
                FlexExpansionTile(
                  key: metadataKey,
                  title: const Text('Metadata'),
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await metadataKey.currentContext.ensureVisibility();
                    }
                  },
                ),
                space,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
