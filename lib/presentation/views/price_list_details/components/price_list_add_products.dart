import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/views/add_update_price_list/components/product_price_list.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
class PriceListAddProducts extends StatefulWidget {
  const PriceListAddProducts(this.products,{super.key});
  final List<Product> products;

  @override
  State<PriceListAddProducts> createState() => _PriceListAddProductsState();
}

class _PriceListAddProductsState extends State<PriceListAddProducts> {
  List<MoneyAmount> prices = [];
  List<Product> products = [];

  @override
  void initState() {
    products.addAll(widget.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: context.defaultSystemUiOverlayStyle,
        leading: const CloseButton(),
        title: const Text('Add Products'),
        actions: [
          TextButton(
            onPressed: () {
              if(prices.isEmpty){
                context.showSnackBar('Please add at least one price');
                return;
              }
              context.popRoute(prices);
            },
            child: const Text('Done'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        children: [
          ...widget.products.map((product) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                borderRadius:
                const BorderRadius.all(Radius.circular(6)),
                onTap: () async {
                  await showModalActionSheet<int>(
                      title: 'Manage Product',
                      message: product.title ?? '',
                      context: context,
                      actions: <SheetAction<int>>[
                        const SheetAction(
                            label: 'Edit prices', key: 0),
                        const SheetAction(
                            label: 'Remove',
                            isDestructiveAction: true,
                            key: 1),
                      ]).then((result) async {
                    switch (result) {
                      case 0:
                        final result =
                        await showBarModalBottomSheet(
                          backgroundColor: context.theme.scaffoldBackgroundColor,
                          overlayStyle: context
                              .theme.appBarTheme.systemOverlayStyle,
                          context: context,
                          builder: (context) =>
                              AddUpdateVariantsPriceView(
                                  product: product),
                        );
                        if (result is List<MoneyAmount>) {
                          prices.addAll(result);
                        }
                        return;
                      case 1:
                        products.removeWhere(
                                (element) => element.id == product.id);
                        return;
                    }
                  });
                },
                child: Ink(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  // margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(6))),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.title ?? '',
                          style: smallTextStyle),
                      const Icon(Icons.more_horiz)
                    ],
                  ),
                ),
              ),
              const Gap(6.0),
              if (product.variants != null &&
                  product.variants!.isNotEmpty)
                ...product.variants!.map((e) {
                  final priceCount = prices
                      .where((element) => element.variantId == e.id)
                      .toList()
                      .length;
                  if (priceCount == 0) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    margin: const EdgeInsets.only(
                        bottom: 10.0, left: 14),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(6))),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.title ?? '', style: smallTextStyle),
                        if (prices.isNotEmpty)
                          Text(
                              '${priceCount == 0 ? 'Add' : priceCount} prices',
                              style: smallTextStyle),
                      ],
                    ),
                  );
                }),
            ],
          )),
        ],
      ),
    );
  }
}
