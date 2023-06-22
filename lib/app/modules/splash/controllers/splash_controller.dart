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
    final isDrawer = StorageService.appSettings.isDrawer;
    if (cookie != null) {
      try {
        await authRepo.getSession();
        await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init());
        if (isDrawer) {
          Get.offAllNamed(Routes.ORDERS);
        } else {
          Get.offAllNamed(Routes.DASHBOARD);
        }
      } catch (e) {
        await StorageService.instance.clearCookie();
        Get.offAllNamed(Routes.SIGN_IN);
      }
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }
}
