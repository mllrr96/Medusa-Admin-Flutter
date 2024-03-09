import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/data/models/select_country_req.dart';
import 'package:medusa_admin/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductAttributes extends StatefulWidget {
  const ProductAttributes(
      {super.key, this.controller, this.onSaved, this.product});
  final FlexExpansionTileController? controller;
  final void Function(Product? product)? onSaved;
  final Product? product;
  @override
  State<ProductAttributes> createState() => _ProductAttributesState();
}

class _ProductAttributesState extends State<ProductAttributes> {
  final widthCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final midCodeCtrl = TextEditingController();
  final hsCodeCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final key = GlobalKey();
  String? originCountryIso;

  @override
  void initState() {
    if (widget.product != null) {
      widthCtrl.text = widget.product!.width?.toString() ?? '';
      lengthCtrl.text = widget.product!.length?.toString() ?? '';
      heightCtrl.text = widget.product!.height?.toString() ?? '';
      weightCtrl.text = widget.product!.weight?.toString() ?? '';
      midCodeCtrl.text = widget.product!.midCode ?? '';
      hsCodeCtrl.text = widget.product!.hsCode ?? '';
      originCountryIso = widget.product!.originCountry;
      countryCtrl.text = countries
              .firstWhereOrNull((element) =>
                  element.iso2 == widget.product?.originCountry?.toLowerCase())
              ?.displayName ??
          '';
    }
    super.initState();
  }

  @override
  void dispose() {
    widthCtrl.dispose();
    lengthCtrl.dispose();
    heightCtrl.dispose();
    weightCtrl.dispose();
    midCodeCtrl.dispose();
    hsCodeCtrl.dispose();
    countryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);

    return FormField<Product>(
      onSaved: (_) {
        widget.onSaved?.call(Product(
          width: double.tryParse(widthCtrl.text),
          length: double.tryParse(lengthCtrl.text),
          height: double.tryParse(heightCtrl.text),
          weight: double.tryParse(weightCtrl.text),
          midCode: midCodeCtrl.text,
          hsCode: hsCodeCtrl.text,
          originCountry: originCountryIso,
        ));
      },
      builder: (FormFieldState<Product> field) {
        return FlexExpansionTile(
          key: key,
          controller: widget.controller,
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await key.currentContext.ensureVisibility();
            }
          },
          title: const Text('Attributes'),
          child: Column(
            children: [
              Text('Used for shipping and customs purposes.',
                  style: smallTextStyle!.copyWith(color: manatee)),
              space,
              Row(
                children: [
                  Text('Dimensions', style: largeTextStyle),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LabeledNumericTextField(
                        controller: widthCtrl, label: 'Width'),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: LabeledNumericTextField(
                        controller: lengthCtrl, label: 'Length'),
                  ),
                ],
              ),
              space,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LabeledNumericTextField(
                        controller: heightCtrl, label: 'Height'),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: LabeledNumericTextField(
                        controller: weightCtrl, label: 'Weight'),
                  ),
                ],
              ),
              space,
              Row(
                children: [
                  Text('Customs', style: largeTextStyle),
                ],
              ),
              space,
              LabeledTextField(
                label: 'MID Code',
                controller: midCodeCtrl,
                hintText: 'XDSKLAD9999...',
              ),
              LabeledTextField(
                label: 'HS Code',
                controller: hsCodeCtrl,
                hintText: 'BDJSK39277W...',
              ),
              LabeledTextField(
                readOnly: true,
                onTap: () async {
                  final result = await showBarModalBottomSheet(
                      context: context,
                      // backgroundColor: Colors.transparent,
                      overlayStyle: context.defaultSystemUiOverlayStyle,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => SelectCountryView(
                            selectCountryReq:
                                SelectCountryReq(selectedCountries: [
                              countries.firstWhere(
                                  (element) =>
                                      element.iso2 ==
                                      widget.product?.originCountry
                                          ?.toLowerCase(),
                                  orElse: () => const Country(
                                      iso2: '',
                                      iso3: '',
                                      numCode: 0,
                                      name: '',
                                      displayName: ''))
                            ]),
                          ));
                  if (result is List<Country>) {
                    countryCtrl.text = result.first.displayName!;
                    originCountryIso = result.first.iso2;
                    setState(() {});
                  }
                },
                label: 'Country of origin',
                controller: countryCtrl,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Choose a country',
                  prefix: originCountryIso != null
                      ? Flag.fromString(originCountryIso!,
                          height: 16, width: 35)
                      : null,
                  suffixIcon: countryCtrl.text.isEmpty
                      ? const Icon(Icons.keyboard_arrow_down_outlined)
                      : IconButton(
                          onPressed: () {
                            countryCtrl.clear();
                            originCountryIso = null;
                            setState(() {});
                          },
                          icon: const Icon(CupertinoIcons.clear_circled_solid)),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
