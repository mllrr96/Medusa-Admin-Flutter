import 'dart:async';

import 'package:get/get.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    Timer(const Duration(milliseconds: 500), () => Get.offAllNamed(Routes.SIGN_IN));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
