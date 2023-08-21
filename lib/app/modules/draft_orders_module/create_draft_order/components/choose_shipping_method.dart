import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/custom_text_field.dart';

class ChooseShippingMethodView extends StatefulWidget {
  const ChooseShippingMethodView(
      {Key? key, this.onShippingMethodChanged, required this.regionId})
      : super(key: key);
  final void Function(ShippingOption?)? onShippingMethodChanged;
  final String regionId;

  @override
  State<ChooseShippingMethodView> createState() =>
      _ChooseShippingMethodViewState();
}

class _ChooseShippingMethodViewState extends State<ChooseShippingMethodView> {
  @override
  void initState() {
    ChooseShippingMethodController.instance
        .loadShippingMethods(widget.regionId);
    super.initState();
  }


@override
  void didUpdateWidget(covariant ChooseShippingMethodView oldWidget) {
    if(oldWidget.regionId != widget.regionId){
      ChooseShippingMethodController.instance
          .loadShippingMethods(widget.regionId);
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return GetBuilder<ChooseShippingMethodController>(
      builder: (controller) {
        return controller.obx(
          (state) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose Shipping Option', style: smallTextStyle),
                space,
                DropdownButtonFormField(
                  validator: (val) {
                    if (val == null) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  items: state!
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                              '${e.name!} ${e.amount ?? ''} ${e.region?.currencyCode?.toUpperCase() ?? ''}')))
                      .toList(),
                  hint: const Text('Shipping Option'),
                  onChanged: widget.onShippingMethodChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
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
      },
    );
  }
}

class ChooseShippingMethodController extends GetxController
    with StateMixin<List<ShippingOption>> {
  static ChooseShippingMethodController get instance =>
      Get.find<ChooseShippingMethodController>();

  ChooseShippingMethodController({required this.shippingOptionsRepo});
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
