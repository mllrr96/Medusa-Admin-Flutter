import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../data/models/store/currency.dart';

class ProductAddVariant extends StatelessWidget {
  const ProductAddVariant({Key? key, required this.currencies}) : super(key: key);
  final List<Currency> currencies;
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
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          shouldClose = true;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ));
          return shouldClose;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Variant'),
            actions: [
              if (GetPlatform.isIOS) CupertinoButton(onPressed: () {}, child: const Text('Save')),
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
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  title: Row(
                    children: [
                      Text('General', style: largeTextStyle),
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  children: [
                    Text('Configure the general information for this variant.',
                        style: smallTextStyle!.copyWith(color: lightWhite)),
                    space,
                    ProductTextField(label: 'Custom title', controller: TextEditingController()),
                    ProductTextField(label: 'Material', controller: TextEditingController()),
                    Divider(),
                    Row(
                      children: [
                        Text('Options', style: largeTextStyle),
                      ],
                    ),
                    space,
                    ProductTextField(label: 'Color', controller: TextEditingController()),
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
                    Text('Configure the pricing for this variant.', style: smallTextStyle.copyWith(color: lightWhite)),
                    space,
                    ...currencies.map((currency) {
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
                                      SizedBox(width: 12.0),
                                      Expanded(child: Text(currency.name ?? '', style: mediumTextStyle!.copyWith(color: lightWhite)))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 3,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon:
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                              child: Text(currency.symbol ?? '', style: mediumTextStyle.copyWith(color: lightWhite))),
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
            ],
          )),
        ),
      ),
    );
  }
}
