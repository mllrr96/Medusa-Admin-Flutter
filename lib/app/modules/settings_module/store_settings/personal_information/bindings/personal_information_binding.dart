import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/auth/auth_repo.dart';
import 'package:medusa_admin/app/data/repository/user/user_repo.dart';

import '../controllers/personal_information_controller.dart';

class PersonalInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInformationController>(() => PersonalInformationController(userRepo: UserRepo(), authRepo: AuthRepo()));
  }
}
