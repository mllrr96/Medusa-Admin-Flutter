import 'package:get/get.dart';

import '../controllers/tax_settings_controller.dart';

class TaxSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxSettingsController>(
      () => TaxSettingsController(),
    );
  }
}
