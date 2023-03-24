import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(userRepo: UserRepo()));
  }
}
