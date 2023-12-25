import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/components/labeled_numeric_text_field.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../components/currency_formatter.dart';
import 'create_gift_card_controller.dart';

class CreateGiftCardView extends StatelessWidget {
  const CreateGiftCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateGiftCardController>(
      init: CreateGiftCardController(productsRepo: ProductsRepo()),
      builder: (controller) {
        // print(controller.denominations.length);
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: const Text('Create Gift Card'),
              actions: [
                AdaptiveButton(onPressed: () async => await controller.createGiftCard(context), child: const Text('Create'))
              ],
            ),
            body: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
                            controller: controller.nameCtrl,
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                            itemCount: controller.denominations.length,
                            itemBuilder: (context, index) {
                              // print('Index is:' + index.toString());
                              return DenominationWidget(
                                index,
                                key: Key(index.toString()),
                              );
                            }),
                        Center(
                          child: AdaptiveButton(
                            onPressed: () {
                              controller.denominations.add((null, null, controller.denominations.length));
                              controller.update();
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
        );
      },
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

  List<Currency> get currencies => StoreService.store.currencies!;
  Currency? selectedCurrency =
      StoreService.store.currencies!.isNotEmpty ? StoreService.store.currencies!.first : Currency(code: 'usd');
  var textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var controller = CreateGiftCardController.instance;
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
                    controller.denominations[widget.index] = (currency, textCtrl.text, widget.index);
                  });
                },
                validator: (currency) {
                  if (currency == null) {
                    return 'Field is required';
                  }
                  return null;
                },
                items: currencies.map((e) => DropdownMenuItem<Currency>(value: e, child: Text(e.name ?? ''))).toList(),
                decoration: const InputDecoration(hintText: 'Currency'),
              ),
            ),
            const SizedBox(width: 12.0),
            Flexible(
                child: Center(
                    child: AdaptiveIcon(
                        onPressed: () {
                          // print(controller.denominations.length);
                          setState(() {
                            controller.denominations.removeAt(widget.index);
                            controller.update();
                          });
                          // controller.denominations.removeWhere((element) => element.$3 == widget.index);
                        },
                        icon: const Icon(Icons.delete_forever, color: Colors.red)))),
          ],
        ),
        const SizedBox(height: 6.0),
        LabeledNumericTextField(
          label: null,
          hintText: 'Amount',
          controller: textCtrl,
          onChanged: (val) {
            controller.denominations[widget.index] = (selectedCurrency, val, widget.index);
          },
          prefixText: '    ${NumberFormat.simpleCurrency(name:selectedCurrency?.code?.toUpperCase()).currencySymbol} | ',
          noEndSpace: true,
          inputFormatters: [if (selectedCurrency != null) CurrencyTextInputFormatter(name: selectedCurrency!.code)],
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
