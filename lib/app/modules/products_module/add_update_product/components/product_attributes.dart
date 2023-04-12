import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/country.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/countries/view/country_view.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/labeled_numeric_text_field.dart';
import '../controllers/add_update_product_controller.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({Key? key, this.onExpansionChanged}) : super(key: key);
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);

    return GetBuilder<AddUpdateProductController>(
      id: 3,
      builder: (controller) {
        return CustomExpansionTile(
          onExpansionChanged: onExpansionChanged,
          label: 'Attributes',
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
                final result =
                    await showBarModalBottomSheet(context: context, builder: (context) => const SelectCountryView());
                if (result is List<Country>) {
                  controller.countryCtrl.text = result.first.displayName!;
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
                    : AdaptiveIcon(
                        onPressed: () {
                          controller.countryCtrl.clear();
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
        );
      },
    );
  }
}
