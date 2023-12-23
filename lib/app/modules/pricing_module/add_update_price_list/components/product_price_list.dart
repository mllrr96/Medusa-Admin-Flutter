import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/currency_formatter.dart';

class ProductPriceList extends StatefulWidget {
  const ProductPriceList({super.key, this.prices, required this.product});
  final List<MoneyAmount>? prices;
  final Product product;
  @override
  State<ProductPriceList> createState() => _ProductPriceListState();
}

class _ProductPriceListState extends State<ProductPriceList> {
  @override
  void initState() {
    for (Currency currency in StoreService.store.currencies!) {
      currencyCtrlMap.addAll({currency: TextEditingController()});
    }
    super.initState();
  }

  var applyToAll = false;

  List<ProductVariant>? get variants => widget.product.variants;

  List<ProductVariant> selectedVariants = [];
  List<MoneyAmount> prices = [];
  Map<Currency, TextEditingController> currencyCtrlMap = <Currency, TextEditingController>{};

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final currencies = StoreService.store.currencies!;
    const space = Gap(12);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: const Text('Edit Prices'),
          actions: [
            AdaptiveButton(
                onPressed: applyToAll || selectedVariants.isNotEmpty
                    ? () {
                        prices.clear();
                        for (var variant in selectedVariants) {
                          currencyCtrlMap.forEach((currency, textCtrl) {
                            if (textCtrl.text.isNotEmpty) {
                              final amount = int.tryParse(textCtrl.text.replaceAll(',', '').replaceAll('.', ''));
                              prices.add(
                                MoneyAmount(amount: amount ?? 0, variantId: variant.id!, currencyCode: currency.code, variant: variant),
                              );
                            }
                          });
                        }
                        context.popRoute(prices);
                      }
                    : null,
                child: const Text('Save'))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          children: [
            RadioListTile(
              dense: true,
              tileColor: context.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: !applyToAll ? ColorManager.primary : Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(!applyToAll ? 12 : 4)),
              ),
              value: false,
              onChanged: (val) => setState(() => applyToAll = false),
              title: const Text('Apply overrides on selected variants'),
              groupValue: applyToAll,
            ),
            const SizedBox(height: 6.0),
            RadioListTile(
              dense: true,
              tileColor: context.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: applyToAll ? ColorManager.primary : Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(applyToAll ? 12 : 4))),
              value: true,
              onChanged: (val) => setState(() => applyToAll = true),
              title: const Text('Apply on all variants'),
              groupValue: applyToAll,
            ),
            if (!applyToAll) const Divider(),
            if (!applyToAll)
              CustomExpansionTile(
                initiallyExpanded: true,
                title: Text('${widget.product.title ?? ''} Variants'),
                leading: Checkbox(
                  value: selectedVariants.length == variants?.length
                      ? true
                      : selectedVariants.isEmpty
                          ? false
                          : null,
                  onChanged: (bool? value) {
                    if (value == null) {
                      setState(() => selectedVariants.clear());
                      return;
                    }
                    setState(() {
                      if (value) {
                        selectedVariants.addAll(variants!);
                      } else {
                        selectedVariants.clear();
                      }
                    });
                  },
                  tristate: true,
                ),
                children: [
                  ListView.separated(
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: variants!.length,
                      itemBuilder: (context, index) {
                        final variant = variants?[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            // tileColor: context.theme.appBarTheme.backgroundColor,
                            title: Text(variant?.title ?? ''),
                            subtitle: variant?.sku != null
                                ? Text('SKU: ${variant!.sku}', style: smallTextStyle?.copyWith(color: manatee))
                                : null,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            value: selectedVariants.map((e) => e.id).toList().contains(variant?.id),
                            onChanged: (bool? value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                if (value) {
                                  selectedVariants.add(variant!);
                                } else {
                                  selectedVariants.removeWhere((v) => v.id == variant?.id);
                                }
                              });
                            },
                          ),
                        );
                      }),
                ],
              ),
            const Divider(),
            const Text('Prices'),
            space,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currencies.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                final currencyCtrl = currencyCtrlMap[currency];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: context.theme.appBarTheme.backgroundColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Text(currency.code?.toUpperCase() ?? '', style: mediumTextStyle),
                                const SizedBox(width: 12.0),
                                Expanded(
                                    child:
                                        Text(currency.name ?? '', style: mediumTextStyle!.copyWith(color: manatee)))
                              ],
                            ),
                          ),
                          Flexible(
                            child: TextField(
                              controller: currencyCtrl,
                              textDirection: TextDirection.rtl,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: [CurrencyTextInputFormatter(name: currency.code)],
                              decoration: InputDecoration(
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(currency.symbolNative ?? '',
                                        style: mediumTextStyle.copyWith(color: manatee))),
                                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                hintText: '-',
                                isDense: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
