import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/api_key_module/api_key_management/controllers/api_key_management_controller.dart';
import '../../../../../../data/models/store/publishable_api_key.dart';
import '../../../../../../data/repository/publishable_api_key/publishable_api_key_repo.dart';

class AddUpdateApiKeyController extends GetxController {
  AddUpdateApiKeyController({required this.publishableApiKeyRepo, required this.publishableApiKey});
  final PublishableApiKeyRepo publishableApiKeyRepo;
  final PublishableApiKey? publishableApiKey;
  bool get updateMode => publishableApiKey != null;
  final titleCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    titleCtrl.dispose();
    super.onClose();
  }

  Future<void> publish(BuildContext context) async {
    if (!keyForm.currentState!.validate()) {
      return;
    }
    loading();
    final result = await publishableApiKeyRepo.createPublishableApiKey(title: titleCtrl.text);
    result.when((success) {
      EasyLoading.showSuccess('Api key created');
      ApiKeyManagementController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      Get.snackbar('Error creating api key ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }
}
