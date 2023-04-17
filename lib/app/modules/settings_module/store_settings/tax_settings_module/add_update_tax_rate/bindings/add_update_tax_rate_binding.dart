import 'package:get/get.dart';

import '../../../../../../data/repository/tax_rate/tax_rate_repo.dart';
import '../controllers/add_update_tax_rate_controller.dart';

class AddUpdateTaxRateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateTaxRateController>(() => AddUpdateTaxRateController(taxRateRepo: TaxRateRepo()));
  }
}
