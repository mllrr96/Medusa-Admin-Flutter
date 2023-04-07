import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/tax_rate/tax_rate_repo.dart';
import '../controllers/tax_settings_controller.dart';

class TaxSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxSettingsController>(() => TaxSettingsController(taxRateRepo: TaxRateRepo()));
  }
}
