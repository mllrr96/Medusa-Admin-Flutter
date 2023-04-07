import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';

import '../controllers/price_list_details_controller.dart';

class PriceListDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceListDetailsController>(() => PriceListDetailsController(priceListRepo: PriceListRepo()));
  }
}
