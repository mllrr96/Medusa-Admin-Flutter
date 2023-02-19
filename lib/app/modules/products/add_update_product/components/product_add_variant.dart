import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/colors.dart';

class ProductAddVariant extends StatefulWidget {
  const ProductAddVariant({Key? key, required this.currencies, required this.options}) : super(key: key);
  final List<Currency> currencies;
  final List<ProductOption> options;
  @override
  State<ProductAddVariant> createState() => _ProductAddVariantState();
}

class _ProductAddVariantState extends State<ProductAddVariant> {
  final quantityCtrl = TextEditingController();
  final customTitleCtrl = TextEditingController();
  final materialCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final widthCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final midCtrl = TextEditingController();
  final hsCtrl = TextEditingController();
  final countryOfOriginCtrl = TextEditingController();
  final skuCtrl = TextEditingController();
  final eanCtrl = TextEditingController();
  final upcCtrl = TextEditingController();
  final barcodeCtrl = TextEditingController();

  Map<int, ProductOptionValue> selectedOptionsValue = {};
  bool manageInventory = true;
  bool allowBackorder = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          if (!_shouldShowWarning()) {
            Get.back();
            return false;
          }
          final result = await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes?',
              message: 'Are you sure you want to discard changes?',
              isDestructiveAction: true);
          switch (result) {
            case OkCancelResult.ok:
              return true;
            case OkCancelResult.cancel:
              return false;
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create Variant'),
              actions: [
                if (GetPlatform.isIOS) CupertinoButton(onPressed: () async => await save(), child: const Text('Save')),
                if (GetPlatform.isAndroid) TextButton(onPressed: () async => await save(), child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          maintainState: true,
                          initiallyExpanded: true,
                          expandedAlignment: Alignment.centerLeft,
                          childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          title: Row(
                            children: [
                              Text('General', style: largeTextStyle),
                              const Text(' *', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                          children: [
                            Text('Configure the general information for this variant.',
                                style: smallTextStyle!.copyWith(color: lightWhite)),
                            space,
                            ProductTextField(
                              label: 'Custom title',
                              controller: customTitleCtrl,
                              hintText: 'Green / XL',
                            ),
                            ProductTextField(
                              label: 'Material',
                              controller: materialCtrl,
                              hintText: '80% wool, 20% cotton',
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Text('Options', style: largeTextStyle),
                              ],
                            ),
                            space,
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final currentOption = widget.options[index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(currentOption.title!, style: mediumTextStyle!),
                                          Text(' *', style: mediumTextStyle.copyWith(color: Colors.red)),
                                        ],
                                      ),
                                      const SizedBox(height: 6.0),
                                      DropdownButtonFormField(
                                        validator: (val) {
                                          if (val == null) {
                                            return 'Field is required';
                                          }
                                          return null;
                                        },
                                        items: currentOption.values!
                                            .map((e) => DropdownMenuItem(value: e, child: Text(e.value!)))
                                            .toList(),
                                        hint: const Text('Choose an option'),
                                        onChanged: (value) {
                                          if (value != null) {
                                            selectedOptionsValue[index] = value;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, __) => space,
                                itemCount: widget.options.length)
                          ],
                        ),
                      ),
                      space,
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          expandedAlignment: Alignment.centerLeft,
                          childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          title: Text('Pricing', style: largeTextStyle),
                          children: [
                            Text('Configure the pricing for this variant.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            ...widget.currencies.map((currency) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(currency.code?.toUpperCase() ?? '', style: mediumTextStyle),
                                              const SizedBox(width: 12.0),
                                              Expanded(
                                                  child: Text(currency.name ?? '',
                                                      style: mediumTextStyle!.copyWith(color: lightWhite)))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 3,
                                          child: TextField(
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            decoration: InputDecoration(
                                              suffixIcon: Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: Text(currency.symbol ?? '',
                                                      style: mediumTextStyle.copyWith(color: lightWhite))),
                                              suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                              hintText: '-',
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                              ),
                                            ),
                                            style: smallTextStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  space,
                                ],
                              );
                            }).toList()
                          ],
                        ),
                      ),
                      space,
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          maintainState: true,
                          expandedAlignment: Alignment.centerLeft,
                          childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          title: Text('Stock & Inventory', style: largeTextStyle),
                          children: [
                            Text('Configure the inventory and stock for this variant.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Manage inventory', style: largeTextStyle),
                                Switch.adaptive(
                                  value: manageInventory,
                                  onChanged: (val) {
                                    setState(() {
                                      manageInventory = val;
                                    });
                                  },
                                  activeColor: ColorManager.primary,
                                )
                              ],
                            ),
                            Text('When checked Medusa will regulate the inventory when orders and returns are made.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Allow backorders', style: largeTextStyle),
                                Switch.adaptive(
                                    value: allowBackorder,
                                    onChanged: (val) {
                                      setState(() {
                                        allowBackorder = val;
                                      });
                                    },
                                    activeColor: ColorManager.primary)
                              ],
                            ),
                            Text(
                                'When checked the product will be available for purchase despite the product being sold out',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            ProductTextField(
                              label: 'Stock keeping unit (SKU)',
                              controller: TextEditingController(),
                              hintText: 'SUN-G, JK1234...',
                            ),
                            NumericTextField(
                              controller: quantityCtrl,
                              label: 'Quantity in stock',
                            ),
                            space,
                            ProductTextField(
                              label: 'EAN (Barcode)',
                              controller: eanCtrl,
                              hintText: '123456789123...',
                            ),
                            ProductTextField(
                              label: 'UPC (Barcode)',
                              controller: upcCtrl,
                              hintText: '023456789104',
                            ),
                            ProductTextField(
                              label: 'Barcode',
                              controller: barcodeCtrl,
                              hintText: '123456789104...',
                            ),
                          ],
                        ),
                      ),
                      space,
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          expandedAlignment: Alignment.centerLeft,
                          childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                          title: Text('Shipping', style: largeTextStyle),
                          children: [
                            Text(
                                'Shipping information can be required depending on your shipping provider, and whether or not you are shipping internationally.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            Row(
                              children: [
                                Text('Dimensions', style: largeTextStyle),
                              ],
                            ),
                            space,
                            Text('Configure to calculate the most accurate shipping rates.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumericTextField(controller: widthCtrl, label: 'Width', width: Get.width / 2.5),
                                NumericTextField(controller: lengthCtrl, label: 'Length', width: Get.width / 2.5),
                              ],
                            ),
                            space,
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumericTextField(controller: heightCtrl, label: 'Height', width: Get.width / 2.5),
                                NumericTextField(controller: weightCtrl, label: 'Weight', width: Get.width / 2.5),
                              ],
                            ),
                            space,
                            space,
                            Row(
                              children: [
                                Text('Customs', style: largeTextStyle),
                              ],
                            ),
                            space,
                            Text('Configure if you are shipping internationally.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            ProductTextField(
                              label: 'MID Code',
                              controller: midCtrl,
                              hintText: 'XDSKLAD9999...',
                            ),
                            ProductTextField(
                              label: 'HS Code',
                              controller: hsCtrl,
                              hintText: 'BDJSK39277W...',
                            ),
                            ProductTextField(
                              label: 'Country of origin',
                              controller: countryOfOriginCtrl,
                              hintText: 'Country of origin',
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
        ),
      ),
    );
  }

  bool _shouldShowWarning() {
    if (customTitleCtrl.text.removeAllWhitespace.isNotEmpty ||
        materialCtrl.text.removeAllWhitespace.isNotEmpty ||
        selectedOptionsValue.isNotEmpty ||
        skuCtrl.text.removeAllWhitespace.isNotEmpty ||
        quantityCtrl.text.removeAllWhitespace.isNotEmpty ||
        eanCtrl.text.removeAllWhitespace.isNotEmpty ||
        upcCtrl.text.removeAllWhitespace.isNotEmpty ||
        barcodeCtrl.text.removeAllWhitespace.isNotEmpty ||
        widthCtrl.text.removeAllWhitespace.isNotEmpty ||
        lengthCtrl.text.removeAllWhitespace.isNotEmpty ||
        heightCtrl.text.removeAllWhitespace.isNotEmpty ||
        weightCtrl.text.removeAllWhitespace.isNotEmpty ||
        midCtrl.text.removeAllWhitespace.isNotEmpty ||
        hsCtrl.text.removeAllWhitespace.isNotEmpty ||
        countryOfOriginCtrl.text.removeAllWhitespace.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    String variantTitle = '';
    List<ProductOptionValue> variantOptions = [];
    if (customTitleCtrl.text.removeAllWhitespace.isNotEmpty) {
      variantTitle = customTitleCtrl.text;
    } else {
      selectedOptionsValue.forEach((key, value) {
        variantOptions.add(value);
        if (variantTitle.isEmpty) {
          variantTitle = value.value!;
        } else {
          variantTitle = '$variantTitle / ${value.value!}';
        }
      });
    }
    Get.back(
      result: ProductVariant(
        prices: [],
        title: variantTitle,
        options: variantOptions,
        manageInventory: manageInventory,
        allowBackorder: allowBackorder,
        inventoryQuantity: int.tryParse(quantityCtrl.text),
        weight: int.tryParse(weightCtrl.text),
        length: int.tryParse(lengthCtrl.text),
        height: int.tryParse(heightCtrl.text),
        width: int.tryParse(widthCtrl.text),
        hsCode: hsCtrl.text.removeAllWhitespace.isEmpty ? null : hsCtrl.text,
        material: materialCtrl.text.removeAllWhitespace.isEmpty ? null : materialCtrl.text,
        sku: skuCtrl.text.removeAllWhitespace.isEmpty ? null : skuCtrl.text,
        ean: eanCtrl.text.removeAllWhitespace.isEmpty ? null : eanCtrl.text,
        upc: upcCtrl.text.removeAllWhitespace.isEmpty ? null : upcCtrl.text,
        barcode: barcodeCtrl.text.removeAllWhitespace.isEmpty ? null : barcodeCtrl.text,
        midCode: midCtrl.text.removeAllWhitespace.isEmpty ? null : midCtrl.text,
        originCountry: countryOfOriginCtrl.text.removeAllWhitespace.isEmpty ? null : countryOfOriginCtrl.text,
      ),
    );
  }
}

