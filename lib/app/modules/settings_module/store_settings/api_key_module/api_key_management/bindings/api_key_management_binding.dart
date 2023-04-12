import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/publishable_api_key/publishable_api_key_repo.dart';

import '../controllers/api_key_management_controller.dart';

class ApiKeyManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiKeyManagementController>(
      () => ApiKeyManagementController(apiKeyRepo: PublishableApiKeyRepo())
    );
  }
}
