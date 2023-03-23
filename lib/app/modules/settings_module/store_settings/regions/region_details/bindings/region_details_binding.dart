import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';

import '../controllers/region_details_controller.dart';

class RegionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegionDetailsController>(() => RegionDetailsController(regionsRepo: RegionsRepo()));
  }
}
