import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../data/repository/auth/auth_repo.dart';
import '../../../data/repository/store/store_repo.dart';
import '../../../data/service/storage_service.dart';
import '../../../data/service/store_service.dart';

class SplashController extends GetxController {
  SplashController({required this.authRepo});
  final AuthRepo authRepo;

  @override
  void onReady() async {
    super.onReady();
    String? cookie = StorageService.cookie;
    if (cookie == null) {
      Get.offAllNamed(Routes.SIGN_IN);
      return;
    }

    final result = await authRepo.getSession();

    result.when((success) async {
      if (success.user == null) {
        Get.offAllNamed(Routes.SIGN_IN);
        return;
      }
      await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init());
      Get.offAllNamed(Routes.DASHBOARD);
    }, (error) async {
      if (error.code == 401 || error.code == 404) {
        await StorageService.instance.clearCookie();
      }
      debugPrint(error.toString());
      Get.offAllNamed(Routes.SIGN_IN);
    });
  }
}
