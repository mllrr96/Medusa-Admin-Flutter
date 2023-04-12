import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/publishable_api_key/publishable_api_key_repo.dart';

import '../controllers/add_update_api_key_controller.dart';

class AddUpdateApiKeyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateApiKeyController>(
      () => AddUpdateApiKeyController(publishableApiKeyRepo: PublishableApiKeyRepo()),
    );
  }
}
