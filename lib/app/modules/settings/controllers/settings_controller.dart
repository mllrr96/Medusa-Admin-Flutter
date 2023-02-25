import 'package:get/get.dart';

import '../../../../core/utils/enums.dart';
import '../../../data/service/storage_service.dart';

class SettingsController extends GetxController {
  late AppearanceMode appearanceMode;
  bool isSuperAdmin = false;

  @override
  Future<void> onInit() async {
    appearanceMode = StorageService.instance.loadAppearance();
    super.onInit();
  }

  Future<void> changeAppearance(AppearanceMode appearanceMode) async {
    await StorageService.instance.saveAppearance(appearanceMode);
    this.appearanceMode = appearanceMode;
    update();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
