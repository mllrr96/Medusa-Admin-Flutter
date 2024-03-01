import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';

@RoutePage()
class AddUpdateVariantsPriceView extends StatefulWidget {
  const AddUpdateVariantsPriceView(
      {super.key, this.prices, required this.product});
  final List<MoneyAmount>? prices;
  final Product product;
  @override
  State<AddUpdateVariantsPriceView> createState() =>
      _AddUpdateVariantsPriceViewState();
}

class _AddUpdateVariantsPriceViewState
    extends State<AddUpdateVariantsPriceView> {
  @override
  void initState() {
    final currencies = context
        .read<StoreBloc>()
        .state
        .mapOrNull(loaded: (_) => _.store.currencies);
    widget.product.variants?.forEach((variant) {
      if (currencies != null) {
        for (Currency currency in currencies) {
          priceListVariants.add(PriceListVariant(
              textCtrl: TextEditingController(),
              variant: variant,
              currency: currency));
        }
      }
    });
    if (widget.prices?.isNotEmpty ?? false) {
      for (var element in widget.prices!) {
        final variantId = element.variantId;
        final currencyCode = element.currencyCode;
        final priceListVariant = priceListVariants.firstWhereOrNull(
            (e) => e.variantId == variantId && e.currencyCode == currencyCode);
        priceListVariant?.textCtrl.text =
            element.amount?.formatAsPrice(currencyCode) ?? '';
      }
    }
    super.initState();
  }

  List<ProductVariant>? get variants => widget.product.variants;

  List<PriceListVariant> priceListVariants = [];

  List<MoneyAmount> prices = [];
  // Map<Currency, TextEditingController> currencyCtrlMap =
  //     <Currency, TextEditingController>{};
  // Map<String, List<TextEditingController>> variantCtrlMap =
  //     <String, List<TextEditingController>>{};

  @override
  void dispose() {
    for (var element in priceListVariants) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);

    List<Widget> children = [];

    variants?.forEach((variant) {
      children.add(FlexExpansionTile(
        title: Text(variant.title ?? ''),
        initiallyExpanded: variants?.length == 1,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: priceListVariants
              .where((e) => e.variantId == variant.id)
              .toList()
              .length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final list = priceListVariants
                .where((e) => e.variantId == variant.id)
                .toList();
            final currency = list[index].currency;
            final currencyCtrl = list[index].textCtrl;
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: context.theme.appBarTheme.backgroundColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Text(currency.code?.toUpperCase() ?? '',
                                style: mediumTextStyle),
                            const SizedBox(width: 12.0),
                            Expanded(
                                child: Text(currency.name ?? '',
                                    style: mediumTextStyle!
                                        .copyWith(color: manatee)))
                          ],
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: currencyCtrl,
                          textDirection: TextDirection.rtl,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            CurrencyTextInputFormatter(name: currency.code)
                          ],
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(currency.symbolNative ?? '',
                                    style: mediumTextStyle.copyWith(
                                        color: manatee))),
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                            hintText: '-',
                            isDense: true,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
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
      ));
      children.add(const Gap(5.0));
    });
    return HideKeyboard(
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Edit Prices'),
          actions: [
            TextButton(
                onPressed: () {
                  prices.clear();
                  for (var element in priceListVariants) {
                    if (element.textCtrl.text.isNotEmpty) {
                      final amount = int.tryParse(element.textCtrl.text
                          .replaceAll(RegExp('[^0-9]'), ''));
                      prices.add(
                        MoneyAmount(
                            amount: amount ?? 0,
                            variantId: element.variantId,
                            currencyCode: element.currencyCode,
                            variant: variants
                                ?.where((variant) =>
                                    variant.id == element.variantId)
                                .firstOrNull),
                      );
                    }
                  }
                  context.popRoute(prices);
                },
                child: const Text('Save'))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}

class PriceListVariant {
  final TextEditingController textCtrl;
  final ProductVariant variant;
  final Currency currency;
  PriceListVariant(
      {required this.textCtrl, required this.variant, required this.currency});
  void dispose() {
    textCtrl.dispose();
  }

  String get variantId => variant.id!;
  String get currencyCode => currency.code!;
}
