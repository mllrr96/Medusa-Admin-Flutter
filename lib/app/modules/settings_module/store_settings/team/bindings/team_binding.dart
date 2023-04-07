import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/invite/invite_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/team/controllers/invite_controller.dart';

import '../controllers/team_controller.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamController>(() => TeamController(userRepo: UserRepo()));
    Get.lazyPut<InviteController>(() => InviteController(inviteRepo: InviteRepo()));
  }
}
