import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';

import '../controllers/regions_controller.dart';

class RegionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegionsController>(() => RegionsController(regionsRepo: RegionsRepo()));
  }
}
