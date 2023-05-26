import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/index.dart';
import '../../../../data/repository/regions/regions_repo.dart';
import '../components/choose_customer.dart';

class CreateDraftOrderController extends GetxController with GetSingleTickerProviderStateMixin {
  CreateDraftOrderController({required this.regionsRepo});
  static CreateDraftOrderController get instance => Get.find<CreateDraftOrderController>();
  late TabController tabController;
  var selectedProducts = <ProductVariant>[];
  RxInt index = 0.obs;
  final RegionsRepo regionsRepo;
  Rx<List<Region>?> regions = (null as List<Region>?).obs;

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
  Future<void> _loadRegions() async {
    // regions = null;
    //
    // final result = await regionsRepo.retrieveAll();
    //
    // result.when((success) {
    //   regions.value = <Region>[];
    //   regions.value?.addAll(success.regions!);
    // },
    //         (error) => );
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
        if(ChooseCustomerController.instance.selectedCustomer.value !=null){
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
