import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class CreateProductGiftCardView extends StatefulWidget {
  const CreateProductGiftCardView({super.key});

  @override
  State<CreateProductGiftCardView> createState() =>
      _CreateProductGiftCardViewState();
}

class _CreateProductGiftCardViewState extends State<CreateProductGiftCardView> {
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var denominations = <(Currency? currency, String? amount, int index)>[];
  late ProductCrudBloc productCrudBloc;
  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    super.initState();
  }

  @override
  void dispose() {
    productCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCrudBloc, ProductCrudState>(
      bloc: productCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) {
            loading();
          },
          error: (error) {
            dismissLoading();
            context.showSnackBar(error.failure.toSnackBarString());
          },
          product: (product) {
            dismissLoading();
            context.showSnackBar('Gift Card Created');
            context.maybePop();
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Create Gift Card'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    productCrudBloc.add(
                      ProductCrudEvent.create(
                        PostProductReq(
                          product: Product(
                            title: nameCtrl.text,
                            isGiftCard: true,
                            discountable: false,
                            status: ProductStatus.published,
                            options: [
                              const ProductOption(
                                title: 'Denomination',
                                productId: null,
                              )
                            ],
                            variants: denominations.map((e) {
                              return ProductVariant(
                                  title:
                                      (denominations.indexOf(e) + 1).toString(),
                                  inventoryQuantity: 0,
                                  manageInventory: false,
                                  allowBackorder: false,
                                  prices: [
                                    MoneyAmount(
                                      amount: int.tryParse(e.$2
                                                  ?.replaceAll(',', '')
                                                  .replaceAll('.', '') ??
                                              '') ??
                                          0,
                                      currencyCode: e.$1?.code,
                                    ),
                                  ],
                                  options: [
                                    ProductOptionValue(
                                      value: e.$2,
                                      optionId: null,
                                      variantId: null,
                                    )
                                  ]);
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Create'))
            ],
          ),
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: context.theme.appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Text('Gift Card Details'),
                      ),
                      LabeledTextField(
                          label: 'Name',
                          controller: nameCtrl,
                          hintText: 'The best Gift Card',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          required: true),
                      LabeledTextField(
                        label: 'Description',
                        controller: TextEditingController(),
                        hintText: 'The best Gift Card of all time',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: context.theme.appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Text('Denominations'),
                      ),
                      ListView.separated(
                          separatorBuilder: (_, __) => const Divider(),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: denominations.length,
                          itemBuilder: (context, index) {
                            // print('Index is:' + index.toString());
                            return DenominationWidget(
                              index,
                              key: Key(index.toString()),
                            );
                          }),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            denominations
                                .add((null, null, denominations.length));
                            setState(() {});
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add),
                              Text('Add Denomination'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DenominationWidget extends StatefulWidget {
  const DenominationWidget(this.index, {super.key});
  final int index;

  @override
  State<DenominationWidget> createState() => _DenominationWidgetState();
}

class _DenominationWidgetState extends State<DenominationWidget> {
  @override
  void dispose() {
    textCtrl.dispose();
    super.dispose();
  }

  var textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        List<Currency>? currencies =
            state.mapOrNull(loaded: (_) => _.store.currencies);
        Currency? selectedCurrency = (currencies?.isNotEmpty ?? false)
            ? currencies?.firstOrNull
            : const Currency(code: 'usd');
        return Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: DropdownButtonFormField<Currency>(
                    style: context.bodyMedium,
                    value: selectedCurrency,
                    disabledHint: const Text('No options'),
                    onChanged: (currency) {
                      setState(() {
                        selectedCurrency = currency;
                        // denominations[widget.index] =
                        //     (currency, textCtrl.text, widget.index);
                      });
                    },
                    validator: (currency) {
                      if (currency == null) {
                        return 'Field is required';
                      }
                      return null;
                    },
                    items: currencies
                        ?.map((e) => DropdownMenuItem<Currency>(
                            value: e, child: Text(e.name ?? '')))
                        .toList(),
                    decoration: const InputDecoration(hintText: 'Currency'),
                  ),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              // print(controller.denominations.length);
                              // setState(() {
                              //   controller.denominations.removeAt(widget.index);
                              //   controller.update();
                              // });
                              // controller.denominations.removeWhere((element) => element.$3 == widget.index);
                            },
                            icon: const Icon(Icons.delete_forever,
                                color: Colors.red)))),
              ],
            ),
            const SizedBox(height: 6.0),
            LabeledNumericTextField(
              label: null,
              hintText: 'Amount',
              controller: textCtrl,
              onChanged: (val) {
                // controller.denominations[widget.index] =
                //     (selectedCurrency, val, widget.index);
              },
              prefixText:
                  '    ${selectedCurrency?.code.getCurrencySymbol} | ',
              noEndSpace: true,
              inputFormatters: [
                if (selectedCurrency != null)
                  CurrencyTextInputFormatter(name: selectedCurrency!.code)
              ],
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
