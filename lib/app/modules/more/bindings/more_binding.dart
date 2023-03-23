import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/modules/more/controller/more_controller.dart';

class MoreBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MoreController>(() => MoreController(authRepo: AuthRepo()));
  }
}