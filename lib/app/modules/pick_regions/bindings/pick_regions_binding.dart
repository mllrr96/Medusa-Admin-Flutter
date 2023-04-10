import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';

import '../controllers/pick_regions_controller.dart';

class PickRegionsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PickRegionsController>(() => PickRegionsController(regionsRepo: RegionsRepo()));
  }
}
