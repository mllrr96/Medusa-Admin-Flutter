import 'package:get/get.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/store/store_repo.dart';
import '../../../data/service/store_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    //TODO: Make the method more robust
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString('Cookie');
    if (cookie != null) {
      await Get.putAsync(() => StoreService(storeRepo: StoreRepo()).init(), permanent: true);
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }
}
