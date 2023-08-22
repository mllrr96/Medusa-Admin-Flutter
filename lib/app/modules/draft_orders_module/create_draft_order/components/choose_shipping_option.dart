import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/custom_text_field.dart';

class ChooseShippingOptionView extends StatefulWidget {
  const ChooseShippingOptionView(
      {Key? key, this.onShippingOptionChanged, required this.regionId})
      : super(key: key);
  final void Function(ShippingOption?)? onShippingOptionChanged;
  final String regionId;

  @override
  State<ChooseShippingOptionView> createState() =>
      _ChooseShippingOptionViewState();
}

class _ChooseShippingOptionViewState extends State<ChooseShippingOptionView> {
  @override
  void initState() {
    ChooseShippingOptionController.instance
        .loadShippingMethods(widget.regionId);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChooseShippingOptionView oldWidget) {
    if (oldWidget.regionId != widget.regionId) {
      ChooseShippingOptionController.instance
          .loadShippingMethods(widget.regionId);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final controller = ChooseShippingOptionController.instance;
    const space = SizedBox(height: 12.0);

    String getCurrencyText(ShippingOption shippingOption) {
      var value = shippingOption.amount?.roundToDouble() ?? 0.0;
      final valueFormatter =
          NumberFormat.currency(name: shippingOption.region?.currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

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
                      value: e,
                      child: Text('${e.name!} - ${getCurrencyText(e)}')))
                  .toList(),
              hint: const Text('Shipping Option'),
              onChanged: widget.onShippingOptionChanged,
            ),
          ],
        ),
      ),
      onError: (e) => Center(
          child: Column(
        children: [
          Text(e ?? 'Error loading shipping options'),
          AdaptiveFilledButton(
              onPressed: () async =>
                  await controller.loadShippingMethods(widget.regionId),
              child: const Text('Retry')),
        ],
      )),
      onEmpty: const Center(child: Text('No shipping methods!')),
      onLoading: const Skeletonizer(
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
    );
  }
}

class ChooseShippingOptionController extends GetxController
    with StateMixin<List<ShippingOption>> {
  static ChooseShippingOptionController get instance =>
      Get.find<ChooseShippingOptionController>();

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
