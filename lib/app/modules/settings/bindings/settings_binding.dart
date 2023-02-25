import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController(authRepo: AuthRepo()));
  }
}
