import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/simple_currency_format.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/labeled_numeric_text_field.dart';

class ChooseShippingOptionView extends StatefulWidget {
  const ChooseShippingOptionView({Key? key, this.onShippingOptionChanged, required this.region}) : super(key: key);
  final void Function(ShippingOption?)? onShippingOptionChanged;
  final Region region;

  @override
  State<ChooseShippingOptionView> createState() => _ChooseShippingOptionViewState();
}

class _ChooseShippingOptionViewState extends State<ChooseShippingOptionView> {
  @override
  void initState() {
    ChooseShippingOptionController.instance.loadShippingMethods(widget.region.id!);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChooseShippingOptionView oldWidget) {
    if (oldWidget.region.id != widget.region.id) {
      ChooseShippingOptionController.instance.loadShippingMethods(widget.region.id!);
    }
    super.didUpdateWidget(oldWidget);
  }

  ShippingOption? shippingOption;
  ShippingOption? customShippingOption;
  bool isCustomPrice = false;
  final customPriceCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final controller = ChooseShippingOptionController.instance;
    const space = Gap(12);
    return controller.obx(
      (state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose Shipping Option', style: smallTextStyle),
            space,
            DropdownButtonFormField<ShippingOption>(
              validator: (val) {
                if (val == null) {
                  return 'Field is required';
                }
                return null;
              },
              items: state!
                  .map((e) => DropdownMenuItem(
                      value: e, child: Text('${e.name!} - ${formatPrice(e.amount, e.region?.currencyCode)}')))
                  .toList(),
              hint: const Text('Shipping Option'),
              onChanged: (val) {
                if (widget.onShippingOptionChanged != null && !isCustomPrice) {
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
                            widget.onShippingOptionChanged!(shippingOption);
                          }
                        }
                      : null,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete_forever, color: Colors.redAccent),
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
                    controller: TextEditingController(text: widget.region.currencyCode?.toUpperCase()),
                  )),
                  const SizedBox(width: 12.0),
                  Flexible(
                      flex: 4,
                      child: LabeledNumericTextField(
                        label: 'Custom Price',
                        controller: customPriceCtrl,
                        addOrSubtractValue: 100,
                        onChanged: (val) {
                          final customPrice = val.replaceAll('.', '').replaceAll(',', '');
                          customShippingOption?.amount = int.tryParse(customPrice);
                          if (widget.onShippingOptionChanged != null) {
                            widget.onShippingOptionChanged!(customShippingOption);
                          }
                        },
                        onPlusPressed: () {
                          var text = customPriceCtrl.text;
                          text = text.replaceAll(RegExp(r'[^0-9]'), '');
                          var val = int.tryParse(text);
                          val ??= 0;
                          final newVal = formatPrice(val + 100, widget.region.currencyCode);
                          customPriceCtrl.text = newVal;
                          customShippingOption?.amount = (val + 100);

                          if (widget.onShippingOptionChanged != null) {
                            widget.onShippingOptionChanged!(customShippingOption);
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
                          final newVal = formatPrice(val - 100, widget.region.currencyCode);
                          customPriceCtrl.text = newVal;
                          customShippingOption?.amount = (val - 100);

                          if (widget.onShippingOptionChanged != null) {
                            widget.onShippingOptionChanged!(customShippingOption);
                          }
                        },
                        inputFormatters: [CurrencyTextInputFormatter(name: widget.region.currencyCode)],
                        validator: (val) {
                          final num = int.tryParse(val?.replaceAll('.', '').replaceAll(',', '') ?? '');
                          if (num == null || num == 0) {
                            return 'Custom price is required';
                          }
                          return null;
                        },
                      )),
                ],
              ),
          ],
        ),
      ),
      onError: (e) => Center(
          child: Column(
        children: [
          Text(e ?? 'Error loading shipping options'),
          AdaptiveFilledButton(
              onPressed: () async => await controller.loadShippingMethods(widget.region.id!),
              child: const Text('Retry')),
        ],
      )),
      onEmpty: const Center(child: Text('No shipping methods!')),
      onLoading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Skeletonizer(
          enabled: true,
          child: LabeledTextField(
            label: 'Choose Shipping Option',
            controller: null,
            decoration: InputDecoration(
              hintText: 'Fake Shipping Option - 15 USD',
              suffixIcon: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseShippingOptionController extends GetxController with StateMixin<List<ShippingOption>> {
  static ChooseShippingOptionController get instance => Get.find<ChooseShippingOptionController>();

  ChooseShippingOptionController({required this.shippingOptionsRepo});
  final ShippingOptionsRepo shippingOptionsRepo;

  Future<void> loadShippingMethods(String regionId) async {
    change(null, status: RxStatus.loading());
    final result = await shippingOptionsRepo.retrieveAll(queryParams: {
      'is_return': false,
      'region_id': regionId,
    });

    result.when((success) {
      if (success.shippingOptions?.isNotEmpty ?? false) {
        change(success.shippingOptions, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }
}
