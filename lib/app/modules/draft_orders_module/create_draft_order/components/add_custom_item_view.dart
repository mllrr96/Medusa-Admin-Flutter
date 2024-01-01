import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/labeled_numeric_text_field.dart';

class AddCustomItemView extends StatefulWidget {
  const AddCustomItemView({super.key, this.currencyCode});
  final String? currencyCode;

  @override
  State<AddCustomItemView> createState() => _AddCustomItemViewState();
}

class _AddCustomItemViewState extends State<AddCustomItemView> {
  final titleCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final quantityCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleCtrl.dispose();
    priceCtrl.dispose();
    quantityCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom == 0
        ? (20.0 + MediaQuery.of(context).viewInsets.bottom)
        : MediaQuery.of(context).viewPadding.bottom +
            MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => context.unfocus(),
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                leading: const AdaptiveCloseButton(),
                title: const Text('Add Custom Item'),
                actions: [
                  AdaptiveButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        context.popRoute(LineItem(
                          title: titleCtrl.text,
                          quantity: int.tryParse(quantityCtrl.text),
                          unitPrice: int.tryParse(priceCtrl.text
                              .replaceAll('.', '')
                              .replaceAll(',', '')),
                        ));
                      },
                      child: const Text('Add'))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    LabeledTextField(
                      label: 'Title',
                      hintText: 'E.g. Gift wrapping',
                      required: true,
                      controller: titleCtrl,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: LabeledTextField(
                          readOnly: true,
                          label: 'Currency',
                          controller: TextEditingController(
                              text: widget.currencyCode?.toUpperCase()),
                        )),
                        const SizedBox(width: 12.0),
                        Flexible(
                            flex: 4,
                            child: LabeledNumericTextField(
                              label: 'Price',
                              controller: priceCtrl,
                              onPlusPressed: () {
                                var text = priceCtrl.text;
                                text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                var val = int.tryParse(text);
                                val ??= 0;
                                priceCtrl.text = (val + 1).formatAsPrice(
                                    widget.currencyCode,
                                    includeSymbol: false);
                              },
                              onMinusPressed: () {
                                var text = priceCtrl.text;
                                text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                var val = int.tryParse(text);
                                val ??= 0;
                                if (val == 1) {
                                  return;
                                }
                                priceCtrl.text = (val - 1).formatAsPrice(
                                    widget.currencyCode,
                                    includeSymbol: false);
                              },
                              inputFormatters: [
                                CurrencyTextInputFormatter(
                                    name: widget.currencyCode)
                              ],
                              validator: (val) {
                                if (val == null ||
                                    val.isEmpty ||
                                    int.tryParse(val
                                            .replaceAll('.', '')
                                            .replaceAll(',', '')) ==
                                        null) {
                                  return 'Price is required';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                    LabeledNumericTextField(
                      label: 'Quantity',
                      controller: quantityCtrl,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: bottomViewPadding),
            ],
          ),
        ),
      ),
    );
  }
}
