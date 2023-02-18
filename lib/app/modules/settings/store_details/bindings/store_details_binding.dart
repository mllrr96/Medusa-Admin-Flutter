import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';

import '../controllers/store_details_controller.dart';

class StoreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailsController>(
      () => StoreDetailsController(storeRepo: StoreRepo()),
    );
  }
}
