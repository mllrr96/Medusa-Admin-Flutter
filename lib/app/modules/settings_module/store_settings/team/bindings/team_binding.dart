import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

import '../controllers/team_controller.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamController>(() => TeamController(userRepo: UserRepo()));
  }
}