class NumericTextField extends StatelessWidget {
  const NumericTextField(
      {Key? key,
      required this.controller,
      this.onPlusPressed,
      this.onMinusPressed,
      required this.label,
      this.validator,
      this.hintText,
      this.width})
      : super(key: key);
  final TextEditingController controller;
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final double? width;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(label, style: mediumTextStyle!),
          ],
        ),
        const SizedBox(height: 6.0),
        SizedBox(
          width: width,
          child: TextFormField(
            style: smallTextStyle,
            validator: validator,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: see if InkWell or GestureDetector is better than IconButton (too much padding, looks bad on small phones e.g. iPhone X)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        // padding: EdgeInsets.zero,
                        onTap: onMinusPressed ??
                            () {
                              int? stock = int.tryParse(controller.text.removeAllWhitespace);
                              if (stock != null && stock != 0) {
                                controller.text = (stock - 1).toString();
                              }
                            },
                        child: const Icon(Icons.remove)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        // padding: EdgeInsets.zero,
                        onTap: onPlusPressed ??
                            () {
                              int? stock = int.tryParse(controller.text.removeAllWhitespace);
                              if (stock != null) {
                                controller.text = (stock + 1).toString();
                              } else {
                                controller.text = 1.toString();
                              }
                            },
                        child: const Icon(Icons.add)),
                  ),
                ],
              ),
              hintText: hintText ?? '100...',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
