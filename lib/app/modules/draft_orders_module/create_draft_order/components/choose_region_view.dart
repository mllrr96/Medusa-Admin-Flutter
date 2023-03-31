import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/choose_shipping_method.dart';
import '../../../../data/repository/regions/regions_repo.dart';

class ChooseRegionView extends GetView<ChooseRegionController> {
  const ChooseRegionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      body: controller.obx(
        (state) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: [
            Text('Choose region', style: largeTextStyle),
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
                hint: const Text('Region'),
                onChanged: (value) async {
                  if (value != null) {
                    controller.selectedRegion.value = value;
                    await Get.find<ChooseShippingMethodController>().loadShippingMethods(regionId: value.id!);
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
        onError: (e) => Center(child: Text(e ?? 'Error loading regions')),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}

class ChooseRegionController extends GetxController with StateMixin<List<Region>> {
  static Region? get region => Get.find<ChooseRegionController>().selectedRegion.value;
  static ChooseRegionController instance = Get.find<ChooseRegionController>();

  ChooseRegionController({required this.regionsRepo});
  final RegionsRepo regionsRepo;
  // ignore: unnecessary_cast
  Rx<Region?> selectedRegion = (null as Region?).obs;
  final keyForm = GlobalKey<FormState>();
  @override
  Future<void> onInit() async {
    await _loadRegions();
    super.onInit();
  }

  Future<void> _loadRegions() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo.retrieveAll();

    result.when((success) => change(success.regions ?? [], status: RxStatus.success()),
        (error) => change(null, status: RxStatus.error(error.message)));
  }

  bool validate() {
    return keyForm.currentState!.validate();
  }
}
