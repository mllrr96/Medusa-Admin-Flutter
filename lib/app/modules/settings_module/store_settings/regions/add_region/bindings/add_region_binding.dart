import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';

import '../controllers/add_region_controller.dart';

class AddRegionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRegionController>(() => AddRegionController(regionsRepo: RegionsRepo()));
  }
}
