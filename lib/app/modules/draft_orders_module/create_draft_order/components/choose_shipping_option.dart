import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/shipping_option_res.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/labeled_numeric_text_field.dart';

class ChooseShippingOptionView extends StatefulWidget {
  const ChooseShippingOptionView(
      {super.key, this.onShippingOptionChanged, required this.region});

  final void Function(ShippingOption?)? onShippingOptionChanged;
  final Region? region;

  @override
  State<ChooseShippingOptionView> createState() =>
      _ChooseShippingOptionViewState();
}

class _ChooseShippingOptionViewState extends State<ChooseShippingOptionView> {
  @override
  void didUpdateWidget(covariant ChooseShippingOptionView oldWidget) {
    if (oldWidget.region?.id != widget.region?.id) {
      shippingOptionsFuture = ShippingOptionsRepo().retrieveAll(queryParams: {
        'is_return': false,
        'region_id': widget.region?.id,
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  ShippingOption? shippingOption;
  ShippingOption? customShippingOption;
  bool isCustomPrice = false;
  final customPriceCtrl = TextEditingController();

  late Future<Result<UserRetrieveAllShippingOptionRes, Failure>>
      shippingOptionsFuture;

  @override
  void initState() {
    if (widget.region != null) {
      shippingOptionsFuture = ShippingOptionsRepo().retrieveAll(queryParams: {
        'is_return': false,
        'region_id': widget.region?.id,
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    if (widget.region == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Shipping Option', style: smallTextStyle),
          space,
          DropdownButtonFormField<ShippingOption>(
            style: context.bodyMedium,
            validator: (val) {
              if (val == null) {
                return 'Field is required';
              }
              return null;
            },
            items: const [],
            hint: const Text('Choose region first'),
            onChanged: (val) {},
          ),
        ],
      );
    }
    return FutureBuilder<Result<UserRetrieveAllShippingOptionRes, Failure>>(
        future: shippingOptionsFuture,
        builder: (context, asyncSnapshot) {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Skeletonizer(
                enabled: true,
                child: LabeledTextField(
                  label: 'Choose Shipping Option',
                  controller: null,
                  decoration: InputDecoration(
                    hintText: 'Fake Shipping Option - 15 USD',
                    suffixIcon: Icon(Icons.add),
                  ),
                ),
              );
            case ConnectionState.done:
              final result = asyncSnapshot.data;
              if (result == null) {
                return const Center(
                    child: Text('Error loading shipping options'));
              }
              return result.when((success) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose Shipping Option', style: smallTextStyle),
                    space,
                    DropdownButtonFormField<ShippingOption>(
                      style: context.bodyMedium,
                      validator: (val) {
                        if (val == null) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      items: success.shippingOptions!
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                  '${e.name!} - ${e.amount.formatAsPrice(e.region?.currencyCode)}')))
                          .toList(),
                      hint: const Text('Shipping Option'),
                      onChanged: (val) {
                        if (widget.onShippingOptionChanged != null &&
                            !isCustomPrice) {
                          widget.onShippingOptionChanged!(val);
                        }
                        setState(() {
                          shippingOption = val?.copyWith();
                          customShippingOption = val?.copyWith();
                          isCustomPrice = false;
                          customPriceCtrl.clear();
                        });
                      },
                    ),
                    if (!isCustomPrice)
                      Align(
                          alignment: Alignment.centerRight,
                          child: AdaptiveButton(
                              onPressed: shippingOption != null
                                  ? () {
                                      setState(() => isCustomPrice = true);
                                    }
                                  : null,
                              child: const Text('Set custom price'))),
                    if (isCustomPrice)
                      Align(
                        alignment: Alignment.centerRight,
                        child: AdaptiveButton(
                          onPressed: shippingOption != null
                              ? () {
                                  setState(() => isCustomPrice = false);
                                  if (widget.onShippingOptionChanged != null) {
                                    widget.onShippingOptionChanged!(
                                        shippingOption);
                                  }
                                }
                              : null,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.delete_forever,
                                  color: Colors.redAccent),
                              Text(
                                'Delete custom price',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (isCustomPrice)
                      Row(
                        children: [
                          Flexible(
                              child: LabeledTextField(
                            readOnly: true,
                            label: 'Currency',
                            controller: TextEditingController(
                                text:
                                    widget.region?.currencyCode?.toUpperCase()),
                          )),
                          const SizedBox(width: 12.0),
                          Flexible(
                              flex: 4,
                              child: LabeledNumericTextField(
                                label: 'Custom Price',
                                controller: customPriceCtrl,
                                addOrSubtractValue: 100,
                                onChanged: (val) {
                                  final customPrice = val
                                      .replaceAll('.', '')
                                      .replaceAll(',', '');
                                  customShippingOption?.amount =
                                      int.tryParse(customPrice);
                                  if (widget.onShippingOptionChanged != null) {
                                    widget.onShippingOptionChanged!(
                                        customShippingOption);
                                  }
                                },
                                onPlusPressed: () {
                                  var text = customPriceCtrl.text;
                                  text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                  var val = int.tryParse(text);
                                  val ??= 0;
                                  final newVal = (val + 100).formatAsPrice(
                                      widget.region?.currencyCode);
                                  customPriceCtrl.text = newVal;
                                  customShippingOption?.amount = (val + 100);

                                  if (widget.onShippingOptionChanged != null) {
                                    widget.onShippingOptionChanged!(
                                        customShippingOption);
                                  }
                                },
                                onMinusPressed: () {
                                  var text = customPriceCtrl.text;
                                  text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                  var val = int.tryParse(text);
                                  val ??= 0;
                                  if (val < 100) {
                                    return;
                                  }
                                  final newVal = (val - 100).formatAsPrice(
                                      widget.region?.currencyCode);
                                  customPriceCtrl.text = newVal;
                                  customShippingOption?.amount = (val - 100);

                                  if (widget.onShippingOptionChanged != null) {
                                    widget.onShippingOptionChanged!(
                                        customShippingOption);
                                  }
                                },
                                inputFormatters: [
                                  CurrencyTextInputFormatter(
                                      name: widget.region?.currencyCode)
                                ],
                                validator: (val) {
                                  final num = int.tryParse(val
                                          ?.replaceAll('.', '')
                                          .replaceAll(',', '') ??
                                      '');
                                  if (num == null || num == 0) {
                                    return 'Custom price is required';
                                  }
                                  return null;
                                },
                              )),
                        ],
                      ),
                  ],
                );
              }, (error) {
                return Center(
                    child: Column(
                  children: [
                    Text(asyncSnapshot.error.toString()),
                    FilledButton(
                        onPressed: () {
                          shippingOptionsFuture =
                              ShippingOptionsRepo().retrieveAll(queryParams: {
                            'is_return': false,
                            'region_id': widget.region?.id,
                          });
                        },
                        child: const Text('Retry')),
                  ],
                ));
              });
          }
        });
  }
}
