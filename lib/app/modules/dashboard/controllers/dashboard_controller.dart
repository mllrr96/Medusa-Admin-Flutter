import 'package:get/get.dart';
import '../../../data/service/storage_service.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find<DashboardController>();
  int currentScreen = 0;
  final appSettings = StorageService.appSettings;


  void onTap(int index) {
    currentScreen = index;
    update();
  }
}
