import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddRegionController extends GetxController {
  final titleCtrl = TextEditingController();
  final defaultTaxRateCtrl = TextEditingController();
  final defaultTextCode = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    defaultTaxRateCtrl.dispose();
    defaultTextCode.dispose();
    super.onClose();
  }

  Future<void> createRegion() async {}
}
