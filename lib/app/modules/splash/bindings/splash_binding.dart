import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(authRepo: AuthRepo()));
  }
}
