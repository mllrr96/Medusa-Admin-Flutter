import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/countries/components/countries.dart';
import 'package:medusa_admin/presentation/widgets/countries/controller/country_controller.dart';
import 'package:medusa_admin/presentation/widgets/countries/view/country_view.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../controllers/add_update_product_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, this.onExpansionChanged});
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);

    return GetBuilder<AddUpdateProductController>(
      id: 3,
      builder: (controller) {
        return FlexExpansionTile(
          controller: controller.attributeTileCtrl,
          onExpansionChanged: onExpansionChanged,
          title: const Text('Attributes'),
          child: Column(
            children: [
              Text('Used for shipping and customs purposes.', style: smallTextStyle!.copyWith(color: lightWhite)),
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
                    child: LabeledNumericTextField(controller: controller.widthCtrl, label: 'Width'),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: LabeledNumericTextField(controller: controller.lengthCtrl, label: 'Length'),
                  ),
                ],
              ),
              space,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LabeledNumericTextField(controller: controller.heightCtrl, label: 'Height'),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: LabeledNumericTextField(controller: controller.weightCtrl, label: 'Weight'),
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
                controller: controller.midCodeCtrl,
                hintText: 'XDSKLAD9999...',
              ),
              LabeledTextField(
                label: 'HS Code',
                controller: controller.hsCodeCtrl,
                hintText: 'BDJSK39277W...',
              ),
              LabeledTextField(
                readOnly: true,
                onTap: () async {
                  final result = await showBarModalBottomSheet(
                      context: context,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                      builder: (context) => SelectCountryView(
                        selectCountryReq: SelectCountryReq(selectedCountries: [
                          countries.firstWhere(
                                  (element) => element.iso2 == controller.product.originCountry?.toLowerCase(),
                              orElse: () => const Country(iso2: '', iso3: '', numCode: 0, name: '', displayName: ''))
                        ]),
                      ));
                  if (result is List<Country>) {
                    controller.countryCtrl.text = result.first.displayName!;
                    controller.product = controller.product.copyWith(originCountry: result.first.iso2);
                    controller.update([3]);
                  }
                },
                label: 'Country of origin',
                controller: controller.countryCtrl,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Choose a country',
                  suffixIcon: controller.countryCtrl.text.isEmpty
                      ? const Icon(Icons.keyboard_arrow_down_outlined)
                      : IconButton(
                      onPressed: () {
                        controller.countryCtrl.clear();
                        controller.product = controller.product.copyWith.originCountry(null);
                        controller.update([3]);
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
