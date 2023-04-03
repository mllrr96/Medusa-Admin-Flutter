import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/index.dart';
import '../../../../data/models/store/product_variant.dart';
import '../components/choose_customer.dart';

class CreateDraftOrderController extends GetxController with GetSingleTickerProviderStateMixin {
  static final CreateDraftOrderController instance = Get.find<CreateDraftOrderController>();
  late TabController tabController;
  var selectedProducts = <ProductVariant>[];
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
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void Function()? onNextTap() {
    switch (index.value) {
      case 0:
        if (ChooseRegionController.region != null) {
          return () => tabController.animateTo(tabController.index + 1);
        } else {
          return null;
        }
      case 1:
        if (selectedProducts.isNotEmpty) {
          return () => tabController.animateTo(tabController.index + 1);
        } else {
          return null;
        }
      case 2:
        if (ChooseShippingMethodController.shippingOption != null) {
          return () => tabController.animateTo(tabController.index + 1);
        } else {
          return null;
        }
      case 3:
        if(Get.find<ChooseCustomerController>().selectedCustomer.value !=null){
          return () => tabController.animateTo(tabController.index + 1);
        }
         else {
           return null;
        }
      case 4:
      default:
        return null;
    }
  }
}
