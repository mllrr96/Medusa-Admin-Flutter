import 'package:get/get.dart';

import '../controllers/app_settings_controller.dart';

class AppSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSettingsController>(
      () => AppSettingsController(),
    );
  }
}
