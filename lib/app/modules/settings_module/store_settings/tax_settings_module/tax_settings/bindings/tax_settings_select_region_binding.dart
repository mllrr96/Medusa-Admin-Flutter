import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import '../controllers/tax_settings_select_region_controller.dart';

class TaxSettingsSelectRegionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxSettingsSelectRegionController>(() => TaxSettingsSelectRegionController(regionsRepo: RegionsRepo()));
  }
}
