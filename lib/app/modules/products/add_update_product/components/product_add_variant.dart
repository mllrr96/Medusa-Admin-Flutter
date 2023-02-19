import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../data/models/store/currency.dart';
import '../../../../data/models/store/product_option.dart';

class ProductAddVariant extends StatefulWidget {
  const ProductAddVariant({Key? key, required this.currencies, required this.options}) : super(key: key);
  final List<Currency> currencies;
  final List<ProductOption> options;
  @override
  State<ProductAddVariant> createState() => _ProductAddVariantState();
}

class _ProductAddVariantState extends State<ProductAddVariant> {
  final quantityCtrl = TextEditingController();
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
          bool shouldClose = true;
          await showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: const Text('Should Close?'),
                    actions: <Widget>[
                      CupertinoButton(
                        child: const Text('No'),
                        onPressed: () {
                          shouldClose = false;
                          Get.back();
                        },
                      ),
                      CupertinoButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          shouldClose = true;
                          Get.back();
                        },
                      ),
                    ],
                  ));
          return shouldClose;
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create Variant'),
              actions: [
                if (GetPlatform.isIOS)
                  CupertinoButton(
                      onPressed: () {
                        // TODO: complete product variant
                        Get.back(result: ProductVariant());
                      },
                      child: const Text('Save')),
                if (GetPlatform.isAndroid) TextButton(onPressed: () {}, child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                controller: ModalScrollController.of(context),
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      maintainState: true,
                      expandedAlignment: Alignment.centerLeft,
                      childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      title: Row(
                        children: [
                          Text('General', style: largeTextStyle),
                          const Text('*', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                      children: [
                        Text('Configure the general information for this variant.',
                            style: smallTextStyle!.copyWith(color: lightWhite)),
                        space,
                        ProductTextField(
                          label: 'Custom title',
                          controller: TextEditingController(),
                          hintText: 'Green / XL',
                        ),
                        ProductTextField(
                          label: 'Material',
                          controller: TextEditingController(),
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
                                      Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(height: 6.0),
                                  DropdownButtonFormField(
                                    items: currentOption.values!
                                        .map((e) => DropdownMenuItem(value: e, child: Text(e.value!)))
                                        .toList(),
                                    hint: const Text('Choose an option'),
                                    onChanged: (value) {},
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
                              value: true,
                              onChanged: (val) {},
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
                            Switch.adaptive(value: false, onChanged: (val) {}, activeColor: ColorManager.primary)
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
                        Row(
                          children: [
                            Text('Quantity in stock', style: mediumTextStyle!),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        TextFormField(
                          style: smallTextStyle,
                          controller: quantityCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      int? stock = int.tryParse(quantityCtrl.text.removeAllWhitespace);
                                      if (stock != null && stock != 0) {
                                        quantityCtrl.text = (stock - 1).toString();
                                      }
                                    },
                                    icon: const Icon(Icons.remove)),
                                IconButton(
                                    onPressed: () {
                                      int? stock = int.tryParse(quantityCtrl.text.removeAllWhitespace);
                                      if (stock != null) {
                                        quantityCtrl.text = (stock + 1).toString();
                                      } else {
                                        quantityCtrl.text = 1.toString();
                                      }
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                            hintText: '100...',
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                          ),
                        ),
                        space,
                        ProductTextField(
                          label: 'EAN (Barcode)',
                          controller: TextEditingController(),
                          hintText: '123456789123...',
                        ),
                        ProductTextField(
                          label: 'UPC (Barcode)',
                          controller: TextEditingController(),
                          hintText: '023456789104',
                        ),
                        ProductTextField(
                          label: 'Barcode',
                          controller: TextEditingController(),
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
                            ProductTextField(
                                label: 'Width',
                                controller: TextEditingController(),
                                width: Get.width / 3,
                                keyboardType: TextInputType.number,
                                hintText: '100...'),
                            ProductTextField(
                                label: 'Length',
                                controller: TextEditingController(),
                                width: Get.width / 3,
                                keyboardType: TextInputType.number,
                                hintText: '100...'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductTextField(
                                label: 'Height',
                                controller: TextEditingController(),
                                width: Get.width / 3,
                                keyboardType: TextInputType.number,
                                hintText: '100...'),
                            ProductTextField(
                                label: 'Weight',
                                controller: TextEditingController(),
                                width: Get.width / 3,
                                keyboardType: TextInputType.number,
                                hintText: '100...'),
                          ],
                        ),
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
                          controller: TextEditingController(),
                          hintText: 'XDSKLAD9999...',
                        ),
                        ProductTextField(
                          label: 'HS Code',
                          controller: TextEditingController(),
                          hintText: 'BDJSK39277W...',
                        ),
                        ProductTextField(
                          label: 'Country of origin',
                          controller: TextEditingController(),
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
    );
  }
}
