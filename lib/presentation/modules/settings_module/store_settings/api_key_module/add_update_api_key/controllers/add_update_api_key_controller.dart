import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/domain/use_case/api_key/api_key_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import '../../api_key_management/controllers/api_key_management_controller.dart';

class AddUpdateApiKeyController extends GetxController {
  AddUpdateApiKeyController(
      {required this.apiKeyUseCase, required this.publishableApiKey});
  final ApiKeyUseCase apiKeyUseCase;
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
    final result = await apiKeyUseCase.create(titleCtrl.text);
    result.when((success) {
      EasyLoading.showSuccess('Api key created');
      ApiKeyManagementController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      Get.snackbar('Error creating api key ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }
}
