import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/choose_region_view.dart';

class CreateDraftOrderController extends GetxController with GetSingleTickerProviderStateMixin {
  CreateDraftOrderController();
  late TabController tabController;
  RxInt index = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      index.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void Function()? onNextTap() {
    switch (tabController.index) {
      case 0:
        if (ChooseRegionController.region != null) {
          return () => tabController.animateTo(tabController.index + 1);
        } else {
          return null;
        }
      case 1:
      case 2:
      case 3:
      case 4:
    }

    return null;
  }
}
