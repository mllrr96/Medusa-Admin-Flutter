import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/countries/components/countries.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';

import '../../../../data/models/store/address.dart';
import '../../../../data/models/store/country.dart';

class EditShippingAddress extends StatefulWidget {
  const EditShippingAddress({Key? key, required this.shippingAddress, required this.countries, required this.context})
      : super(key: key);
  final Address shippingAddress;
  final List<Country> countries;
  final BuildContext context;
  @override
  State<EditShippingAddress> createState() => _EditShippingAddressState();
}

class _EditShippingAddressState extends State<EditShippingAddress> {
  final scrollController = ScrollController();
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
  late Address shippingAddress;

  @override
  void initState() {
    shippingAddress = widget.shippingAddress;
    firstNameCtrl.text = shippingAddress.firstName ?? '';
    lastNameCtrl.text = shippingAddress.lastName ?? '';
    companyCtrl.text = shippingAddress.company ?? '';
    phoneCtrl.text = shippingAddress.phone?.toString() ?? '';
    address1Ctrl.text = shippingAddress.address1 ?? '';
    address2Ctrl.text = shippingAddress.address2 ?? '';
    postalCodeCtrl.text = shippingAddress.postalCode ?? '';
    cityCtrl.text = shippingAddress.city ?? '';
    provinceCtrl.text = shippingAddress.province ?? '';
    selectedCountry = shippingAddress.country;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
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
    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final lightWhite = isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then(
        (value) async {
          final yPosition =
              (globalKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero).dy ?? 0.0;
          var topPadding = widget.context.mediaQueryPadding.top + kToolbarHeight;
          final scrollPoint = scrollController.offset + yPosition - topPadding;
          if (scrollPoint <= scrollController.position.maxScrollExtent) {
            await scrollController.animateTo(scrollPoint,
                duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
          } else {
            await scrollController.animateTo(scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
          }
        },
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: const Text('Shipping Address'),
          actions: [AdaptiveButton(onPressed: () {}, child: const Text('Save'))],
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                CustomExpansionTile(
                  key: contactKey,
                  label: 'Contact',
                  initiallyExpanded: true,
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await scrollToSelectedContent(globalKey: contactKey);
                    }
                  },
                  children: [
                    LabeledTextField(label: 'First Name', hintText: 'First Name', controller: firstNameCtrl),
                    LabeledTextField(label: 'Last Name', hintText: 'Last Name', controller: lastNameCtrl),
                    LabeledTextField(label: 'Company', hintText: 'Company', controller: companyCtrl),
                    LabeledTextField(label: 'Phone', hintText: 'Phone', controller: phoneCtrl),
                  ],
                ),
                space,
                CustomExpansionTile(
                  key: locationKey,
                  label: 'Location',
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await scrollToSelectedContent(globalKey: locationKey);
                    }
                  },
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledTextField(label: 'Address 1', hintText: 'Address 1', controller: address1Ctrl),
                    LabeledTextField(label: 'Address 2', hintText: 'Address 2', controller: address2Ctrl),
                    LabeledTextField(label: 'Postal Code', hintText: 'Postal Code', controller: postalCodeCtrl),
                    LabeledTextField(label: 'City', hintText: 'City', controller: cityCtrl),
                    LabeledTextField(label: 'Province', hintText: 'Province', controller: provinceCtrl),
                    Text(
                      'Country',
                      style: mediumTextStyle,
                    ),
                    halfSpace,
                    DropdownButtonFormField<int>(
                      items: widget.countries
                          .map((e) => DropdownMenuItem<int>(
                                value: e.numCode,
                                child: Text(e.name ?? ''),
                              ))
                          .toList(),
                      hint: Text('Select', style: smallTextStyle?.copyWith(color: lightWhite)),
                      style: smallTextStyle,
                      value: selectedCountry?.numCode,
                      onChanged: (val) {
                        if (val == null) return;
                        setState(() {
                          selectedCountry = countries.firstWhere((element) => element.numCode == val);
                        });
                      },
                    ),
                    space,
                  ],
                ),
                space,
                CustomExpansionTile(
                  key: metadataKey,
                  label: 'Metadata',
                  onExpansionChanged: (expanded) async {
                    if (expanded) {
                      await scrollToSelectedContent(globalKey: metadataKey);
                    }
                  },
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
