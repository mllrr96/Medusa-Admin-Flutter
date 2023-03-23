import 'package:get/get.dart';

import '../../../../../../data/models/store/region.dart';
import '../../../../../../data/repository/regions/regions_repo.dart';


class RegionDetailsController extends GetxController with StateMixin<Region> {
  RegionDetailsController({required this.regionsRepo});
  final RegionsRepo regionsRepo;
  late String regionId;

  @override
  Future<void> onInit() async {
    regionId = Get.arguments ?? '';
    await loadRegion();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadRegion() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo
        .retrieve(id: regionId, queryParams: {'expand': 'countries,tax_rates,payment_providers,fulfillment_providers'});

    result.when(
      (success) => change(success.region!, status: RxStatus.success()),
      (error) => change(null, status: RxStatus.error(error.message)),
    );
  }
}
