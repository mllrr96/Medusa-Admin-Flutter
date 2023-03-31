import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/choose_region_view.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/controllers/create_draft_order_controller.dart';

class ChooseShippingMethodView extends StatelessWidget {
  const ChooseShippingMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return GetBuilder<ChooseShippingMethodController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: controller.obx(
            (state) => ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: [
                Text('Choose Shipping Option', style: largeTextStyle),
                space,
                Form(
                  key: controller.keyForm,
                  child: DropdownButtonFormField(
                    validator: (val) {
                      if (val == null) {
                        return 'Field is required';
                      }
                      return null;
                    },
                    items: state!.map((e) => DropdownMenuItem(value: e, child: Text(e.name!))).toList(),
                    hint: const Text('Shipping Option'),
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedShippingOption.value = value;
                        CreateDraftOrderController.instance.update([0]);
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onError: (e) => Center(
                child: Column(
              children: [
                Text(e ?? 'Error loading shipping options'),
                AdaptiveButton(
                    onPressed: () async => await controller.loadShippingMethods(), child: const Text('Retry')),
              ],
            )),
            onEmpty: const Center(child: Text('No shipping methods!')),
            onLoading: const Center(child: CircularProgressIndicator.adaptive()),
          )),
        );
      },
    );
  }
}

class ChooseShippingMethodController extends GetxController with StateMixin<List<ShippingOption>> {
  static ShippingOption? get shippingOption => Get.find<ChooseShippingMethodController>().selectedShippingOption.value;
  static ChooseShippingMethodController instance = Get.find<ChooseShippingMethodController>();

  ChooseShippingMethodController({required this.shippingOptionsRepo});
  final ShippingOptionsRepo shippingOptionsRepo;
  // ignore: unnecessary_cast
  Rx<ShippingOption?> selectedShippingOption = (null as ShippingOption?).obs;
  final keyForm = GlobalKey<FormState>();

  Future<void> loadShippingMethods({String? regionId}) async {
    change(null, status: RxStatus.loading());
    final result = await shippingOptionsRepo.retrieveAll(queryParams: {
      'is_return': false,
      'region_id': regionId ?? ChooseRegionController.region?.id,
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
