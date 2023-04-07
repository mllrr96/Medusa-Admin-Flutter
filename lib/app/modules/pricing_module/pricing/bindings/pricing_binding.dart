import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';

import '../controllers/pricing_controller.dart';

class PricingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricingController>(() => PricingController(priceListRepo: PriceListRepo()));
  }
}
