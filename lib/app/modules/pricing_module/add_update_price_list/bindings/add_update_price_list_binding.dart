import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';

import '../controllers/add_update_price_list_controller.dart';

class AddUpdatePriceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdatePriceListController>(() => AddUpdatePriceListController(priceListRepo: PriceListRepo()));
  }
}
